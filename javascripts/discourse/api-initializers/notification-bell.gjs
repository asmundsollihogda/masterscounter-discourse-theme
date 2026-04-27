import { withPluginApi } from "discourse/lib/plugin-api";
import NotificationBellIcon from "../components/notification-bell-icon";

export default {
  name: "mc-notification-bell",
  initialize() {
    withPluginApi("1.13.0", (api) => {
      api.headerIcons.add("mc-notification-bell", NotificationBellIcon, {
        before: ["user-menu"],
      });
    });
  },
};
