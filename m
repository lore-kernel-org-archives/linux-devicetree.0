From: Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
Subject: [PATCH v2 2/9] ARM: dts: imx28: rename mmc2_sck_cfg to prepare for an alternative muxing setup
Date: Sun, 22 Jan 2017 23:22:37 +0100
Message-ID: <1485123764-14754-3-git-send-email-mhei@heimpold.de>
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
 arch/arm/boot/dts/imx28-m28cu3.dts | 2 +-
 arch/arm/boot/dts/imx28.dtsi       | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx28-m28cu3.dts b/arch/arm/boot/dts/imx28-m28cu3.dts
index 2df63be..bb53294 100644
--- a/arch/arm/boot/dts/imx28-m28cu3.dts
+++ b/arch/arm/boot/dts/imx28-m28cu3.dts
@@ -57,7 +57,7 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&mmc2_4bit_pins_a
 					     &mmc2_cd_cfg
-					     &mmc2_sck_cfg>;
+					     &mmc2_sck_cfg_a>;
 				bus-width = <4>;
 				vmmc-supply = <&reg_vddio_sd1>;
 				status = "okay";
diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
index bc5cf41..857ca37 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -604,7 +604,8 @@
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
-				mmc2_sck_cfg: mmc2-sck-cfg {
+				mmc2_sck_cfg_a: mmc2-sck-cfg@0 {
+					reg = <0>;
 					fsl,pinmux-ids = <
 						MX28_PAD_SSP0_DATA7__SSP2_SCK
 					>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
