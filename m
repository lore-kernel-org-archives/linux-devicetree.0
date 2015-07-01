From: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Subject: [RFC PATCH 7/7] ARM: dts: vf610-twr: Enable QSPI and map flash devices.
Date: Wed,  1 Jul 2015 16:20:10 -0400
Message-ID: <1435782010-9809-9-git-send-email-cory.tusar@pid1solutions.com>
References: <1435782010-9809-1-git-send-email-cory.tusar@pid1solutions.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435782010-9809-1-git-send-email-cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, han.xu-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: stefan-XLVq0VzYD2Y@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit enables the qspi0 functional block, and maps the two
flash devices connected to QSPI0_A_CS0 and QSPI0_B_CS0 to individual MTD
devices.

Tested using mtd_readtest, mtd_speedtest, and mtd_stresstest on a Rev. H
TWR board.

Signed-off-by: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
---
 arch/arm/boot/dts/vf610-twr.dts | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/vf610-twr.dts b/arch/arm/boot/dts/vf610-twr.dts
index 375ab23..6ae2e7c 100644
--- a/arch/arm/boot/dts/vf610-twr.dts
+++ b/arch/arm/boot/dts/vf610-twr.dts
@@ -246,6 +246,23 @@
 			>;
 		};
 
+		pinctrl_qspi0: qspi0grp {
+			fsl,pins = <
+				VF610_PAD_PTD0__QSPI0_A_QSCK		0x31e2
+				VF610_PAD_PTD1__QSPI0_A_CS0		0x31e2
+				VF610_PAD_PTD2__QSPI0_A_DATA3		0x31e3
+				VF610_PAD_PTD3__QSPI0_A_DATA2		0x31e3
+				VF610_PAD_PTD4__QSPI0_A_DATA1		0x31e3
+				VF610_PAD_PTD5__QSPI0_A_DATA0		0x31e3
+				VF610_PAD_PTD7__QSPI0_B_QSCK		0x31e2
+				VF610_PAD_PTD8__QSPI0_B_CS0		0x31e2
+				VF610_PAD_PTD9__QSPI0_B_DATA3		0x31e3
+				VF610_PAD_PTD10__QSPI0_B_DATA2		0x31e3
+				VF610_PAD_PTD11__QSPI0_B_DATA1		0x31e3
+				VF610_PAD_PTD12__QSPI0_B_DATA0		0x31e3
+			>;
+		};
+
 		pinctrl_sai2: sai2grp {
 			fsl,pins = <
 				VF610_PAD_PTA16__SAI2_TX_BCLK		0x02ed
@@ -280,6 +297,28 @@
 	status = "okay";
 };
 
+&qspi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_qspi0>;
+	status = "okay";
+
+	flash0: s25fl128s@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "spansion,s25fl128s";
+		spi-max-frequency = <66000000>;
+		reg = <0>;
+	};
+
+	flash1: s25fl128s@2 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "spansion,s25fl128s";
+		spi-max-frequency = <66000000>;
+		reg = <2>;
+	};
+};
+
 &sai2 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
-- 
2.3.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
