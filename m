From: <dinguyen@altera.com>
Subject: [PATCH] dts: socfpga: Add DTS entries for USB
Date: Mon, 14 Apr 2014 16:38:04 -0500
Message-ID: <1397511484-23368-1-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dinh.linux@gmail.com, s.trumtrar@pengutronix.de
Cc: devicetree@vger.kernel.org, Dinh Nguyen <dinguyen@altera.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen@altera.com>

Update all the SOCFPGA DTS files with USB entries.

Signed-off-by: Dinh Nguyen <dinguyen@altera.com>
---
 arch/arm/boot/dts/socfpga.dtsi                |   30 +++++++++++++++++++++++++
 arch/arm/boot/dts/socfpga_arria5_socdk.dts    |    4 ++++
 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts  |    4 ++++
 arch/arm/boot/dts/socfpga_cyclone5_sockit.dts |    4 ++++
 4 files changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index df43702..445fe2f 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -681,6 +681,36 @@
 			reg = <0xffd05000 0x1000>;
 		};
 
+		usbphy0: usbphy@0 {
+			#phy-cells = <0>;
+			compatible = "usb-nop-xceiv";
+			status = "okay";
+		};
+
+		usb0: usb@ffb00000 {
+			compatible = "snps,dwc2";
+			reg = <0xffb00000 0xffff>;
+			interrupts = <0 125 4>;
+			clocks = <&usb_mp_clk>;
+			clock-names = "otg";
+			phys = <&usbphy0>;
+			phy-names = "usb2-phy";
+			dma-desc-enable = <0>;
+			status = "disabled";
+		};
+
+		usb1: usb@ffb40000 {
+			compatible = "snps,dwc2";
+			reg = <0xffb40000 0xffff>;
+			interrupts = <0 128 4>;
+			clocks = <&usb_mp_clk>;
+			clock-names = "otg";
+			phys = <&usbphy0>;
+			phy-names = "usb2-phy";
+			dma-desc-enable = <0>;
+			status = "disabled";
+		};
+
 		sysmgr: sysmgr@ffd08000 {
 			compatible = "altr,sys-mgr", "syscon";
 			reg = <0xffd08000 0x4000>;
diff --git a/arch/arm/boot/dts/socfpga_arria5_socdk.dts b/arch/arm/boot/dts/socfpga_arria5_socdk.dts
index a04061f..d532d17 100644
--- a/arch/arm/boot/dts/socfpga_arria5_socdk.dts
+++ b/arch/arm/boot/dts/socfpga_arria5_socdk.dts
@@ -74,3 +74,7 @@
 		reg = <0x68>;
 	};
 };
+
+&usb1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
index 55d54f7..45de151 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
+++ b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
@@ -67,3 +67,7 @@
 		reg = <0x68>;
 	};
 };
+
+&usb1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
index d5ce22c..d26f155 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
+++ b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
@@ -52,3 +52,7 @@
 	rxdv-skew-ps = <0>;
 	rxc-skew-ps = <2000>;
 };
+
+&usb1 {
+	status = "okay";
+};
-- 
1.7.9.5
