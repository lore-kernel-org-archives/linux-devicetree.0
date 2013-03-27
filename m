From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 10/11] ARM i.MX53: Add LDB device to device tree
Date: Wed, 27 Mar 2013 18:30:44 +0100
Message-ID: <1364405445-5271-11-git-send-email-p.zabel@pengutronix.de>
References: <1364405445-5271-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1364405445-5271-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/imx53.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index b07bbdcc..30aed40 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -511,6 +511,33 @@
 				reg = <0x53fa8000 0xc>;
 			};
 
+			ldb: ldb@53fa8008 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,imx53-ldb";
+				reg = <0x53fa8008 0x4>;
+				gpr = <&gpr>;
+				clocks = <&clks 122>, <&clks 120>,
+					 <&clks 115>, <&clks 116>,
+					 <&clks 123>, <&clks 85>;
+				clock-names = "di0_pll", "di1_pll",
+					      "di0_sel", "di1_sel",
+					      "di0", "di1";
+				status = "disabled";
+
+				lvds-channel@0 {
+					reg = <0>;
+					crtcs = <&ipu 0>;
+					status = "disabled";
+				};
+
+				lvds-channel@1 {
+					reg = <1>;
+					crtcs = <&ipu 1>;
+					status = "disabled";
+				};
+			};
+
 			pwm1: pwm@53fb4000 {
 				#pwm-cells = <2>;
 				compatible = "fsl,imx53-pwm", "fsl,imx27-pwm";
-- 
1.8.2.rc2
