From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 1/2] pinctrl: Allow a device to indicate when to force a state
Date: Wed, 20 Sep 2017 18:04:20 -0700
Message-ID: <20170921010421.7467-2-f.fainelli@gmail.com>
References: <20170921010421.7467-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170921010421.7467-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org, swarren@nvidia.com, andy.shevchenko@gmail.com, alcooperx@gmail.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bcm-kernel-feedback-list@broadcom.com, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

It may happen that a device needs to force applying a state, e.g:
because it only defines one state of pin states (default) but loses
power/register contents when entering low power modes. Add a
pinctrl_dev::flags bitmask to help describe future quirks and define
PINCTRL_FLG_FORCE_STATE as such a settable flag.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/pinctrl/core.c | 15 +++++++++++++++
 drivers/pinctrl/core.h |  4 ++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 56fbe4c3e800..c450a97de88f 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1197,11 +1197,26 @@ int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *state)
 {
 	struct pinctrl_setting *setting, *setting2;
 	struct pinctrl_state *old_state = p->state;
+	bool force = false;
 	int ret;
 
 	if (p->state == state)
 		return 0;
 
+	if (p->state) {
+		list_for_each_entry(setting, &p->state->settings, node) {
+			if (setting->pctldev->flags & PINCTRL_FLG_FORCE_STATE)
+				force = true;
+		}
+	}
+
+	/* Some controllers may want to force this operation when they define
+	 * only one set of functions and lose power state, e.g: pinctrl-single
+	 * with its pinctrl-single,low-power-state-loss property.
+	 */
+	if (p->state == state && !force)
+		return 0;
+
 	if (p->state) {
 		/*
 		 * For each pinmux setting in the old state, forget SW's record
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 7880c3adc450..5fbf4dd1fa76 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -39,6 +39,7 @@ struct pinctrl_gpio_range;
  * @hog_sleep: sleep state for pins hogged by this device
  * @mutex: mutex taken on each pin controller specific action
  * @device_root: debugfs root for this device
+ * @flags: feature/quirk flags
  */
 struct pinctrl_dev {
 	struct list_head node;
@@ -63,8 +64,11 @@ struct pinctrl_dev {
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *device_root;
 #endif
+	unsigned long flags;
 };
 
+#define PINCTRL_FLG_FORCE_STATE	(1 << 0)
+
 /**
  * struct pinctrl - per-device pin control state holder
  * @node: global list node
-- 
2.14.1
