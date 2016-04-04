From: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Subject: [PATCH] rtc: omap: Support ext_wakeup configuration
Date: Mon,  4 Apr 2016 17:56:43 +0200
Message-ID: <1459785403-1725-1-git-send-email-m.niestroj@grinn-global.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Support configuration of ext_wakeup sources. This patch makes it
possible to enable ext_wakeup and set it's polarity, depending on board
configuration. AM335x's dedicated PMIC (tps65217) uses ext_wakeup to
notify about power-button presses. Handling power-button presses enables
to recover from RTC-only power states correctly.

Signed-off-by: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
---
 Documentation/devicetree/bindings/rtc/rtc-omap.txt | 24 ++++++++++-
 drivers/rtc/rtc-omap.c                             | 46 +++++++++++++++++++++-
 2 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-omap.txt b/Documentation/devicetree/bindings/rtc/rtc-omap.txt
index bf7d11a..1c05311b 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-omap.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc-omap.txt
@@ -18,8 +18,20 @@ Optional properties:
   through pmic_power_en
 - clocks: Any internal or external clocks feeding in to rtc
 - clock-names: Corresponding names of the clocks
+- ti,ext-wakeup-en: Enables ext_wakeup[n] sources. Value determines which
+		    ext_wakeup is enabled by bitwise OR of corresponding bits.
+		    Examples:
+		     <1> - enabled ext_wakeup[0],
+		     <2> - enabled ext_wakeup[1],
+		     <3> - enabled ext_wakeup[0] and enabled ext_wakeup[1],
+		     ...
+- ti,ext-wakeup-pol: Sets polarity of ext_wakeup[n] sources, similarly as
+		     above. Set bit means active-low, unset bit means
+		     active-high. Examples:
+		      <1> - only ext_wakeup0 is active-low
+		      <3> - only ext_wakeup0 and ext_wakeup1 are active-low
 
-Example:
+Examples:
 
 rtc@1c23000 {
 	compatible = "ti,da830-rtc";
@@ -31,3 +43,13 @@ rtc@1c23000 {
 	clocks = <&clk_32k_rtc>, <&clk_32768_ck>;
 	clock-names = "ext-clk", "int-clk";
 };
+
+rtc@44e3e000 {
+	compatible = "ti,am3352-rtc", "ti,da830-rtc";
+	reg = <0x44e3e000 0x1000>;
+	interrupts = <75
+		      76>;
+	system-power-controller;
+	ti,ext-wakeup-en = <1>;
+	ti,ext-wakeup-pol = <1>;
+};
diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index ec2e9c5..1a46f5d 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -114,7 +114,11 @@
 #define OMAP_RTC_IRQWAKEEN_ALARM_WAKEEN	BIT(1)
 
 /* OMAP_RTC_PMIC bit fields: */
-#define OMAP_RTC_PMIC_POWER_EN_EN	BIT(16)
+#define OMAP_RTC_PMIC_POWER_EN_EN		BIT(16)
+#define OMAP_RTC_PMIC_EXT_WAKEUP_EN(x)		(x)
+#define OMAP_RTC_PMIC_EXT_WAKEUP_POL(x)		((x) << 4)
+#define OMAP_RTC_PMIC_EXT_WAKEUP_EN_MASK	0x0F
+#define OMAP_RTC_PMIC_EXT_WAKEUP_POL_MASK	0xF0
 
 /* OMAP_RTC_KICKER values */
 #define	KICK0_VALUE			0x83e70b13
@@ -533,6 +537,11 @@ static int omap_rtc_probe(struct platform_device *pdev)
 	const struct platform_device_id *id_entry;
 	const struct of_device_id *of_id;
 	int ret;
+	u32 ext_wakeup_en;
+	u32 ext_wakeup_pol;
+	bool has_ext_wakeup_en;
+	bool has_ext_wakeup_pol;
+	u32 val;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
@@ -544,6 +553,30 @@ static int omap_rtc_probe(struct platform_device *pdev)
 		rtc->is_pmic_controller = rtc->type->has_pmic_mode &&
 				of_property_read_bool(pdev->dev.of_node,
 						"system-power-controller");
+		if (of_property_read_u32(pdev->dev.of_node,
+						"ti,ext-wakeup-en",
+						&ext_wakeup_en) >= 0) {
+			if (ext_wakeup_en < BIT(4))
+				has_ext_wakeup_en = true;
+			else
+				dev_err(&pdev->dev,
+					"wrong ext-wakeup-en value\n");
+		} else {
+			dev_err(&pdev->dev,
+				"no ext-wakeup-en\n");
+		}
+		if (of_property_read_u32(pdev->dev.of_node,
+						"ti,ext-wakeup-pol",
+						&ext_wakeup_pol) >= 0) {
+			if (ext_wakeup_pol < BIT(4))
+				has_ext_wakeup_pol = true;
+			else
+				dev_err(&pdev->dev,
+					"wrong ext-wakeup-pol value\n");
+		} else {
+			dev_err(&pdev->dev,
+				"no ext-wakeup-pol\n");
+		}
 	} else {
 		id_entry = platform_get_device_id(pdev);
 		rtc->type = (void *)id_entry->driver_data;
@@ -650,6 +683,17 @@ static int omap_rtc_probe(struct platform_device *pdev)
 			  reg | OMAP_RTC_OSC_SEL_32KCLK_SRC);
 	}
 
+	if (has_ext_wakeup_en || has_ext_wakeup_pol) {
+		val = rtc_readl(rtc, OMAP_RTC_PMIC_REG);
+		if (has_ext_wakeup_en)
+			val = (val & ~OMAP_RTC_PMIC_EXT_WAKEUP_EN_MASK)
+				| OMAP_RTC_PMIC_EXT_WAKEUP_EN(ext_wakeup_en);
+		if (has_ext_wakeup_pol)
+			val = (val & ~OMAP_RTC_PMIC_EXT_WAKEUP_POL_MASK)
+				| OMAP_RTC_PMIC_EXT_WAKEUP_POL(ext_wakeup_pol);
+		rtc_writel(rtc, OMAP_RTC_PMIC_REG, val);
+	}
+
 	rtc->type->lock(rtc);
 
 	device_init_wakeup(&pdev->dev, true);
-- 
2.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
