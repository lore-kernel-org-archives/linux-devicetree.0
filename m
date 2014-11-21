From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCHv3 12/16] ARM: mvebu: make sure MMU is disabled in armada_370_xp_cpu_resume
Date: Fri, 21 Nov 2014 17:00:09 +0100
Message-ID: <1416585613-2113-13-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416585613-2113-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416585613-2113-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The armada_370_xp_cpu_resume() until now was used only as the function
called by the SoC when returning from a deep idle state (as used in
cpuidle, or when the CPU is brought offline using CPU hotplug).

However, it is now also used when exiting the suspend to RAM state. In
this case, it is the bootloader that calls back into this function,
with the MMU left enabled by the BootROM. Having the MMU enabled when
entering this function confuses the kerrnel because we are not using
the kernel page tables at this point, but in other mvebu functions we
use the information on whether the MMU is enabled or not to find out
whether we should talk to the coherency fabric using a physical
address or a virtual address. To fix that, we simply disable the MMU
when entering this function, so that the kernel is in an expected
situation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/mach-mvebu/pmsu_ll.S | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/mach-mvebu/pmsu_ll.S b/arch/arm/mach-mvebu/pmsu_ll.S
index a945756..ae7e6b0 100644
--- a/arch/arm/mach-mvebu/pmsu_ll.S
+++ b/arch/arm/mach-mvebu/pmsu_ll.S
@@ -18,6 +18,14 @@
  */
 ENTRY(armada_370_xp_cpu_resume)
 ARM_BE8(setend	be )			@ go BE8 if entered LE
+	/*
+	 * Disable the MMU that might have been enabled in BootROM if
+	 * this code is used in the resume path of a suspend/resume
+	 * cycle.
+	 */
+	mrc	p15, 0, r1, c1, c0, 0
+	bic	r1, #1
+	mcr	p15, 0, r1, c1, c0, 0
 	bl	ll_add_cpu_to_smp_group
 	bl	ll_enable_coherency
 	b	cpu_resume
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
