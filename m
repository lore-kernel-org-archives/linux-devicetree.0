From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 3/6] drivers: firmware: psci: move power_state handling to generic code
Date: Fri, 29 May 2015 13:16:36 +0100
Message-ID: <1432901799-18359-4-git-send-email-lorenzo.pieralisi@arm.com>
References: <1432901799-18359-1-git-send-email-lorenzo.pieralisi@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432901799-18359-1-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Anup Patel <anup.patel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Functions implemented on arm64 to check if a power_state parameter
is valid and if the power_state implies context loss are not
arm64 specific and should be moved to generic code so that they
can be reused on arm systems too.

This patch moves the functions handling the power_state parameter
to generic PSCI firmware layer code.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Acked-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/kernel/psci.c | 14 --------------
 drivers/firmware/psci.c  | 15 +++++++++++++++
 include/linux/psci.h     |  2 ++
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kernel/psci.c b/arch/arm64/kernel/psci.c
index 8063891..a0fc99a 100644
--- a/arch/arm64/kernel/psci.c
+++ b/arch/arm64/kernel/psci.c
@@ -30,20 +30,6 @@
 #include <asm/smp_plat.h>
 #include <asm/suspend.h>
 
-static bool psci_power_state_loses_context(u32 state)
-{
-	return state & PSCI_0_2_POWER_STATE_TYPE_MASK;
-}
-
-static bool psci_power_state_is_valid(u32 state)
-{
-	const u32 valid_mask = PSCI_0_2_POWER_STATE_ID_MASK |
-			       PSCI_0_2_POWER_STATE_TYPE_MASK |
-			       PSCI_0_2_POWER_STATE_AFFL_MASK;
-
-	return !(state & ~valid_mask);
-}
-
 static DEFINE_PER_CPU_READ_MOSTLY(u32 *, psci_power_state);
 
 static int __maybe_unused cpu_psci_cpu_init_idle(unsigned int cpu)
diff --git a/drivers/firmware/psci.c b/drivers/firmware/psci.c
index afb955f0..f1579a4 100644
--- a/drivers/firmware/psci.c
+++ b/drivers/firmware/psci.c
@@ -69,6 +69,21 @@ enum psci_function {
 
 static u32 psci_function_id[PSCI_FN_MAX];
 
+#define PSCI_0_2_POWER_STATE_MASK		\
+				(PSCI_0_2_POWER_STATE_ID_MASK | \
+				PSCI_0_2_POWER_STATE_TYPE_MASK | \
+				PSCI_0_2_POWER_STATE_AFFL_MASK)
+
+bool psci_power_state_loses_context(u32 state)
+{
+	return state & PSCI_0_2_POWER_STATE_TYPE_MASK;
+}
+
+bool psci_power_state_is_valid(u32 state)
+{
+	return !(state & ~PSCI_0_2_POWER_STATE_MASK);
+}
+
 static int psci_to_linux_errno(int errno)
 {
 	switch (errno) {
diff --git a/include/linux/psci.h b/include/linux/psci.h
index a682fcc..12c4865 100644
--- a/include/linux/psci.h
+++ b/include/linux/psci.h
@@ -21,6 +21,8 @@
 #define PSCI_POWER_STATE_TYPE_POWER_DOWN	1
 
 bool psci_tos_resident_on(int cpu);
+bool psci_power_state_loses_context(u32 state);
+bool psci_power_state_is_valid(u32 state);
 
 struct psci_operations {
 	int (*cpu_suspend)(u32 state, unsigned long entry_point);
-- 
2.2.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
