From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH usb-next v2 2/3] usb: dwc3: of-simple: add support for shared and pulsed reset lines
Date: Sun, 11 Feb 2018 22:15:16 +0100
Message-ID: <20180211211517.5846-3-martin.blumenstingl@googlemail.com>
References: <20180211211517.5846-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180211211517.5846-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some SoCs (such as Amlogic Meson GXL for example) share the reset line
with other components (in case of the Meson GXL example there's a shared
reset line between the USB2 PHYs, USB3 PHYs and the dwc3 controller).
Additionally SoC implementations may prefer a reset pulse over level
resets.

For now this falls back to the old defaults, which are:
- reset lines are exclusive
- level resets are being used

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Tested-by: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/dwc3/dwc3-of-simple.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index 7ae0eefc7cc7..d2e4928c8d62 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -27,6 +27,7 @@ struct dwc3_of_simple {
 	struct clk		**clks;
 	int			num_clocks;
 	struct reset_control	*resets;
+	bool			pulse_resets;
 };
 
 static int dwc3_of_simple_clk_init(struct dwc3_of_simple *simple, int count)
@@ -83,6 +84,7 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 
 	int			ret;
 	int			i;
+	bool			shared_resets = false;
 
 	simple = devm_kzalloc(dev, sizeof(*simple), GFP_KERNEL);
 	if (!simple)
@@ -91,16 +93,22 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, simple);
 	simple->dev = dev;
 
-	simple->resets = of_reset_control_array_get_optional_exclusive(np);
+	simple->resets = of_reset_control_array_get(np, shared_resets, true);
 	if (IS_ERR(simple->resets)) {
 		ret = PTR_ERR(simple->resets);
 		dev_err(dev, "failed to get device resets, err=%d\n", ret);
 		return ret;
 	}
 
-	ret = reset_control_deassert(simple->resets);
-	if (ret)
-		goto err_resetc_put;
+	if (simple->pulse_resets) {
+		ret = reset_control_reset(simple->resets);
+		if (ret)
+			goto err_resetc_put;
+	} else {
+		ret = reset_control_deassert(simple->resets);
+		if (ret)
+			goto err_resetc_put;
+	}
 
 	ret = dwc3_of_simple_clk_init(simple, of_count_phandle_with_args(np,
 						"clocks", "#clock-cells"));
@@ -124,7 +132,8 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 	return 0;
 
 err_resetc_assert:
-	reset_control_assert(simple->resets);
+	if (!simple->pulse_resets)
+		reset_control_assert(simple->resets);
 
 err_resetc_put:
 	reset_control_put(simple->resets);
@@ -144,7 +153,9 @@ static int dwc3_of_simple_remove(struct platform_device *pdev)
 		clk_put(simple->clks[i]);
 	}
 
-	reset_control_assert(simple->resets);
+	if (!simple->pulse_resets)
+		reset_control_assert(simple->resets);
+
 	reset_control_put(simple->resets);
 
 	pm_runtime_put_sync(dev);
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
