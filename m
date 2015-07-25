From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: [RFCv2 1/3] docs: dts: Added documentation for Xilinx Zynq Reset Controller bindings.
Date: Fri, 24 Jul 2015 17:21:20 -0700
Message-ID: <1437783682-13632-2-git-send-email-moritz.fischer@ettus.com>
References: <1437783682-13632-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437783682-13632-1-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 Documentation/devicetree/bindings/reset/zynq-reset-pl.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/zynq-reset-pl.txt

diff --git a/Documentation/devicetree/bindings/reset/zynq-reset-pl.txt b/Documentation/devicetree/bindings/reset/zynq-reset-pl.txt
new file mode 100644
index 0000000..ac4499e
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/zynq-reset-pl.txt
@@ -0,0 +1,13 @@
+Xilinx Zynq PL Reset Manager
+
+Required properties:
+- compatible: "xlnx,zynq-reset-pl"
+- syscon <&slcr>;
+- #reset-cells: 1
+
+Example:
+	rstc: rstc@240 {
+		#reset-cells = <1>;
+		compatible = "xlnx,zynq-reset-pl";
+		syscon = <&slcr>;
+	};
-- 
2.4.3
