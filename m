From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [RFC PATCH v3 3/4] arm64: smp: move the pen to a header file
Date: Fri, 10 Apr 2015 15:43:24 -0500
Message-ID: <1428698605-13166-4-git-send-email-galak@codeaurora.org>
References: <1428698605-13166-1-git-send-email-galak@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428698605-13166-1-git-send-email-galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Abhimanyu Kapur <abhimany-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Abhimanyu Kapur <abhimany-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Move the secondary_pen_release variable and the secondary_holding_pen
entry function to asm/smp_plat.h so that the other cpu ops implementations
can share them.

Signed-off-by: Abhimanyu Kapur <abhimany-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 arch/arm64/include/asm/smp_plat.h  | 2 ++
 arch/arm64/kernel/smp.c            | 1 +
 arch/arm64/kernel/smp_spin_table.c | 3 ---
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/smp_plat.h b/arch/arm64/include/asm/smp_plat.h
index 59e2823..235ff04 100644
--- a/arch/arm64/include/asm/smp_plat.h
+++ b/arch/arm64/include/asm/smp_plat.h
@@ -34,10 +34,12 @@ static inline u32 mpidr_hash_size(void)
 	return 1 << mpidr_hash.bits;
 }
 
+extern void secondary_holding_pen(void);
 /*
  * Logical CPU mapping.
  */
 extern u64 __cpu_logical_map[NR_CPUS];
 #define cpu_logical_map(cpu)    __cpu_logical_map[cpu]
+extern volatile unsigned long secondary_holding_pen_release;
 
 #endif /* __ASM_SMP_PLAT_H */
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 328b8ce..4ce1f23 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -61,6 +61,7 @@
  * where to place its SVC stack
  */
 struct secondary_data secondary_data;
+volatile unsigned long secondary_holding_pen_release = INVALID_HWID;
 
 enum ipi_msg_type {
 	IPI_RESCHEDULE,
diff --git a/arch/arm64/kernel/smp_spin_table.c b/arch/arm64/kernel/smp_spin_table.c
index 14944e5..808536e 100644
--- a/arch/arm64/kernel/smp_spin_table.c
+++ b/arch/arm64/kernel/smp_spin_table.c
@@ -28,9 +28,6 @@
 #include <asm/io.h>
 #include <asm/smp_plat.h>
 
-extern void secondary_holding_pen(void);
-volatile unsigned long secondary_holding_pen_release = INVALID_HWID;
-
 static phys_addr_t cpu_release_addr[NR_CPUS];
 
 /*
-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
