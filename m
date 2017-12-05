From: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 7/9] pinctrl: axp209: add programmable ADC
 muxing value
Date: Tue,  5 Dec 2017 15:46:45 +0100
Message-ID: <20171205144647.17594-8-quentin.schulz@free-electrons.com>
References: <20171205144647.17594-1-quentin.schulz@free-electrons.com>
Reply-To: quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCLZXSNY5IDBBRPDTLIQKGQERGD6KMI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171205144647.17594-1-quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

To prepare for patches that will add support for a new PMIC that has a
different GPIO adc muxing value, add an adc_mux within axp20x_pctl
structure and use it.

Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/pinctrl/pinctrl-axp209.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-axp209.c b/drivers/pinctrl/pinctrl-axp209.c
index db8e319b6e11..9bb8722ba90f 100644
--- a/drivers/pinctrl/pinctrl-axp209.c
+++ b/drivers/pinctrl/pinctrl-axp209.c
@@ -49,6 +49,7 @@ struct axp20x_pctrl_desc {
 	/* Stores the pins supporting ADC function. Bit offset is pin number. */
 	u8				adc_mask;
 	u8				gpio_status_offset;
+	u8				adc_mux;
 };
 
 struct axp20x_pinctrl_function {
@@ -79,6 +80,7 @@ static const struct axp20x_pctrl_desc axp20x_data = {
 	.ldo_mask = BIT(0) | BIT(1),
 	.adc_mask = BIT(0) | BIT(1),
 	.gpio_status_offset = 4,
+	.adc_mux = AXP20X_MUX_ADC,
 };
 
 static int axp20x_gpio_get_reg(unsigned int offset)
@@ -334,7 +336,7 @@ static void axp20x_build_funcs_groups(struct platform_device *pdev)
 	 * See comment in axp20x_pmx_set_mux.
 	 */
 	pctl->funcs[AXP20X_FUNC_ADC].name = "adc";
-	pctl->funcs[AXP20X_FUNC_ADC].muxval = AXP20X_MUX_ADC;
+	pctl->funcs[AXP20X_FUNC_ADC].muxval = pctl->desc->adc_mux;
 
 	/* Every pin supports GPIO_OUT and GPIO_IN functions */
 	for (i = 0; i <= AXP20X_FUNC_GPIO_IN; i++) {
-- 
2.14.1
