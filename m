From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH v6 06/17] dts: mpc512x: add clock specs for client lookups
Date: Sat, 30 Nov 2013 23:51:26 +0100
Message-ID: <1385851897-23475-7-git-send-email-gsi@denx.de>
References: <1385851897-23475-1-git-send-email-gsi@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385851897-23475-1-git-send-email-gsi-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Detlev Zundel <dzu-ynQEQJNshbs@public.gmane.org>, Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

this addresses the client side of device tree based clock lookups

add clock specifiers to the mbx, nfc, mscan, sdhc, i2c, axe, diu, viu,
mdio, fec, usb, pata, psc, psc fifo, and pci nodes in the shared
mpc5121.dtsi include

Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Reviewed-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>	# for v3: w/o bdlc, PSC ipg
Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
---
 arch/powerpc/boot/dts/mpc5121.dtsi |   95 ++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/powerpc/boot/dts/mpc5121.dtsi b/arch/powerpc/boot/dts/mpc5121.dtsi
index 9bfcb7558197..d8c6f967785f 100644
--- a/arch/powerpc/boot/dts/mpc5121.dtsi
+++ b/arch/powerpc/boot/dts/mpc5121.dtsi
@@ -51,6 +51,10 @@
 		compatible = "fsl,mpc5121-mbx";
 		reg = <0x20000000 0x4000>;
 		interrupts = <66 0x8>;
+		clocks = <&clks MPC512x_CLK_MBX_BUS>,
+			 <&clks MPC512x_CLK_MBX_3D>,
+			 <&clks MPC512x_CLK_MBX>;
+		clock-names = "mbx-bus", "mbx-3d", "mbx";
 	};
 
 	sram@30000000 {
@@ -64,6 +68,8 @@
 		interrupts = <6 8>;
 		#address-cells = <1>;
 		#size-cells = <1>;
+		clocks = <&clks MPC512x_CLK_NFC>;
+		clock-names = "ipg";
 	};
 
 	localbus@80000020 {
@@ -156,12 +162,24 @@
 			compatible = "fsl,mpc5121-mscan";
 			reg = <0x1300 0x80>;
 			interrupts = <12 0x8>;
+			clocks = <&clks MPC512x_CLK_BDLC>,
+				 <&clks MPC512x_CLK_IPS>,
+				 <&clks MPC512x_CLK_SYS>,
+				 <&clks MPC512x_CLK_REF>,
+				 <&clks MPC512x_CLK_MSCAN0_MCLK>;
+			clock-names = "ipg", "ips", "sys", "ref", "mclk";
 		};
 
 		can@1380 {
 			compatible = "fsl,mpc5121-mscan";
 			reg = <0x1380 0x80>;
 			interrupts = <13 0x8>;
+			clocks = <&clks MPC512x_CLK_BDLC>,
+				 <&clks MPC512x_CLK_IPS>,
+				 <&clks MPC512x_CLK_SYS>,
+				 <&clks MPC512x_CLK_REF>,
+				 <&clks MPC512x_CLK_MSCAN1_MCLK>;
+			clock-names = "ipg", "ips", "sys", "ref", "mclk";
 		};
 
 		sdhc@1500 {
@@ -170,6 +188,9 @@
 			interrupts = <8 0x8>;
 			dmas = <&dma0 30>;
 			dma-names = "rx-tx";
+			clocks = <&clks MPC512x_CLK_IPS>,
+				 <&clks MPC512x_CLK_SDHC>;
+			clock-names = "ipg", "per";
 		};
 
 		i2c@1700 {
@@ -178,6 +199,8 @@
 			compatible = "fsl,mpc5121-i2c", "fsl-i2c";
 			reg = <0x1700 0x20>;
 			interrupts = <9 0x8>;
+			clocks = <&clks MPC512x_CLK_I2C>;
+			clock-names = "ipg";
 		};
 
 		i2c@1720 {
@@ -186,6 +209,8 @@
 			compatible = "fsl,mpc5121-i2c", "fsl-i2c";
 			reg = <0x1720 0x20>;
 			interrupts = <10 0x8>;
+			clocks = <&clks MPC512x_CLK_I2C>;
+			clock-names = "ipg";
 		};
 
 		i2c@1740 {
@@ -194,6 +219,8 @@
 			compatible = "fsl,mpc5121-i2c", "fsl-i2c";
 			reg = <0x1740 0x20>;
 			interrupts = <11 0x8>;
+			clocks = <&clks MPC512x_CLK_I2C>;
+			clock-names = "ipg";
 		};
 
 		i2ccontrol@1760 {
@@ -205,30 +232,48 @@
 			compatible = "fsl,mpc5121-axe";
 			reg = <0x2000 0x100>;
 			interrupts = <42 0x8>;
+			clocks = <&clks MPC512x_CLK_AXE>;
+			clock-names = "ipg";
 		};
 
 		display@2100 {
 			compatible = "fsl,mpc5121-diu";
 			reg = <0x2100 0x100>;
 			interrupts = <64 0x8>;
+			clocks = <&clks MPC512x_CLK_DIU>;
+			clock-names = "ipg";
 		};
 
 		can@2300 {
 			compatible = "fsl,mpc5121-mscan";
 			reg = <0x2300 0x80>;
 			interrupts = <90 0x8>;
+			clocks = <&clks MPC512x_CLK_BDLC>,
+				 <&clks MPC512x_CLK_IPS>,
+				 <&clks MPC512x_CLK_SYS>,
+				 <&clks MPC512x_CLK_REF>,
+				 <&clks MPC512x_CLK_MSCAN2_MCLK>;
+			clock-names = "ipg", "ips", "sys", "ref", "mclk";
 		};
 
 		can@2380 {
 			compatible = "fsl,mpc5121-mscan";
 			reg = <0x2380 0x80>;
 			interrupts = <91 0x8>;
+			clocks = <&clks MPC512x_CLK_BDLC>,
+				 <&clks MPC512x_CLK_IPS>,
+				 <&clks MPC512x_CLK_SYS>,
+				 <&clks MPC512x_CLK_REF>,
+				 <&clks MPC512x_CLK_MSCAN3_MCLK>;
+			clock-names = "ipg", "ips", "sys", "ref", "mclk";
 		};
 
 		viu@2400 {
 			compatible = "fsl,mpc5121-viu";
 			reg = <0x2400 0x400>;
 			interrupts = <67 0x8>;
+			clocks = <&clks MPC512x_CLK_VIU>;
+			clock-names = "ipg";
 		};
 
 		mdio@2800 {
@@ -236,6 +281,8 @@
 			reg = <0x2800 0x800>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			clocks = <&clks MPC512x_CLK_FEC>;
+			clock-names = "per";
 		};
 
 		eth0: ethernet@2800 {
@@ -244,6 +291,8 @@
 			reg = <0x2800 0x800>;
 			local-mac-address = [ 00 00 00 00 00 00 ];
 			interrupts = <4 0x8>;
+			clocks = <&clks MPC512x_CLK_FEC>;
+			clock-names = "per";
 		};
 
 		/* USB1 using external ULPI PHY */
