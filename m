From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 2/3] ARM: dts: imx27 phyCARD-S, move i2c1 and owire to rdk
Date: Sun,  7 Jul 2013 15:13:30 +0200
Message-ID: <1373202811-13825-3-git-send-email-mpa@pengutronix.de>
References: <1373202811-13825-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1373202811-13825-1-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Both buses are not used on the phyCARD-S module. This patch moves them
to the rdk file. Remove ioexpander.

Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts | 13 +++++++++++++
 arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts | 18 ------------------
 2 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts b/arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts
index 390d8f2..0514b0a 100644
--- a/arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts
+++ b/arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts
@@ -41,6 +41,19 @@
 	status = "okay";
 };
 
+&i2c1 {
+	status = "okay";
+
+	rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+	};
+};
+
+&owire {
+	status = "okay";
+};
+
 &sdhci2 {
 	cd-gpios = <&gpio3 29 0>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts b/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts
index cdff8c7..c8d57d1 100644
--- a/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts
+++ b/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts
@@ -33,20 +33,6 @@
 	status = "okay";
 };
 
-&i2c1 {
-	status = "okay";
-
-	ioexpander@41 {
-		compatible = "nxp,pca9536";
-		reg = <0x41>;
-	};
-
-	rtc@51 {
-		compatible = "nxp,pcf8563";
-		reg = <0x51>;
-	};
-};
-
 &i2c2 {
 	status = "okay";
 
@@ -56,7 +42,3 @@
 		reg = <0x52>;
 	};
 };
-
-&owire {
-	status = "okay";
-};
-- 
1.8.2.1
