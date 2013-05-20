From: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 2/6] ARM: dts: imx6q{dl}: fix the pin conflict between SPI and
 WEIM
Date: Mon, 20 May 2013 16:48:58 +0800
Message-ID: <1369039742-10893-3-git-send-email-b32955@freescale.com>
References: <1369039742-10893-1-git-send-email-b32955@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1369039742-10893-1-git-send-email-b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

In the imx6q-sabreauto and imx6dl-sabreauto boards,
the pin MX6Q{DL}_PAD_EIM_D19 is used as a GPIO for SPI NOR, but
it is used as a data pin for the WEIM NOR.

In order to fix the conflict, this patch removes the pin from the hog,
and adds a new pinctrl item: pinctrl_ecspi1_2.

The SPI NOR selects this pinctrl_ecspi1_2 when it is enabled.

Signed-off-by: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6dl-sabreauto.dts   |    9 ++++++++-
 arch/arm/boot/dts/imx6q-sabreauto.dts    |    9 ++++++++-
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi |    2 +-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx6dl-sabreauto.dts b/arch/arm/boot/dts/imx6dl-sabreauto.dts
index 60f3038..7695f70 100644
--- a/arch/arm/boot/dts/imx6dl-sabreauto.dts
+++ b/arch/arm/boot/dts/imx6dl-sabreauto.dts
@@ -25,7 +25,14 @@
 			fsl,pins = <
 				MX6DL_PAD_NANDF_CS2__GPIO6_IO15 0x80000000
 				MX6DL_PAD_SD2_DAT2__GPIO1_IO13  0x80000000
-				MX6DL_PAD_EIM_D19__GPIO3_IO19 	0x80000000
+			>;
+		};
+	};
+
+	ecspi1 {
+		pinctrl_ecspi1_2: ecspi1grp-2 {
+			fsl,pins = <
+				MX6DL_PAD_EIM_D19__GPIO3_IO19  0x80000000
 			>;
 		};
 	};
diff --git a/arch/arm/boot/dts/imx6q-sabreauto.dts b/arch/arm/boot/dts/imx6q-sabreauto.dts
index 9fb3e99..67a3a6b 100644
--- a/arch/arm/boot/dts/imx6q-sabreauto.dts
+++ b/arch/arm/boot/dts/imx6q-sabreauto.dts
@@ -29,7 +29,14 @@
 			fsl,pins = <
 				MX6Q_PAD_NANDF_CS2__GPIO6_IO15 0x80000000
 				MX6Q_PAD_SD2_DAT2__GPIO1_IO13  0x80000000
-				MX6Q_PAD_EIM_D19__GPIO3_IO19   0x80000000
+			>;
+		};
+	};
+
+	ecspi1 {
+		pinctrl_ecspi1_2: ecspi1grp-2 {
+			fsl,pins = <
+				MX6Q_PAD_EIM_D19__GPIO3_IO19  0x80000000
 			>;
 		};
 	};
diff --git a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
index d6baa51..eb293f5 100644
--- a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
@@ -20,7 +20,7 @@
 	fsl,spi-num-chipselects = <1>;
 	cs-gpios = <&gpio3 19 0>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_ecspi1_1>;
+	pinctrl-0 = <&pinctrl_ecspi1_1 &pinctrl_ecspi1_2>;
 	status = "disabled"; /* pin conflict with WEIM NOR */
 
 	flash: m25p80@0 {
-- 
1.7.1
