using GLib;

public class IdeaPadConfigTool.FnLock : IdeaPadMode {

    /*
        Check if kernel module for Lenovo IdeaPad is loaded...
        Return true if is loaded. False if not.
    */
    public  bool check_module() {
        return true;
    }

    /*
        Obtain the actual status of battery mode in the system
        return 0 for DISABLE | 1 for ENABLE |  Other thing is UNKNOW
    */
    public  int get_status() {
        int status = check_status();
        if(status == 0) {
            return IdeaPadUtils.STATUS.DISABLE;
        } else if(status == 1) {
            return IdeaPadUtils.STATUS.ENABLE;
        } else {
            return IdeaPadUtils.STATUS.UNKNOW;
        }
    }
    /*
        Get the content of file fn_lock over cat command and bring back their value like an integer.
        1 is enable | 0 is disable
    */
    public  int check_status() {
        int result = -1;
        if(file_exists() == true) {
            try{

                string stdout, stderr;
                int status;
                Process.spawn_command_line_sync (IdeaPadUtils.CMD_FNLOCK_STATUS, out stdout, out stderr, out status);
                if(status == 0) {
                    stdout = stdout.strip();
                    result = int.parse(stdout);
                }
            } catch(Error e) {
                error("Cannot read the file: Error in file: BatteryConservative.vala Function: check_status()");
                //stdout.printf(e.message);
            }
        }
        return result;
    }
    /*
        Edit the file using Poolkit pkexec, bash and echo. If actual status if ENABLE change to DISABLE or vice versa
    */
    public bool change_mode(int actual_status) {
        string stdout, stderr, cmd = "";
		int status;
		bool result = false;

		if(actual_status == IdeaPadUtils.STATUS.ENABLE) {
			cmd = IdeaPadUtils.CMD_ENABLE_FNLOCK;
		} else if(actual_status == IdeaPadUtils.STATUS.DISABLE) {
			cmd = IdeaPadUtils.CMD_DISABLE_FNLOCK;
		}

		try {
			Process.spawn_command_line_sync (cmd, out stdout, out stderr, out status);
			if (status == 0) {
			    result = true;
			} if(status != 0) {
			    return false;
			}
		} catch (SpawnError e) {
			error("Error in attemp change file at BatteryConservative.vala in change_mode(): %s\n", e.message);
		}

		return result;
	}
    /*
        Check if conservative_mode file exists in the filesystem
        Return true if file exists, false if not.
    */
    public  bool file_exists() {
        File f = File.new_for_path(IdeaPadUtils.FN_LOCK_MODE_FILE);
        return f.query_exists();
    }

    /*
        Call get_status() and switch the mode.
        Return true if success false if fails.
        And print error if something goes grong.
    */
    public  bool switch_mode() {
        bool result = false;
        int status = get_status();

        if(status == IdeaPadUtils.STATUS.ENABLE) {
            result = change_mode(IdeaPadUtils.STATUS.DISABLE);
        } else if(status == IdeaPadUtils.STATUS.DISABLE) {
            result = change_mode(IdeaPadUtils.STATUS.ENABLE);
        } else {
            error("Cannot switch, something goes grong with change_mode() function...");
        }
        return result;
    }

    public void send_on_notification() {
        Notification.prepared("fnlock", "on");
    }
    public void send_off_notification() {
        Notification.prepared("fnlock", "off");
    }

    public void send_fail_notification() {
        Notification.prepared("fnlock", "fail");
    }

}
