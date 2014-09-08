From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v4 5/5] DT: Add binding for Altera SOCFPGA FPGA Manager
Date: Mon,  8 Sep 2014 11:29:11 +0200
Message-ID: <1410168551-6588-6-git-send-email-s.trumtrar@pengutronix.de>
References: <1410168551-6588-1-git-send-email-s.trumtrar@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410168551-6588-1-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: barebox-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Altera SOCFPGA have a FPGA Manager, that manages and monitors the FPGA portion
of the SoC.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 .../bindings/firmware/altr,socfpga-fpga-mgr.txt       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/altr,socfpga-fpga-mgr.txt

diff --git a/Documentation/devicetree/bindings/firmware/altr,socfpga-fpga-mgr.txt b/Documentation/devicetree/bindings/firmware/altr,socfpga-fpga-mgr.txt
new file mode 100644
index 000000000000..70ec4abf25b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/altr,socfpga-fpga-mgr.txt
@@ -0,0 +1,19 @@
+Altera SOCFPGA FPGA Manager
+---------------------------
+
+This binding defines the FPGA Manager on Altera SOCFPGAs. This is used to upload
+the firmware to the FPGA part of the SoC.
+
+Required properties:
+- compatible: shall be "altr,socfpga-fpga-mgr"
+- reg: Must contain 2 register ranges:
+	1. The control address space of the FPGA manager.
+	2. The configuration data address space where the firmware data is written to.
+
+Example:
+
+	fpgamgr@ff706000 {
+		compatible = "altr,socfpga-fpga-mgr";
+		reg = <0xff706000 0x1000>,
+		      <0xffb90000 0x1000>;
+	};
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
