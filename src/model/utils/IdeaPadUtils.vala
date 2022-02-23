public class IdeaPadConfigTool.IdeaPadUtils {
    public const string CONSERVATIVE_MODE_FILE = "";
    public const string USB_CHARGING_MODE_FILE = "";
    public const string FN_LOCK_MODE_FILE = "";

    public enum STATUS { DISABLE, ENABLE, UNKNOW }

    public const string CMD_BATT_STATUS = "cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode";
    public const string CMD_FNLOCK_STATUS = "cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/fn_lock";
    public const string CMD_USBCHARGING_STATUS = "cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/usb_charging";

    public const string CMD_ENABLE_BATT = "pkexec  bash -c 'echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:*/conservation_mode'";
    public const string CMD_DISABLE_BATT = "pkexec  bash -c 'echo 0 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:*/conservation_mode'";

    public const string CMD_ENABLE_FNLOCK = "pkexec  bash -c 'echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:*/fn_lock'";
    public const string CMD_DISABLE_FNLOCK = "pkexec  bash -c 'echo 0 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:*/fn_lock'";

    public const string CMD_ENABLE_USBCHARGING = "pkexec  bash -c 'echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:*/usb_charging'";
    public const string CMD_DISABLE_USBCHARGING = "pkexec  bash -c 'echo 0 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:*/usb_charging'";

}
