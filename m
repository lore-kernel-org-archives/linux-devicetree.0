From: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH V2 6/6] ARM: dts: imx6qdl: enable the WEIM NOR
Date: Thu, 23 May 2013 16:16:18 +0800
Message-ID: <1369296978-7669-7-git-send-email-b32955@freescale.com>
References: <1369296978-7669-1-git-send-email-b32955@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1369296978-7669-1-git-send-email-b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Enable the WEIM NOR for imx6q{dl} boards.

For the pin conflict with SPI NOR, its status is set to "disabled".

Signed-off-by: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
index a4466e6..684b208 100644
--- a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
@@ -58,3 +58,23 @@
 	wp-gpios = <&gpio1 13 0>;
 	status = "okay";
 };
+
+&weim {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_weim_nor_1>;
+	#address-cells = <2>;
+	#size-cells = <1>;
+	ranges = <0 0 0x08000000 0x08000000>;
+	status = "disabled"; /* pin conflict with SPI NOR */
+
+	nor@0,0 {
+		compatible = "cfi-flash";
+		reg = <0 0 0x02000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		bank-width = <2>;
+
+		fsl,weim-cs-timing = <0x00620081 0x00000001 0x1C022000
+				0x0000C000 0x1404a38e 0x00000000>;
+	};
+};
-- 
1.7.1
