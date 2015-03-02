From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 08/10] dt/bindings: Add binding for BCM2835 mailbox property
 channel driver
Date: Mon,  2 Mar 2015 12:54:42 -0800
Message-ID: <1425329684-23968-9-git-send-email-eric@anholt.net>
References: <1425329684-23968-1-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1425329684-23968-1-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

I was tempted to have the mailbox property channel support just be in
the 2835 mailbox driver itself, but mbox_request_channel() wants its
device to have the "mboxes" node, and that appears to be only intended
for mailbox clients, not controllers.

Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
---
 .../bindings/mailbox/brcm,bcm2835-mbox-property.txt        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox-property.txt

diff --git a/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox-property.txt b/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox-property.txt
new file mode 100644
index 0000000..daed1cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox-property.txt
@@ -0,0 +1,14 @@
+Broadcom BCM2835 VideoCore mailbox property channel IPC
+
+Required properties:
+
+- compatible : Should be "brcm,bcm2835-mbox-property"
+- mboxes: Single-entry list which specifies which mailbox controller
+  and channel is the property channel.
+
+Example:
+
+mailbox-property {
+	compatible = "brcm,bcm2835-mbox-property";
+	mboxes = <&mailbox 8>
+};
-- 
2.1.4
