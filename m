From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv4 1/2] regulator: of: Add support for parsing regulator_state
 for suspend state
Date: Mon, 18 Aug 2014 15:27:02 +0900
Message-ID: <1408343223-4043-2-git-send-email-cw00.choi@samsung.com>
References: <1408343223-4043-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1408343223-4043-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, grant.likely@linaro.org, robh+dt@kernel.org, kyungmin.park@samsung.com, k.kozlowski@samsung.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: devicetree@vger.kernel.org

The regulation_constraints structure includes specific field to support
suspend state for global PMIC SUSPEND/HIBERNATE mode. This patch add support
for parsing regulator_state for suspend state.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/regulator/of_regulator.c | 65 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index ee5e67b..5fe5748 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -16,12 +16,19 @@
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
 
+const char *const regulator_states[PM_SUSPEND_MAX + 1] = {
+	[PM_SUSPEND_MEM]	= "regulator-state-mem",
+	[PM_SUSPEND_MAX]	= "regulator-state-disk",
+};
+
 static void of_get_regulation_constraints(struct device_node *np,
 					struct regulator_init_data **init_data)
 {
-	const __be32 *min_uV, *max_uV;
+	const __be32 *min_uV, *max_uV, *suspend_uV;
 	struct regulation_constraints *constraints = &(*init_data)->constraints;
-	int ret;
+	struct regulator_state *suspend_state;
+	struct device_node *suspend_np;
+	int ret, i;
 	u32 pval;
 
 	constraints->name = of_get_property(np, "regulator-name", NULL);
@@ -70,6 +77,60 @@ static void of_get_regulation_constraints(struct device_node *np,
 	ret = of_property_read_u32(np, "regulator-enable-ramp-delay", &pval);
 	if (!ret)
 		constraints->enable_time = pval;
+
+	ret = of_property_read_u32(np, "regulator-initial-state", &pval);
+	if (!ret) {
+		switch (pval) {
+		case PM_SUSPEND_MEM:
+		case PM_SUSPEND_MAX:
+			constraints->initial_state = pval;
+			break;
+		default:
+			break;
+		};
+	}
+
+	for (i = 0; i < ARRAY_SIZE(regulator_states); i++) {
+		switch (i) {
+		case PM_SUSPEND_MEM:
+			suspend_state = &constraints->state_mem;
+			break;
+		case PM_SUSPEND_MAX:
+			suspend_state = &constraints->state_disk;
+			break;
+		case PM_SUSPEND_ON:
+		case PM_SUSPEND_FREEZE:
+		case PM_SUSPEND_STANDBY:
+		default:
+			continue;
+		};
+
+		suspend_np = of_get_child_by_name(np, regulator_states[i]);
+		if (!suspend_np || !suspend_state)
+			continue;
+
+		suspend_uV = of_get_property(suspend_np, "regulator-volt",
+						NULL);
+		if (suspend_uV) {
+			suspend_state->uV = be32_to_cpu(*suspend_uV);
+
+			if (suspend_state->uV < constraints->min_uV)
+				suspend_state->uV = constraints->min_uV;
+			if (suspend_state->uV > constraints->max_uV)
+				suspend_state->uV = constraints->max_uV;
+		}
+
+		if (of_property_read_bool(suspend_np,
+					"regulator-on-in-suspend"))
+			suspend_state->enabled = true;
+
+		if (of_property_read_bool(suspend_np,
+					"regulator-off-in-suspend"))
+			suspend_state->disabled = true;
+
+		suspend_state = NULL;
+		suspend_np = NULL;
+	}
 }
 
 /**
-- 
1.8.0
