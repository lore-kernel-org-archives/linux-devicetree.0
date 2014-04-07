From: <tthayer@altera.com>
Subject: [PATCH 2/3] dts: socfpga: Add bindings for Altera SoC SDRAM EDAC
Date: Mon, 7 Apr 2014 16:54:08 -0500
Message-ID: <1396907649-20212-3-git-send-email-tthayer@altera.com>
References: <1396907649-20212-1-git-send-email-tthayer@altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1396907649-20212-1-git-send-email-tthayer@altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: robherring2@gmail.com, dougthompson@xmission.com, grant.likely@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, dinguyen@altera.com
Cc: Thor Thayer <tthayer@altera.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@altera.com>

Addition of the Altera SDRAM EDAC bindings and device
tree changes to the Altera SoC project.

Signed-off-by: Thor Thayer <tthayer@altera.com>
To: Rob Herring <robherring2@gmail.com>
To: Pawel Moll <pawel.moll@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
To: Ian Campbell <ijc+devicetree@hellion.org.uk>
To: Kumar Gala <galak@codeaurora.org>
To: Rob Landley <rob@landley.net>
To: Russell King <linux@arm.linux.org.uk>
To: Dinh Nguyen <dinguyen@altera.com>
Cc: devicetree@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 .../bindings/arm/altera/socfpga-sdram-edac.txt     |   12 ++++++++++++
 arch/arm/boot/dts/socfpga.dtsi                     |    5 +++++
 2 files changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-sdram-edac.txt

diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-edac.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-edac.txt
new file mode 100644
index 0000000..9348c53
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-edac.txt
@@ -0,0 +1,12 @@
+Altera SOCFPGA SDRAM Error Detection & Correction [EDAC]
+
+Required properties:
+- compatible : should contain "altr,sdr-edac";
+- interrupts : Should contain the SDRAM ECC IRQ in the
+	appropriate format for the IRQ controller.
+
+Example:
+	sdramedac@0 {
+		compatible = "altr,sdram-edac";
+		interrupts = <0 39 4>;
+	};
diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 6ce912e..a0ea69b 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -681,6 +681,11 @@
 			reg = <0xffc25000 0x1000>;
 		};
 
+		sdramedac@0 {
+			compatible = "altr,sdram-edac";
+			interrupts = <0 39 4>;
+		};
+
 		rstmgr@ffd05000 {
 			compatible = "altr,rst-mgr";
 			reg = <0xffd05000 0x1000>;
-- 
1.7.9.5

