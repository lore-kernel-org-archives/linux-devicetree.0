From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Subject: [PATCH v6 2/5] powernv:stop: Rename pnv_arch300_idle_init to pnv_power9_idle_init
Date: Wed, 25 Jan 2017 14:06:26 +0530
Message-ID: <1485333389-5752-3-git-send-email-ego@linux.vnet.ibm.com>
References: <1485333389-5752-1-git-send-email-ego@linux.vnet.ibm.com>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1485333389-5752-1-git-send-email-ego@linux.vnet.ibm.com>
Sender: linux-pm-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, Michael Neuling <mikey@neuling.org>, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>, "Shreyas B. Prabhu" <shreyasbp@gmail.com>, Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Balbir Singh <bsingharora@gmail.com>, Oliver O'Halloran <oohall@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

Balbir pointed out that the name of the function pnv_arch300_idle_init
was inconsistent with the names of the variables and functions
pertaining to POWER9 features in book3s_idle.S.

This patch renames pnv_arch300_idle_init to pnv_power9_idle_init.

This patch does not change any behaviour.

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/powernv/idle.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 479c256..57bec03 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -298,7 +298,7 @@ static void power9_idle(void)
  * @dt_idle_states: Number of idle state entries
  * Returns 0 on success
  */
-static int __init pnv_arch300_idle_init(struct device_node *np, u32 *flags,
+static int __init pnv_power9_idle_init(struct device_node *np, u32 *flags,
 					int dt_idle_states)
 {
 	u64 *psscr_val = NULL;
@@ -373,7 +373,7 @@ static void __init pnv_probe_idle_states(void)
 	}
 
 	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
-		if (pnv_arch300_idle_init(np, flags, dt_idle_states))
+		if (pnv_power9_idle_init(np, flags, dt_idle_states))
 			goto out;
 	}
 
-- 
1.9.4

