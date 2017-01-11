From: Matt Ranostay <matt@ranostay.consulting>
Subject: [PATCH v3 2/7] power: power_supply: add battery information struct
Date: Tue, 10 Jan 2017 22:19:58 -0800
Message-ID: <20170111062003.10110-3-matt@ranostay.consulting>
References: <20170111062003.10110-1-matt@ranostay.consulting>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <20170111062003.10110-1-matt@ranostay.consulting>
Sender: linux-pm-owner@vger.kernel.org
To: linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Cc: sre@kernel.org, tony@atomide.com, Matt Ranostay <matt@ranostay.consulting>
List-Id: devicetree@vger.kernel.org

Add power_supply_battery_info structure that is used to
enumerate battery state machine settings.

Signed-off-by: Matt Ranostay <matt@ranostay.consulting>
---
 include/linux/power_supply.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
index 3965503315ef..59674a257d5e 100644
--- a/include/linux/power_supply.h
+++ b/include/linux/power_supply.h
@@ -288,6 +288,18 @@ struct power_supply_info {
 	int use_for_apm;
 };
 
+/*
+ * This is the recommended struct to specify static battery parameters.
+ * Power supply class itself doesn't use this, but it implements access
+ * that most platform drivers should use for consistency.
+ */
+
+struct power_supply_battery_info {
+	int energy;		/* uWh */
+	int power;		/* uAh */
+	int nominal_voltage;	/* uV */
+};
+
 extern struct atomic_notifier_head power_supply_notifier;
 extern int power_supply_reg_notifier(struct notifier_block *nb);
 extern void power_supply_unreg_notifier(struct notifier_block *nb);
-- 
2.10.2

