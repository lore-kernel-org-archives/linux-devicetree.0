From: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v1 1/4] dt-bindings: Document Broadcom iProc mailbox controller driver
Date: Tue, 18 Oct 2016 12:00:35 -0700
Message-ID: <1476817238-1226-2-git-send-email-jonathan.richardson@broadcom.com>
References: <1476817238-1226-1-git-send-email-jonathan.richardson@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476817238-1226-1-git-send-email-jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Vikram Prakash <vikram.prakash-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Reviewed-by: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Tested-by: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Vikram Prakash <vikram.prakash-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Shreesha Rajashekar <shreesha.rajashekar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Signed-off-by: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 .../bindings/mailbox/brcm,iproc-mailbox.txt          | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,iproc-mailbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/brcm,iproc-mailbox.txt b/Documentation/devicetree/bindings/mailbox/brcm,iproc-mailbox.txt
new file mode 100644
index 0000000..a40d810
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/brcm,iproc-mailbox.txt
@@ -0,0 +1,20 @@
+* Broadcom's iProc Mailbox Controller
+
+Required properties:
+- compatible: Must be "brcm,iproc-mailbox"
+- reg: Defines the base address of the mailbox controller.
+- interrupts: The mailbox controller's interrupt.
+- #interrupt-cells: Must be 1.
+- interrupt-controller: Sets device as an interrupt controller.
+- #mbox-cells: Must be 1.
+
+Example:
+
+	mailbox: mailbox@3024024 {
+		compatible = "brcm,iproc-mailbox";
+		reg = <0x03024024 0x40>;
+		interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		#mbox-cells = <1>;
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
