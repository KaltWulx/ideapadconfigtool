using GLib;
public class IdeaPadConfigTool.Notification {

    public static void send(string name, string body, string icon_name ) {
        var notification = new GLib.Notification (name);
        notification.set_body (body);
        notification.set_icon (new ThemedIcon (icon_name));
        notification.set_priority (GLib.NotificationPriority.NORMAL);
        GLib.Application.get_default().send_notification("com.github.KaltWulx.ideapadconfigtool", notification);
    }

    public static void prepared(string mode, string action) {
        string fail = _("A error has occurred!");
        if(mode == "battery-mode") {
            string title = _("IdeaPadConfigTool: Battery Mode");
            string body ="";
            string icon_name="";

            if(action == "on") {
                body = _("Battery Mode is enable!");
                icon_name = "emblem-enabled";
            } else if(action == "off") {
                body = _("Battery Mode is disable!");
                icon_name = "emblem-disabled";
            } else if(action == "fail") {
                body = fail;
                icon_name = "emblem-error";
            }
            send(title, body, icon_name);

        } else if(mode == "usb-charging") {
            string title = _("IdeaPadConfigTool: USB Charging Mode");
           string body ="";
            string icon_name="";

            if(action == "on") {
                body = _("USB Charging mode is enable!");
                icon_name = "emblem-enabled";
            } else if(action == "off") {
                body = _("USB Charging Mode is disable!");
                icon_name = "emblem-disabled";
            } else if(action == "fail") {
                body = fail;
                icon_name = "emblem-error";
            }
            send(title, body, icon_name);

        } else if(mode == "fnlock") {
            string title = _("IdeaPadConfigTool: FN Lock Mode");
            string body ="";
            string icon_name="";

            if(action == "on") {
                body = _("FN Lock mode is enable!");
                icon_name = "emblem-enabled";
            } else if(action == "off") {
                body = _("FN Lock mode is disable!");
                icon_name = "emblem-disabled";
            } else if(action == "fail") {
                body = fail;
                icon_name = "emblem-error";
            }
            send(title, body, icon_name);
        }
    }

}