@@ -255,6 +304,8 @@
 			interrupts = <43 0x8>;
 			dr_mode = "otg";
 			phy_type = "ulpi";
+			clocks = <&clks MPC512x_CLK_USB1>;
+			clock-names = "ipg";
 		};
 
 		/* USB0 using internal UTMI PHY */
@@ -266,6 +317,8 @@
 			interrupts = <44 0x8>;
 			dr_mode = "otg";
 			phy_type = "utmi_wide";
+			clocks = <&clks MPC512x_CLK_USB2>;
+			clock-names = "ipg";
 		};
 
 		/* IO control */
@@ -284,6 +337,8 @@
 			compatible = "fsl,mpc5121-pata";
 			reg = <0x10200 0x100>;
 			interrupts = <5 0x8>;
+			clocks = <&clks MPC512x_CLK_PATA>;
+			clock-names = "ipg";
 		};
 
 		/* 512x PSCs are not 52xx PSC compatible */
@@ -295,6 +350,9 @@
 			interrupts = <40 0x8>;
 			fsl,rx-fifo-size = <16>;
 			fsl,tx-fifo-size = <16>;
+			clocks = <&clks MPC512x_CLK_PSC0>,
+				 <&clks MPC512x_CLK_PSC0_MCLK>;
+			clock-names = "ipg", "mclk";
 		};
 
 		/* PSC1 */
@@ -304,6 +362,9 @@
 			interrupts = <40 0x8>;
 			fsl,rx-fifo-size = <16>;
 			fsl,tx-fifo-size = <16>;
+			clocks = <&clks MPC512x_CLK_PSC1>,
+				 <&clks MPC512x_CLK_PSC1_MCLK>;
+			clock-names = "ipg", "mclk";
 		};
 
 		/* PSC2 */
@@ -313,6 +374,9 @@
 			interrupts = <40 0x8>;
 			fsl,rx-fifo-size = <16>;
 			fsl,tx-fifo-size = <16>;
