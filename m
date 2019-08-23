From: Abhishek Goel <huntbag@linux.vnet.ibm.com>
Subject: [RFC 3/3] cpuidle/powernv : Add flags to identify stop state type
Date: Fri, 23 Aug 2019 02:09:40 -0500
Message-ID: <20190823070940.43220-4-huntbag@linux.vnet.ibm.com>
References: <20190823070940.43220-1-huntbag@linux.vnet.ibm.com>
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20190823070940.43220-1-huntbag@linux.vnet.ibm.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, paulus@samba.org
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, daniel.lezcano@linaro.org, rjw@rjwysocki.net, npiggin@gmail.com, Abhishek Goel <huntbag@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

Removed threshold latency which was being used to decide if a state
is cpuidle type or not. This decision can be taken using flags, as this
information has been encapsulated in the state->flags and being read
from idle device-tree.

Signed-off-by: Abhishek Goel <huntbag@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/opal-api.h |  7 +++++++
 drivers/cpuidle/cpuidle-powernv.c   | 16 +++++++++-------
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index 383242eb0dea..b9068fee21d8 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -233,6 +233,13 @@
 #define OPAL_PM_STOP_INST_FAST		0x00100000
 #define OPAL_PM_STOP_INST_DEEP		0x00200000
 
+/*
+ * Flags for stop states to distinguish between cpuidle and
+ * cpuoffline type of states.
+ */
+#define OPAL_PM_STOP_CPUIDLE		0x01000000
+#define OPAL_PM_STOP_CPUHOTPLUG		0x02000000
+
 /*
  * OPAL_CONFIG_CPU_IDLE_STATE parameters
  */
diff --git a/drivers/cpuidle/cpuidle-powernv.c b/drivers/cpuidle/cpuidle-powernv.c
index 1b6c84d4ac77..1a33a548b769 100644
--- a/drivers/cpuidle/cpuidle-powernv.c
+++ b/drivers/cpuidle/cpuidle-powernv.c
@@ -270,8 +270,13 @@ static int powernv_add_idle_states(void)
 		goto out;
 	}
 
-	/* TODO: Count only states which are eligible for cpuidle */
-	dt_idle_states = nr_pnv_idle_states;
+	/* Count only cpuidle states*/
+	for (i = 0; i < nr_pnv_idle_states; i++) {
+		if (pnv_idle_states[i].flags & OPAL_PM_STOP_CPUIDLE)
+			dt_idle_states++;
+	}
+	pr_info("idle states in dt = %d , states with idle flag = %d",
+				nr_pnv_idle_states, dt_idle_states);
 
 	/*
 	 * Since snooze is used as first idle state, max idle states allowed is
@@ -300,11 +305,8 @@ static int powernv_add_idle_states(void)
 			continue;
 		}
 
-		/*
-		 * If an idle state has exit latency beyond
-		 * POWERNV_THRESHOLD_LATENCY_NS then don't use it in cpu-idle.
-		 */
-		if (state->latency_ns > POWERNV_THRESHOLD_LATENCY_NS) {
+		/* Check whether a state is of cpuidle type */
+		if ((state->flags & OPAL_PM_STOP_CPUIDLE) != state->flags) {
 			pr_info("State %d is not idletype\n", i);
 			continue;
 		}
-- 
2.17.1
