From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 04/10] dt/bindings: Add binding for BCM2835 mailbox power channel driver
Date: Mon,  2 Mar 2015 12:54:38 -0800
Message-ID: <1425329684-23968-5-git-send-email-eric@anholt.net>
References: <1425329684-23968-1-git-send-email-eric@anholt.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425329684-23968-1-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I was tempted to have the mailbox power channel support just be in the
2835 mailbox driver itself, but mbox_request_channel() wants its
device to have the "mboxes" node, and that appears to be only intended
for mailbox clients, not controllers.

Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
---
 .../bindings/mailbox/brcm,bcm2835-mbox-power.txt           | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox-power.txt

diff --git a/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox-power.txt b/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox-power.txt
new file mode 100644
index 0000000..83446ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox-power.txt
@@ -0,0 +1,14 @@
+Broadcom BCM2835 VideoCore mailbox power channel IPC
+
+Required properties:
+
+- compatible : Should be "brcm,bcm2835-mbox-power"
+- mboxes: Single-entry list which specifies which mailbox controller
+  and channel is the power channel.
+
+Example:
+
+mailbox-power {
+	compatible = "brcm,bcm2835-mbox-power";
+	mboxes = <&mailbox 0>
+};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
