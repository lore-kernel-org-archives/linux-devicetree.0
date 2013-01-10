From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 1/4] ARM: dts: mxs-phy: Change mxs phy clock usage
Date: Thu, 10 Jan 2013 16:35:51 +0800
Message-ID: <1357806954-27960-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

For mxs-phy user i.mx6q, the PHY's clock is controlled by
hardware automatically, the software only needs to enable it
at probe, this clock should be used like below:

- Enable at mxs-phy's probe, and disable at mxs-phy's remove, so
The clk framework doesn't need to know it. But other mxs-phy user
mx28/mx23 may need it, so we give mxs-phy a dummy clock for imx6q.
- During the runtime, we don't need to control it.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 .../devicetree/bindings/clock/imx6q-clock.txt      |    2 --
 Documentation/devicetree/bindings/usb/mxs-phy.txt  |    2 ++
 arch/arm/boot/dts/imx6q.dtsi                       |   10 +++++++---
 arch/arm/mach-imx/clk-imx6q.c                      |    5 +----
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.txt b/Documentation/devicetree/bindings/clock/imx6q-clock.txt
index d77b4e6..5666486 100644
--- a/Documentation/devicetree/bindings/clock/imx6q-clock.txt
+++ b/Documentation/devicetree/bindings/clock/imx6q-clock.txt
@@ -194,8 +194,6 @@ clocks and IDs.
 	ssi2_ipg		179
 	ssi3_ipg		180
 	rom			181
-	usbphy1			182
-	usbphy2			183
 	ldb_di0_div_3_5		184
 	ldb_di1_div_3_5		185
 	sata_ref		186
diff --git a/Documentation/devicetree/bindings/usb/mxs-phy.txt b/Documentation/devicetree/bindings/usb/mxs-phy.txt
index 5835b27..384e700 100644
--- a/Documentation/devicetree/bindings/usb/mxs-phy.txt
+++ b/Documentation/devicetree/bindings/usb/mxs-phy.txt
@@ -4,10 +4,12 @@ Required properties:
 - compatible: Should be "fsl,imx23-usbphy"
 - reg: Should contain registers location and length
 - interrupts: Should contain phy interrupt
+- The reg offset for PHY clock at anatop
 
 Example:
 usbphy1: usbphy@020c9000 {
 	compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
 	reg = <0x020c9000 0x1000>;
 	interrupts = <0 44 0x04>;
+	anatop-phy-reg-offset = <0x10>;
 };
diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index d6265ca..d958c49 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -518,14 +518,18 @@
 				compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
 				reg = <0x020c9000 0x1000>;
 				interrupts = <0 44 0x04>;
-				clocks = <&clks 182>;
-			};
+				anatop-phy-reg-offset = <0x10>;
+				/* the clk is controllered by hardware */
+				clocks = <&clks 0>;
+	 		};
 
 			usbphy2: usbphy@020ca000 {
 				compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
 				reg = <0x020ca000 0x1000>;
 				interrupts = <0 45 0x04>;
-				clocks = <&clks 183>;
+				anatop-phy-reg-offset = <0x20>;
+				/* the clk is controllered by hardware */
+				clocks = <&clks 0>;
 			};
 
 			snvs@020cc000 {
diff --git a/arch/arm/mach-imx/clk-imx6q.c b/arch/arm/mach-imx/clk-imx6q.c
index 7f2c10c..fa62bc9 100644
--- a/arch/arm/mach-imx/clk-imx6q.c
+++ b/arch/arm/mach-imx/clk-imx6q.c
@@ -153,7 +153,7 @@ enum mx6q_clks {
 	ssi2, ssi3, uart_ipg, uart_serial, usboh3, usdhc1, usdhc2, usdhc3,
 	usdhc4, vdo_axi, vpu_axi, cko1, pll1_sys, pll2_bus, pll3_usb_otg,
 	pll4_audio, pll5_video, pll8_mlb, pll7_usb_host, pll6_enet, ssi1_ipg,
-	ssi2_ipg, ssi3_ipg, rom, usbphy1, usbphy2, ldb_di0_div_3_5, ldb_di1_div_3_5,
+	ssi2_ipg, ssi3_ipg, rom, ldb_di0_div_3_5, ldb_di1_div_3_5,
 	sata_ref, sata_ref_100m, pcie_ref, pcie_ref_125m, enet_ref,
 	clk_max
 };
@@ -208,9 +208,6 @@ int __init mx6q_clocks_init(void)
 	clk[pll7_usb_host] = imx_clk_pllv3(IMX_PLLV3_USB,	"pll7_usb_host","osc", base + 0x20, 0x3);
 	clk[pll8_mlb]      = imx_clk_pllv3(IMX_PLLV3_MLB,	"pll8_mlb",	"osc", base + 0xd0, 0x0);
 
-	clk[usbphy1] = imx_clk_gate("usbphy1", "pll3_usb_otg", base + 0x10, 6);
-	clk[usbphy2] = imx_clk_gate("usbphy2", "pll7_usb_host", base + 0x20, 6);
