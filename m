From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 4/5] ARM i.MX53: tve_di clock is not part of the CCM,
 but of TVE
Date: Mon,  8 Apr 2013 16:46:22 +0200
Message-ID: <1365432383-7787-5-git-send-email-p.zabel@pengutronix.de>
References: <1365432383-7787-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365432383-7787-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Remove the tve_di clock from the CCM clock tree. It will be provided
by the Television Encoder driver, as this clock is an output signal
of the TVE module.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/imx5-clock.txt | 1 -
 arch/arm/mach-imx/clk-imx51-imx53.c                    | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx5-clock.txt b/Documentation/devicetree/bindings/clock/imx5-clock.txt
index 84cae1f..d71b4b2 100644
--- a/Documentation/devicetree/bindings/clock/imx5-clock.txt
+++ b/Documentation/devicetree/bindings/clock/imx5-clock.txt
@@ -38,7 +38,6 @@ clocks and IDs.
 	usb_phy_podf		23
 	cpu_podf		24
 	di_pred			25
-	tve_di			26
 	tve_s			27
 	uart1_ipg_gate		28
 	uart1_per_gate		29
diff --git a/arch/arm/mach-imx/clk-imx51-imx53.c b/arch/arm/mach-imx/clk-imx51-imx53.c
index 9226940..189d654 100644
--- a/arch/arm/mach-imx/clk-imx51-imx53.c
+++ b/arch/arm/mach-imx/clk-imx51-imx53.c
@@ -78,7 +78,7 @@ enum imx5_clks {
 	dummy, ckil, osc, ckih1, ckih2, ahb, ipg, axi_a, axi_b, uart_pred,
 	uart_root, esdhc_a_pred, esdhc_b_pred, esdhc_c_s, esdhc_d_s,
 	emi_sel, emi_slow_podf, nfc_podf, ecspi_pred, ecspi_podf, usboh3_pred,
-	usboh3_podf, usb_phy_pred, usb_phy_podf, cpu_podf, di_pred, tve_di,
+	usboh3_podf, usb_phy_pred, usb_phy_podf, cpu_podf, di_pred, tve_di_unused,
 	tve_s, uart1_ipg_gate, uart1_per_gate, uart2_ipg_gate,
 	uart2_per_gate, uart3_ipg_gate, uart3_per_gate, i2c1_gate, i2c2_gate,
 	gpt_ipg_gate, pwm1_ipg_gate, pwm1_hf_gate, pwm2_ipg_gate, pwm2_hf_gate,
@@ -187,7 +187,6 @@ static void __init mx5_clocks_common_init(unsigned long rate_ckil,
 				usb_phy_sel_str, ARRAY_SIZE(usb_phy_sel_str));
 	clk[cpu_podf] = imx_clk_divider("cpu_podf", "pll1_sw", MXC_CCM_CACRR, 0, 3);
 	clk[di_pred] = imx_clk_divider("di_pred", "pll3_sw", MXC_CCM_CDCDR, 6, 3);
-	clk[tve_di] = imx_clk_fixed("tve_di", 65000000); /* FIXME */
 	clk[iim_gate] = imx_clk_gate2("iim_gate", "ipg", MXC_CCM_CCGR0, 30);
 	clk[uart1_ipg_gate] = imx_clk_gate2("uart1_ipg_gate", "ipg", MXC_CCM_CCGR1, 6);
 	clk[uart1_per_gate] = imx_clk_gate2("uart1_per_gate", "uart_root", MXC_CCM_CCGR1, 8);
-- 
1.8.2.rc2
