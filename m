From: Rob Herring <robh@kernel.org>
Subject: [PATCH] mfd: Use of_node_name_eq for node name comparisons
Date: Wed,  5 Dec 2018 13:50:31 -0600
Message-ID: <20181205195050.4759-15-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

Convert string compares of DT node names to use of_node_name_eq helper
instead. This removes direct access to the node name pointer.

Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/mfd/max77620.c |  2 +-
 drivers/mfd/stmpe.c    | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
index d8217366ed36..d8ddd1a6f304 100644
--- a/drivers/mfd/max77620.c
+++ b/drivers/mfd/max77620.c
@@ -280,7 +280,7 @@ static int max77620_config_fps(struct max77620_chip *chip,
 
 	for (fps_id = 0; fps_id < MAX77620_FPS_COUNT; fps_id++) {
 		sprintf(fps_name, "fps%d", fps_id);
-		if (!strcmp(fps_np->name, fps_name))
+		if (of_node_name_eq(fps_np, fps_name))
 			break;
 	}
 
diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 566caca4efd8..7569a4be0608 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1302,17 +1302,17 @@ static void stmpe_of_probe(struct stmpe_platform_data *pdata,
 	pdata->autosleep = (pdata->autosleep_timeout) ? true : false;
 
 	for_each_child_of_node(np, child) {
-		if (!strcmp(child->name, "stmpe_gpio")) {
+		if (of_node_name_eq(child, "stmpe_gpio")) {
 			pdata->blocks |= STMPE_BLOCK_GPIO;
-		} else if (!strcmp(child->name, "stmpe_keypad")) {
+		} else if (of_node_name_eq(child, "stmpe_keypad")) {
 			pdata->blocks |= STMPE_BLOCK_KEYPAD;
-		} else if (!strcmp(child->name, "stmpe_touchscreen")) {
+		} else if (of_node_name_eq(child, "stmpe_touchscreen")) {
 			pdata->blocks |= STMPE_BLOCK_TOUCHSCREEN;
-		} else if (!strcmp(child->name, "stmpe_adc")) {
+		} else if (of_node_name_eq(child, "stmpe_adc")) {
 			pdata->blocks |= STMPE_BLOCK_ADC;
-		} else if (!strcmp(child->name, "stmpe_pwm")) {
+		} else if (of_node_name_eq(child, "stmpe_pwm")) {
 			pdata->blocks |= STMPE_BLOCK_PWM;
-		} else if (!strcmp(child->name, "stmpe_rotator")) {
+		} else if (of_node_name_eq(child, "stmpe_rotator")) {
 			pdata->blocks |= STMPE_BLOCK_ROTATOR;
 		}
 	}
-- 
2.19.1
