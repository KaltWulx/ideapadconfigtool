using Gtk;
using Granite;

public class IdeaPadConfigTool.UIMainIdeaPadConfigTool : Gtk.Application {

    private Gtk.ApplicationWindow window;
    private Gtk.HeaderBar header_bar;
    private WidgetIdeaPadMode batt_mode_view;
    private WidgetIdeaPadMode usb_charging_view;
    private WidgetIdeaPadMode fn_lock_view;


    public UIMainIdeaPadConfigTool() {
        application_id = "com.github.KaltWulx.ideapadconfigtool";
        flags |= GLib.ApplicationFlags.HANDLES_OPEN;
    }

    protected override void activate() {
        initComponents();
        load_controllers();
    }

    private void initComponents() {

        batt_mode_view = new WidgetIdeaPadMode(
            "battery-good-charging",
            _("Battery Conservative Mode"),
            _("Active or inactive battery conservative mode"));

        fn_lock_view = new WidgetIdeaPadMode(
            "preferences-desktop-keyboard",
            _("FN Lock"),
            _("Active or inactive FN Lock"));

        usb_charging_view = new WidgetIdeaPadMode(
            "drive-removable-media-usb",
            _("USB Charging Mode"),
            _("Active or inactive the USB charging mode"));

        window = new Gtk.ApplicationWindow (this);
		window.window_position = Gtk.WindowPosition.CENTER;
		window.set_default_size (540, 220);

		header_bar = new Gtk.HeaderBar();
        header_bar.show_close_button = true;
        header_bar.title = _("Lenovo IdeaPad Config Tool");


        var vbox = new Gtk.Box(Gtk.Orientation.VERTICAL, 10);
        vbox.valign = Gtk.Align.CENTER;
        vbox.halign = Gtk.Align.CENTER;

        vbox.add(batt_mode_view);
        vbox.add(usb_charging_view);
        vbox.add(fn_lock_view);



        window.add(vbox);
        window.set_titlebar(header_bar);
        window.set_resizable(false);
        window.show_all();

        var granite_settings = Granite.Settings.get_default ();
        var gtk_settings = Gtk.Settings.get_default ();
        gtk_settings.gtk_application_prefer_dark_theme = granite_settings.prefers_color_scheme == Granite.Settings.ColorScheme.DARK;
        granite_settings.notify["prefers-color-scheme"].connect (() => {
            gtk_settings.gtk_application_prefer_dark_theme = granite_settings.prefers_color_scheme == Granite.Settings.ColorScheme.DARK;
        });
    }

    private void load_controllers() {

        var batt_conservative_model = new BatteryConservative();
        var batt_conservative_controller = new ControllerBatteryConservative(batt_conservative_model, batt_mode_view);
        batt_conservative_controller.init_controller();

        var usb_charging_model = new USBCharging();
        var usb_charging_controller = new ControllerUSBCharging(usb_charging_model, usb_charging_view);
        usb_charging_controller.init_controller();

        var fn_lock_model = new FnLock();
        var fn_lock_controller = new ControllerFnLock(fn_lock_model, fn_lock_view);
        fn_lock_controller.init_controller();
    }
}
