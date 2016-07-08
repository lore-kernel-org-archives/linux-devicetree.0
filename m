From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH 2/4] drm/msm/hdmi: Use more DT friendly GPIO names
Date: Fri,  8 Jul 2016 11:25:52 +0530
Message-ID: <1467957354-7620-3-git-send-email-architt@codeaurora.org>
References: <1467957354-7620-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1467957354-7620-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robdclark@gmail.com, andy.gross@linaro.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Update the gpio name parsing code to try to search for without the
"qcom,hdmi-tx-" prefix. The older downstream bindings that expect
"qcom,hdmi-tx-xyz" or "qcom,hdmi-tx-xyz-gpio" would work as the
property name would work as before.

Update the binding doc. Add an entry for the missing hpd and lpm
gpios.

Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org

Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 Documentation/devicetree/bindings/display/msm/hdmi.txt |  6 ++++--
 drivers/gpu/drm/msm/hdmi/hdmi.c                        | 16 ++++++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.txt b/Documentation/devicetree/bindings/display/msm/hdmi.txt
index b63f614..4da1abd 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.txt
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.txt
@@ -23,8 +23,10 @@ Required properties:
 - phy-names: the name of the corresponding PHY device
 
 Optional properties:
-- qcom,hdmi-tx-mux-en-gpio: hdmi mux enable pin
-- qcom,hdmi-tx-mux-sel-gpio: hdmi mux select pin
+- hpd-gpio: hdmi hpd pin
+- mux-en-gpio: hdmi mux enable pin
+- mux-sel-gpio: hdmi mux select pin
+- mux-lpm-gpio: hdmi mux lpm pin
 - power-domains: reference to the power domain(s), if available.
 - pinctrl-names: the pin control state names; should contain "default"
 - pinctrl-0: the default pinctrl state (active)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 51b9ea5..d48305f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -422,11 +422,27 @@ static const struct {
 static int msm_hdmi_get_gpio(struct device_node *of_node, const char *name)
 {
 	int gpio = of_get_named_gpio(of_node, name, 0);
+
+	/*
+	 * This is complicated mainly because we want the downstream kernel
+	 * DT files working with the upstream kernel. We first try with the
+	 * names as listed above in the table. We then append "gpio" to it and
+	 * try again. We finally try the DT bindings as they would be in
+	 * upstream dtsi files by stripping off the "qcom,hdmi-tx-" prefix.
+	 * We'll get rid of this when we don't rely on downstream bindings.
+	 */
 	if (gpio < 0) {
 		char name2[32];
 		snprintf(name2, sizeof(name2), "%s-gpio", name);
 		gpio = of_get_named_gpio(of_node, name2, 0);
 		if (gpio < 0) {
+			char name3[32];
+
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
