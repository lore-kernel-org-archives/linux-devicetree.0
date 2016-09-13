From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v3 2/4] drm/msm/hdmi: Clean up HDMI gpio DT bindings
Date: Tue, 13 Sep 2016 20:51:35 +0530
Message-ID: <1473780097-11388-3-git-send-email-architt@codeaurora.org>
References: <1472737015-29382-1-git-send-email-architt@codeaurora.org>
 <1473780097-11388-1-git-send-email-architt@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473780097-11388-1-git-send-email-architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Make the following changes in the HDMI gpio bindings:

- Use "-gpios" as the suffix for all the gpio names
- Move all the gpios to optional, since there are platforms that use none
  of them.
- The HPD gpio is a standard one, remove the "qcom,hdmi-tx-" prefix from
  it.
- Remove the HDMI DDC clk/data gpios. They are just leftovers of an old
  way to configure pinctrl properties.
- Add a missing lpm gpio used on some platforms.

Make the necessary changes in the driver to incorporate these changes.

There hasn't been any upstream DT that uses the HDMI bindings, so it's
okay to change and move around these properties.

Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
v3:
- Removed HDMI DDC clk/data gpios.

 .../devicetree/bindings/display/msm/hdmi.txt        |  9 ++++-----
 drivers/gpu/drm/msm/hdmi/hdmi.c                     | 21 +++++++++++++++++++--
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.txt b/Documentation/devicetree/bindings/display/msm/hdmi.txt
index ce84459..bfa7259 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.txt
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.txt
@@ -13,17 +13,16 @@ Required properties:
 - interrupts: The interrupt signal from the hdmi block.
 - clocks: device clocks
   See ../clocks/clock-bindings.txt for details.
-- qcom,hdmi-tx-ddc-clk-gpio: ddc clk pin
-- qcom,hdmi-tx-ddc-data-gpio: ddc data pin
-- qcom,hdmi-tx-hpd-gpio: hpd pin
 - core-vdda-supply: phandle to supply regulator
 - hdmi-mux-supply: phandle to mux regulator
 - phys: the phandle for the HDMI PHY device
 - phy-names: the name of the corresponding PHY device
 
 Optional properties:
-- qcom,hdmi-tx-mux-en-gpio: hdmi mux enable pin
-- qcom,hdmi-tx-mux-sel-gpio: hdmi mux select pin
+- hpd-gpios: hpd pin
+- qcom,hdmi-tx-mux-en-gpios: hdmi mux enable pin
+- qcom,hdmi-tx-mux-sel-gpios: hdmi mux select pin
+- qcom,hdmi-tx-mux-lpm-gpios: hdmi mux lpm pin
 - power-domains: reference to the power domain(s), if available.
 - pinctrl-names: the pin control state names; should contain "default"
 - pinctrl-0: the default pinctrl state (active)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 9737207..a968cad 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -422,12 +422,29 @@ static const struct {
 
 static int msm_hdmi_get_gpio(struct device_node *of_node, const char *name)
 {
-	int gpio = of_get_named_gpio(of_node, name, 0);
+	int gpio;
+
+	/* try with the gpio names as in the table (downstream bindings) */
+	gpio = of_get_named_gpio(of_node, name, 0);
 	if (gpio < 0) {
 		char name2[32];
-		snprintf(name2, sizeof(name2), "%s-gpio", name);
+
+		/* try with the gpio names as in the upstream bindings */
+		snprintf(name2, sizeof(name2), "%s-gpios", name);
 		gpio = of_get_named_gpio(of_node, name2, 0);
 		if (gpio < 0) {
+			char name3[32];
+
+			/*
+			 * try again after stripping out the "qcom,hdmi-tx"
+			 * prefix. This is mainly to match "hpd-gpios" used
+			 * in the upstream bindings
+			 */
+			if (sscanf(name2, "qcom,hdmi-tx-%s", name3))
+				gpio = of_get_named_gpio(of_node, name3, 0);
+		}
+
+		if (gpio < 0) {
 			DBG("failed to get gpio: %s (%d)", name, gpio);
 			gpio = -1;
 		}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
