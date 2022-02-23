public interface IdeaPadConfigTool.IdeaPadMode {

    public abstract bool check_module();
    public abstract int get_status();
    public abstract int check_status();
    public abstract bool change_mode(int actual_status);
    public abstract bool file_exists();
    public abstract bool switch_mode();

}
