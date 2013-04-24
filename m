From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 2/7] ARM: i.MX53: add csi pinctrl
Date: Wed, 24 Apr 2013 11:41:21 +0200
Message-ID: <1366796486-10641-3-git-send-email-s.trumtrar@pengutronix.de>
References: <1366796486-10641-1-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1366796486-10641-1-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a group to the csi pinctrl.

Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/imx53.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index d9275f6..ffa4ee2 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -364,6 +364,22 @@
 							MX53_PAD_CSI0_PIXCLK__IPU_CSI0_PIXCLK   0x1d5
 						>;
 					};
+
+					pinctrl_csi_2: csigrp-2 {
+						fsl,pins = <
+							MX53_PAD_CSI0_VSYNC__IPU_CSI0_VSYNC	0x1d5
+							MX53_PAD_CSI0_MCLK__IPU_CSI0_HSYNC	0x1d5
+							MX53_PAD_CSI0_PIXCLK__IPU_CSI0_PIXCLK	0x1d5
+							MX53_PAD_CSI0_DAT19__IPU_CSI0_D_19	0x1d5
+							MX53_PAD_CSI0_DAT18__IPU_CSI0_D_18	0x1d5
+							MX53_PAD_CSI0_DAT17__IPU_CSI0_D_17	0x1d5
+							MX53_PAD_CSI0_DAT16__IPU_CSI0_D_16	0x1d5
+							MX53_PAD_CSI0_DAT15__IPU_CSI0_D_15	0x1d5
+							MX53_PAD_CSI0_DAT14__IPU_CSI0_D_14	0x1d5
+							MX53_PAD_CSI0_DAT13__IPU_CSI0_D_13	0x1d5
+							MX53_PAD_CSI0_DAT12__IPU_CSI0_D_12	0x1d5
+						>;
+					};
 				};
 
 				cspi {
-- 
1.8.2.rc2