+			clocks = <&clks MPC512x_CLK_PSC2>,
+				 <&clks MPC512x_CLK_PSC2_MCLK>;
+			clock-names = "ipg", "mclk";
 		};
 
 		/* PSC3 */
@@ -322,6 +386,9 @@
 			interrupts = <40 0x8>;
 			fsl,rx-fifo-size = <16>;
 			fsl,tx-fifo-size = <16>;
+			clocks = <&clks MPC512x_CLK_PSC3>,
+				 <&clks MPC512x_CLK_PSC3_MCLK>;
+			clock-names = "ipg", "mclk";
 		};
 
 		/* PSC4 */
@@ -331,6 +398,9 @@
 			interrupts = <40 0x8>;
 			fsl,rx-fifo-size = <16>;
 			fsl,tx-fifo-size = <16>;
+			clocks = <&clks MPC512x_CLK_PSC4>,
+				 <&clks MPC512x_CLK_PSC4_MCLK>;
+			clock-names = "ipg", "mclk";
 		};
 
 		/* PSC5 */
@@ -340,6 +410,9 @@
 			interrupts = <40 0x8>;
 			fsl,rx-fifo-size = <16>;
 			fsl,tx-fifo-size = <16>;
+			clocks = <&clks MPC512x_CLK_PSC5>,
+				 <&clks MPC512x_CLK_PSC5_MCLK>;
+			clock-names = "ipg", "mclk";
 		};
 
 		/* PSC6 */
@@ -349,6 +422,9 @@
 			interrupts = <40 0x8>;
 			fsl,rx-fifo-size = <16>;
 			fsl,tx-fifo-size = <16>;
+			clocks = <&clks MPC512x_CLK_PSC6>,
+				 <&clks MPC512x_CLK_PSC6_MCLK>;
+			clock-names = "ipg", "mclk";
 		};
 
 		/* PSC7 */
@@ -358,6 +434,9 @@
 			interrupts = <40 0x8>;
 			fsl,rx-fifo-size = <16>;
 			fsl,tx-fifo-size = <16>;
+			clocks = <&clks MPC512x_CLK_PSC7>,
+				 <&clks MPC512x_CLK_PSC7_MCLK>;
+			clock-names = "ipg", "mclk";
 		};
 
 		/* PSC8 */
@@ -367,6 +446,9 @@
 			interrupts = <40 0x8>;
 			fsl,rx-fifo-size = <16>;
 			fsl,tx-fifo-size = <16>;
+			clocks = <&clks MPC512x_CLK_PSC8>,
+				 <&clks MPC512x_CLK_PSC8_MCLK>;
+			clock-names = "ipg", "mclk";
 		};
 
 		/* PSC9 */
@@ -376,6 +458,9 @@
 			interrupts = <40 0x8>;
 			fsl,rx-fifo-size = <16>;
 			fsl,tx-fifo-size = <16>;
+			clocks = <&clks MPC512x_CLK_PSC9>,
+				 <&clks MPC512x_CLK_PSC9_MCLK>;
+			clock-names = "ipg", "mclk";
 		};
 
 		/* PSC10 */
@@ -385,6 +470,9 @@
 			interrupts = <40 0x8>;
 			fsl,rx-fifo-size = <16>;
 			fsl,tx-fifo-size = <16>;
+			clocks = <&clks MPC512x_CLK_PSC10>,
+				 <&clks MPC512x_CLK_PSC10_MCLK>;
+			clock-names = "ipg", "mclk";
 		};
 
 		/* PSC11 */
@@ -394,12 +482,17 @@
 			interrupts = <40 0x8>;
 			fsl,rx-fifo-size = <16>;
 			fsl,tx-fifo-size = <16>;
+			clocks = <&clks MPC512x_CLK_PSC11>,
+				 <&clks MPC512x_CLK_PSC11_MCLK>;
+			clock-names = "ipg", "mclk";
 		};
 
 		pscfifo@11f00 {
 			compatible = "fsl,mpc5121-psc-fifo";
 			reg = <0x11f00 0x100>;
 			interrupts = <40 0x8>;
+			clocks = <&clks MPC512x_CLK_PSC_FIFO>;
+			clock-names = "ipg";
 		};
 
 		dma0: dma@14000 {
@@ -417,6 +510,8 @@
 		#address-cells = <3>;
 		#size-cells = <2>;
 		#interrupt-cells = <1>;
+		clocks = <&clks MPC512x_CLK_PCI>;
+		clock-names = "ipg";
 
 		reg = <0x80008500 0x100	/* internal registers */
 		       0x80008300 0x8>;	/* config space access registers */
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
