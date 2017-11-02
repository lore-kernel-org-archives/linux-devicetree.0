From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v2 1/2] pinctrl: Allow a device to indicate when to force a state
Date: Thu,  2 Nov 2017 16:15:50 -0700
Message-ID: <20171102231551.16220-2-f.fainelli@gmail.com>
References: <20171102231551.16220-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171102231551.16220-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, ckeepax@opensource.cirrus.com, tony@atomide.com, ckeepax@opensource.wolfsonmicro.com, swarren@nvidia.com, andy.shevchenko@gmail.com, alcooperx@gmail.com, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

It may happen that a device needs to force applying a state, e.g:
because it only defines one state of pin states (default) but loses
power/register contents when entering low power modes. Add a
pinctrl_dev::flags bitmask to help describe future quirks and define
PINCTRL_FLG_FORCE_STATE as such a settable flag.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/pinctrl/core.c | 14 +++++++++++++-
 drivers/pinctrl/core.h |  4 ++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 4c8d5b23e4d0..c91359d48aa1 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1197,9 +1197,21 @@ int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *state)
 {
 	struct pinctrl_setting *setting, *setting2;
 	struct pinctrl_state *old_state = p->state;
+	bool force = false;
 	int ret;
 
-	if (p->state == state)
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
 		return 0;
 
 	if (p->state) {
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 8cf2eba17c8c..8f900e152295 100644
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
2.9.3
