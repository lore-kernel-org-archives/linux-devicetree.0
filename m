From: Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [PATCH 3/8] ARM: dts: imx7d: cl-som-imx7: add eMMC support
Date: Mon,  7 Dec 2015 09:14:34 +0200
Message-ID: <1449472479-2521-4-git-send-email-ilya@compulab.co.il>
References: <1449472479-2521-1-git-send-email-ilya@compulab.co.il>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449472479-2521-1-git-send-email-ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for eMMC as a main storage.

Signed-off-by: Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Acked-by: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
---
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
index a8f52cf..44849ab 100644
--- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
@@ -154,6 +154,17 @@
 	status = "okay";
 };
 
+&usdhc3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	assigned-clocks = <&clks IMX7D_USDHC3_ROOT_CLK>;
+	assigned-clock-rates = <400000000>;
+	bus-width = <8>;
+	fsl,tuning-step = <2>;
+	non-removable;
+	status = "okay";
+};
+
 &iomuxc {
 	cl-som-imx7 {
 		pinctrl_i2c2: i2c2grp {
@@ -175,5 +186,21 @@
 				MX7D_PAD_GPIO1_IO05__GPIO1_IO5		0x14 /* OTG PWREN */
 			>;
 		};
+
+		pinctrl_usdhc3: usdhc3grp {
+			fsl,pins = <
+				MX7D_PAD_SD3_CMD__SD3_CMD		0x59
+				MX7D_PAD_SD3_CLK__SD3_CLK		0x19
+				MX7D_PAD_SD3_DATA0__SD3_DATA0		0x59
+				MX7D_PAD_SD3_DATA1__SD3_DATA1		0x59
+				MX7D_PAD_SD3_DATA2__SD3_DATA2		0x59
+				MX7D_PAD_SD3_DATA3__SD3_DATA3		0x59
+				MX7D_PAD_SD3_DATA4__SD3_DATA4		0x59
+				MX7D_PAD_SD3_DATA5__SD3_DATA5		0x59
+				MX7D_PAD_SD3_DATA6__SD3_DATA6		0x59
+				MX7D_PAD_SD3_DATA7__SD3_DATA7		0x59
+				MX7D_PAD_SD3_STROBE__SD3_STROBE		0x19
+			>;
+		};
 	};
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
