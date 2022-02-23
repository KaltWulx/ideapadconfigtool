using Gtk;
using Granite;

public class IdeaPadConfigTool.WidgetIdeaPadMode : Gtk.Grid {


    private string icon_name {get; set;}
	private string description {get; set;}
	public Gtk.Switch switch_mode {get; set;}
	private string tooltip_string;

    public WidgetIdeaPadMode(string icon_name, string description, string tooltip_string) {

        this.icon_name = icon_name;
		this.description = description;
		this.tooltip_string = tooltip_string;

        initComponent();
    }

    private void initComponent() {

        //row_homogeneous = true;
		column_homogeneous = true;

        var lb_description = new Gtk.Label(description);
		lb_description.use_markup = true;

		var icon = new Gtk.Image () {
    		gicon = new ThemedIcon (icon_name),
    		pixel_size = 32
		};
		switch_mode = new Gtk.Switch();

		var label_and_icon = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 5);
		label_and_icon.halign = Gtk.Align.START;
		label_and_icon.valign = Gtk.Align.CENTER;

		var box_switch = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
		box_switch.halign = Gtk.Align.END;
		box_switch.valign = Gtk.Align.CENTER;
		box_switch.hexpand = false;
		box_switch.vexpand = false;
		box_switch.add(switch_mode);
		box_switch.set_tooltip_text (tooltip_string);

		//var grid_aux = new Gtk.Grid();
		//grid_aux.attach(icon, 0,0,1,1);
		//grid_aux.attach(lb_description, 1,0,1,1);

        label_and_icon.add(icon);
        label_and_icon.add(lb_description);

		attach(label_and_icon, 0,0,1,1);
		attach(box_switch, 1,0,1,1);
    }



}
