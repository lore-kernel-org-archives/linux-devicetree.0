From: Wendy Liang <wendy.liang-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH v2] Dcoumentation: dt: mailbox: Add Xilinx IPI Mailbox
Date: Tue, 17 Oct 2017 11:33:04 -0700
Message-ID: <1508265184-17799-1-git-send-email-jliang@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cyrilc-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, willw-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Wendy Liang <jliang-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Xilinx ZynqMP IPI(Inter Processor Interrupt) is a hardware block
in ZynqMP SoC used for the communication between various processor
systems.

Signed-off-by: Wendy Liang <jliang-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
V2: Each ZynqMP IPI mailbox controller instance for one physical connection
    between two ZynqMP IPI agents.
---
 .../bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt   | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt
new file mode 100644
index 0000000..ba02b93
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt
@@ -0,0 +1,103 @@
+Xilinx IPI Mailbox Driver
+========================================
+
+The Xilinx IPI(Inter Processor Interrupt) mailbox driver is a mailbox
+controller that manages the messaging between two Xilinx Zynq UltraScale+
+MPSoC IPI agents. Each IPI agent owns registers used for notification and
+buffers for message.
+
+               +-------------------------------------+
+               | Xilinx ZynqMP IPI Controller        |
+               +-------------------------------------+
+    +--------------------------------------------------+
+ATF                    |                     |
+                       |                     |
+                       |                     |
+    +--------------------------+             |
+                       |                     |
+                       |                     |
+    +--------------------------------------------------+
+            +------------------------------------------+
+            |  +----------------+   +----------------+ |
+Hardware    |  |  IPI Agent     |   |  IPI Buffers   | |
+            |  |  Registers     |   |                | |
+            |  |                |   |                | |
+            |  +----------------+   +----------------+ |
+            |                                          |
+            | Xilinx IPI Agent Block                   |
+            +------------------------------------------+
+
+
+Controller Device Node:
+===========================
+Required properties:
+--------------------
+- compatible:		Shall be: "xlnx,zynqmp-ipi-mailbox"
+- reg:			IPI buffers address range
+- reg-names:		Names of the reg resources
+- #mbox-cells:		Shall be 1. It contains:
+			* tx(0) or rx(1) channel
+- ipi-ids:		IPI agent IDs of the two ends of the
+			communication.
+- interrupt-parent:	Phandle for the interrupt controller
+- interrupts:		Interrupt information corresponding to the
+			interrupt-names property.
+
+Optional properties:
+--------------------
+- method:              The method of accessing the IPI agent registers.
+                       Permitted values are: "smc" and "hvc". Default is
+                       "smc".
+
+Client Device Node:
+===========================
+Required properties:
+--------------------
+- mboxes:		Standard property to specify a mailbox
+			(See ./mailbox.txt)
+- mbox-names:		List of identifier  strings for each mailbox
+			channel.
+
+Example:
+===========================
+	/* APU IPI mailbox driver */
+	ipi_mailbox_rpu0: ipi_mailbox@0xff90400 {
+		compatible = "xlnx,zynqmp-ipi-mailbox";
+		reg = <0x0 0xff990400 0x0 0x20>,
+		      <0x0 0xff990420 0x0 0x20>,
+		      <0x0 0xff990080 0x0 0x20>,
+		      <0x0 0xff9900a0 0x0 0x20>;
+		reg-names = "local_request_region", "local_response_region",
+			    "remote_request_region", "remote_response_region";
+		#mbox-cells = <1>;
+		ipi-ids = <0 1>;
+		interrupt-parent = <&gic>;
+		interrupts = <0 29 4>;
+	};
+	ipi_mailbox_rpu1: ipi_mailbox@ff990440 {
+		compatible = "xlnx,zynqmp-ipi-mailbox";
+		reg = <0x0 0xff990440 0x0 0x20>,
+		      <0x0 0xff990460 0x0 0x20>,
+		      <0x0 0xff990280 0x0 0x20>,
+		      <0x0 0xff9902a0 0x0 0x20>;
+		reg-names = "local_request_region", "local_response_region",
+			    "remote_request_region", "remote_response_region";
+		#mbox-cells = <1>;
+		ipi-ids = <0 2>;
+		interrupt-parent = <&gic>;
+		interrupts = <0 29 4>;
+	};
+	rpu_subsystem0: rpu_subsystem@0 {
+		rpu0 {
+			...
+			mbox-clients = <&ipi_mailbox_rpu0 0>,
+					<&ipi_mailbox_rpu0 1>;
+			mbox-clients-names = "tx", "rx";
+		};
+		rpu1 {
+			...
+			mbox-clients = <&ipi_mailbox_rpu1 0>,
+					<&ipi_mailbox_rpu1 1>;
+			mbox-clients-names = "tx", "rx";
+		};
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
