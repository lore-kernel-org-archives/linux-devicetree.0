From: Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
Subject: [PATCH v2 3/9] ARM: dts: imx28: add alternative muxing for mmc2_sck_cfg
Date: Sun, 22 Jan 2017 23:22:38 +0100
Message-ID: <1485123764-14754-4-git-send-email-mhei@heimpold.de>
References: <1485123764-14754-1-git-send-email-mhei@heimpold.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485123764-14754-1-git-send-email-mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan.wahren-eS4NqCHxEME@public.gmane.org, Michael Heimpold <michael.heimpold-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Michael Heimpold <michael.heimpold-eS4NqCHxEME@public.gmane.org>

Signed-off-by: Michael Heimpold <michael.heimpold-eS4NqCHxEME@public.gmane.org>
---
 arch/arm/boot/dts/imx28.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
index 857ca37..5c65fa1 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -613,6 +613,15 @@
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
+				mmc2_sck_cfg_b: mmc2-sck-cfg@1 {
+					reg = <1>;
+					fsl,pinmux-ids = <
+						MX28_PAD_SSP2_SCK__SSP2_SCK
+					>;
+					fsl,drive-strength = <MXS_DRIVE_12mA>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
 				i2c0_pins_a: i2c0@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
