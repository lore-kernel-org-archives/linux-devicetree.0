From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: [PATCH 2/3] regulator: axp20x: simplify the treatment
 of linked regulators
Date: Tue, 20 Sep 2016 18:38:31 +0200
Message-ID: <7496199d0a35463dc66346eb0985d059cbdcfc11.1474616699.git.moinejf@free.fr>
References: <cover.1474616699.git.moinejf@free.fr>
Reply-To: moinejf-GANU6spQydw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCV6DL6LYMNBB3F4SO7QKGQEC5UQGLA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.1474616699.git.moinejf-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Using ancillary variables for handling the linked regulators simplifies
the loop of regulator creation and makes easier the addition of new
regulator types.

Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
---
 drivers/regulator/axp20x-regulator.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index 4e5e7c8..7405f5b 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -511,6 +511,10 @@ static int axp20x_regulator_probe(struct platform_device *pdev)
 	u32 workmode;
 	const char *dcdc1_name = axp22x_regulators[AXP22X_DCDC1].name;
 	const char *dcdc5_name = axp22x_regulators[AXP22X_DCDC5].name;
+	s8 dcdc1_ix = -1;
+	s8 dcdc5_ix = -1;
+	s8 dc1sw_ix = -1;
+	s8 dc5ldo_ix = -1;
 	bool drivevbus = false;
 	u32 skip_bitmap = 0;
 
@@ -524,6 +528,10 @@ static int axp20x_regulator_probe(struct platform_device *pdev)
 	case AXP223_ID:
 		regulators = axp22x_regulators;
 		nregulators = AXP22X_REG_ID_MAX;
+		dcdc1_ix = AXP22X_DCDC1;
+		dcdc5_ix = AXP22X_DCDC5;
+		dc1sw_ix = AXP22X_DC1SW;
+		dc5ldo_ix = AXP22X_DC5LDO;
 		drivevbus = of_property_read_bool(pdev->dev.parent->of_node,
 						  "x-powers,drive-vbus-en");
 		break;
@@ -541,6 +549,10 @@ static int axp20x_regulator_probe(struct platform_device *pdev)
 	case AXP809_ID:
 		regulators = axp809_regulators;
 		nregulators = AXP809_REG_ID_MAX;
+		dcdc1_ix = AXP809_DCDC1;
+		dcdc5_ix = AXP809_DCDC5;
+		dc1sw_ix = AXP809_DC1SW;
+		dc5ldo_ix = AXP809_DC5LDO;
 		break;
 	default:
 		dev_err(&pdev->dev, "Unsupported AXP variant: %ld\n",
@@ -567,8 +579,7 @@ static int axp20x_regulator_probe(struct platform_device *pdev)
 		 * part of this loop to see where we save the DT defined
 		 * name.
 		 */
-		if ((regulators == axp22x_regulators && i == AXP22X_DC1SW) ||
-		    (regulators == axp809_regulators && i == AXP809_DC1SW)) {
+		if (i == dc1sw_ix && dcdc1_name) {
 			new_desc = devm_kzalloc(&pdev->dev, sizeof(*desc),
 						GFP_KERNEL);
 			*new_desc = regulators[i];
@@ -576,8 +587,7 @@ static int axp20x_regulator_probe(struct platform_device *pdev)
 			desc = new_desc;
 		}
 
-		if ((regulators == axp22x_regulators && i == AXP22X_DC5LDO) ||
-		    (regulators == axp809_regulators && i == AXP809_DC5LDO)) {
+		if (i == dc5ldo_ix && dcdc5_name) {
 			new_desc = devm_kzalloc(&pdev->dev, sizeof(*desc),
 						GFP_KERNEL);
 			*new_desc = regulators[i];
@@ -605,14 +615,12 @@ static int axp20x_regulator_probe(struct platform_device *pdev)
 		/*
 		 * Save AXP22X DCDC1 / DCDC5 regulator names for later.
 		 */
-		if ((regulators == axp22x_regulators && i == AXP22X_DCDC1) ||
-		    (regulators == axp809_regulators && i == AXP809_DCDC1))
+		if (i == dcdc1_ix)
 			of_property_read_string(rdev->dev.of_node,
 						"regulator-name",
 						&dcdc1_name);
 
-		if ((regulators == axp22x_regulators && i == AXP22X_DCDC5) ||
-		    (regulators == axp809_regulators && i == AXP809_DCDC5))
+		if (i == dcdc5_ix)
 			of_property_read_string(rdev->dev.of_node,
 						"regulator-name",
 						&dcdc5_name);
-- 
2.10.0
