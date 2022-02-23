public class IdeaPadConfigTool.ControllerFnLock {
    private FnLock model;
    private WidgetIdeaPadMode view;

    public ControllerFnLock(FnLock model, WidgetIdeaPadMode view) {
            this.model = model;
            this.view = view;
    }

    public void init_controller() {
        set_actual_status();
        Gtk.Switch sw = view.switch_mode;
        sw.notify["active"].connect(() => {
            if(sw.active == true) {
                bool result = model.switch_mode();
                if(result) {
                    send_on_notification();
                } else {
                    send_fail_notification();
                }
            } else {
                bool result = model.switch_mode();
                if(result) {
                    send_off_notification();
                } else {
                    send_fail_notification();
                }
            }
        });
    }
    private void send_off_notification() {
        model.send_off_notification();
    }
    private void send_fail_notification() {
        model.send_fail_notification();
    }
    private void send_on_notification() {
        model.send_on_notification();
    }

    private bool set_actual_status() {
        bool status = false;
        Gtk.Switch sw = view.switch_mode;
        int actual_status = model.get_status();
        if(actual_status == IdeaPadUtils.STATUS.ENABLE) {
            sw.active = true;
            status = true;
        } else if(actual_status == IdeaPadUtils.STATUS.DISABLE) {
            sw.active = false;
            status = false;
        }
        return status;
    }
}
