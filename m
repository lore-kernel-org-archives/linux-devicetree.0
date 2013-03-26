From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 02/11] ARM i.MX5: Move IPU clock lookups into device tree
Date: Tue, 26 Mar 2013 15:13:57 +0100
Message-ID: <1364307246-9017-3-git-send-email-p.zabel@pengutronix.de>
References: <1364307246-9017-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1364307246-9017-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/imx51.dtsi        | 2 ++
 arch/arm/boot/dts/imx53.dtsi        | 2 ++
 arch/arm/mach-imx/clk-imx51-imx53.c | 7 -------
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/imx51.dtsi b/arch/arm/boot/dts/imx51.dtsi
index fcf035b..e9480b8 100644
--- a/arch/arm/boot/dts/imx51.dtsi
+++ b/arch/arm/boot/dts/imx51.dtsi
@@ -67,6 +67,8 @@
 			compatible = "fsl,imx51-ipu";
 			reg = <0x40000000 0x20000000>;
 			interrupts = <11 10>;
+			clocks = <&clks 59>, <&clks 110>, <&clks 61>;
+			clock-names = "bus", "di0", "di1";
 		};
 
 		aips@70000000 { /* AIPS1 */
diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index d05aa21..7a6f5a8 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -72,6 +72,8 @@
 			compatible = "fsl,imx53-ipu";
 			reg = <0x18000000 0x080000000>;
 			interrupts = <11 10>;
+			clocks = <&clks 59>, <&clks 110>, <&clks 61>;
+			clock-names = "bus", "di0", "di1";
 		};
 
 		aips@50000000 { /* AIPS1 */
diff --git a/arch/arm/mach-imx/clk-imx51-imx53.c b/arch/arm/mach-imx/clk-imx51-imx53.c
index 0f39f8c..d22ee6a 100644
--- a/arch/arm/mach-imx/clk-imx51-imx53.c
+++ b/arch/arm/mach-imx/clk-imx51-imx53.c
@@ -362,9 +362,6 @@ int __init mx51_clocks_init(unsigned long rate_ckil, unsigned long rate_osc,
 	clk_register_clkdev(clk[mx51_mipi], "mipi_hsp", NULL);
 	clk_register_clkdev(clk[vpu_gate], NULL, "imx51-vpu.0");
 	clk_register_clkdev(clk[fec_gate], NULL, "imx27-fec.0");
-	clk_register_clkdev(clk[ipu_gate], "bus", "40000000.ipu");
-	clk_register_clkdev(clk[ipu_di0_gate], "di0", "40000000.ipu");
-	clk_register_clkdev(clk[ipu_di1_gate], "di1", "40000000.ipu");
 	clk_register_clkdev(clk[usb_phy_gate], "phy", "mxc-ehci.0");
 	clk_register_clkdev(clk[esdhc1_ipg_gate], "ipg", "sdhci-esdhc-imx51.0");
 	clk_register_clkdev(clk[dummy], "ahb", "sdhci-esdhc-imx51.0");
@@ -471,10 +468,6 @@ int __init mx53_clocks_init(unsigned long rate_ckil, unsigned long rate_osc,
 	clk_register_clkdev(clk[vpu_gate], NULL, "imx53-vpu.0");
 	clk_register_clkdev(clk[i2c3_gate], NULL, "imx21-i2c.2");
 	clk_register_clkdev(clk[fec_gate], NULL, "imx25-fec.0");
-	clk_register_clkdev(clk[ipu_gate], "bus", "18000000.ipu");
-	clk_register_clkdev(clk[ipu_di0_gate], "di0", "18000000.ipu");
-	clk_register_clkdev(clk[ipu_di1_gate], "di1", "18000000.ipu");
-	clk_register_clkdev(clk[ipu_gate], "hsp", "18000000.ipu");
 	clk_register_clkdev(clk[usb_phy1_gate], "usb_phy1", "mxc-ehci.0");
 	clk_register_clkdev(clk[esdhc1_ipg_gate], "ipg", "sdhci-esdhc-imx53.0");
 	clk_register_clkdev(clk[dummy], "ahb", "sdhci-esdhc-imx53.0");
-- 
1.8.2.rc2
