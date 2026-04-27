import Component from "@glimmer/component";
import { service } from "@ember/service";
import icon from "discourse/helpers/d-icon";

export default class NotificationBellIcon extends Component {
  static shouldRender(args, context) {
    return !!context.currentUser;
  }

  @service currentUser;

  get hasUnread() {
    const u = this.currentUser;
    if (!u) {
      return false;
    }
    return (
      (u.all_unread_notifications_count || 0) +
        (u.unread_high_priority_notifications || 0) +
        (u.unread_notifications || 0) >
      0
    );
  }

  <template>
    <li class="mc-notification-bell">
      <a
        class="btn no-text icon btn-flat"
        href="/my/notifications"
        title="Notifications"
        aria-label="Notifications"
      >
        {{icon "bell"}}
        {{#if this.hasUnread}}
          <span class="mc-notification-bell__dot" aria-hidden="true"></span>
        {{/if}}
      </a>
    </li>
  </template>
}
