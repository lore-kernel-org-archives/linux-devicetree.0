From: Brendan Jackman <brendan.jackman-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC 3/6] cpuidle: Add device_node pointer in cpuidle_state
Date: Wed, 24 Aug 2016 14:48:19 +0100
Message-ID: <20160824134822.3591-4-brendan.jackman@arm.com>
References: <1470351902-43103-3-git-send-email-lina.iyer@linaro.org>
 <20160824134822.3591-1-brendan.jackman@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160824134822.3591-1-brendan.jackman-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org
Cc: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Axel Haslam <ahaslam+renesas-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Titinger <mtitinger+renesas-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Lina Iyer <lina.iyer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Store a pointer in the cpuidle_state structure to the Device Tree node
from which that state originated, if such a node exists.

This will allow plaform-specific components to extract extra idle state
information without duplicating the logic that finds the idle state
nodes.
---
 drivers/cpuidle/dt_idle_states.c |  3 +++
 include/linux/cpuidle.h          | 18 ++++++++++--------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/cpuidle/dt_idle_states.c b/drivers/cpuidle/dt_idle_states.c
index a5c111b..61a70ec 100644
--- a/drivers/cpuidle/dt_idle_states.c
+++ b/drivers/cpuidle/dt_idle_states.c
@@ -88,6 +88,9 @@ static int init_state_node(struct cpuidle_state *idle_state,
 	 */
 	strncpy(idle_state->name, state_node->name, CPUIDLE_NAME_LEN - 1);
 	strncpy(idle_state->desc, desc, CPUIDLE_DESC_LEN - 1);
+
+	idle_state->of_node = state_node;
+
 	return 0;
 }
 
diff --git a/include/linux/cpuidle.h b/include/linux/cpuidle.h
index 8435577..d4ea1e4 100644
--- a/include/linux/cpuidle.h
+++ b/include/linux/cpuidle.h
@@ -14,6 +14,7 @@
 #include <linux/percpu.h>
 #include <linux/list.h>
 #include <linux/hrtimer.h>
+#include <linux/of.h>
 
 #define CPUIDLE_STATE_MAX	10
 #define CPUIDLE_NAME_LEN	16
@@ -36,14 +37,15 @@ struct cpuidle_state_usage {
 };
 
 struct cpuidle_state {
-	char		name[CPUIDLE_NAME_LEN];
-	char		desc[CPUIDLE_DESC_LEN];
-
-	unsigned int	flags;
-	unsigned int	exit_latency; /* in US */
-	int		power_usage; /* in mW */
-	unsigned int	target_residency; /* in US */
-	bool		disabled; /* disabled on all CPUs */
+	char			name[CPUIDLE_NAME_LEN];
+	char			desc[CPUIDLE_DESC_LEN];
+
+	unsigned int		flags;
+	unsigned int		exit_latency; /* in US */
+	int			power_usage; /* in mW */
+	unsigned int		target_residency; /* in US */
+	bool			disabled; /* disabled on all CPUs */
+	struct device_node	*of_node;
 
 	int (*enter)	(struct cpuidle_device *dev,
 			struct cpuidle_driver *drv,
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
