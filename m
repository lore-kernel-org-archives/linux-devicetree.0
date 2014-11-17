From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] ARM: shmobile: r8a7790: add USBDMAC{0,1} clocks to device
 tree
Date: Mon, 17 Nov 2014 18:25:13 +0900
Message-ID: <5469BEF9.4010504@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, SH-Linux <linux-sh@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 At the moment, usb-dmac driver for r8a7790 doesn't exist. But I would like
 to enable these clock settings for future development.

 arch/arm/boot/dts/r8a7790.dtsi |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 14df425..d4ac978 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1103,17 +1103,20 @@
 			reg = <0 0xe615013c 0 4>, <0 0xe6150048 0 4>;
 			clocks = <&hp_clk>, <&cp_clk>, <&mmc1_clk>, <&sd3_clk>,
 				 <&sd2_clk>, <&cpg_clocks R8A7790_CLK_SD1>, <&cpg_clocks R8A7790_CLK_SD0>, <&mmc0_clk>,
-				 <&hp_clk>, <&mp_clk>, <&hp_clk>, <&mp_clk>, <&rclk_clk>;
+				 <&hp_clk>, <&mp_clk>, <&hp_clk>, <&mp_clk>, <&rclk_clk>,
+				 <&hp_clk>, <&hp_clk>;
 			#clock-cells = <1>;
 			renesas,clock-indices = <
 				R8A7790_CLK_IIC2 R8A7790_CLK_TPU0 R8A7790_CLK_MMCIF1 R8A7790_CLK_SDHI3
 				R8A7790_CLK_SDHI2 R8A7790_CLK_SDHI1 R8A7790_CLK_SDHI0 R8A7790_CLK_MMCIF0
 				R8A7790_CLK_IIC0 R8A7790_CLK_PCIEC R8A7790_CLK_IIC1 R8A7790_CLK_SSUSB R8A7790_CLK_CMT1
+				R8A7790_CLK_USBDMAC0 R8A7790_CLK_USBDMAC1
 			>;
 			clock-output-names =
 				"iic2", "tpu0", "mmcif1", "sdhi3",
 				"sdhi2", "sdhi1", "sdhi0", "mmcif0",
-				"iic0", "pciec", "iic1", "ssusb", "cmt1";
+				"iic0", "pciec", "iic1", "ssusb", "cmt1",
+				"usbdmac0", "usbdmac1";
 		};
 		mstp5_clks: mstp5_clks@e6150144 {
 			compatible = "renesas,r8a7790-mstp-clocks", "renesas,cpg-mstp-clocks";
-- 
1.7.9.5

