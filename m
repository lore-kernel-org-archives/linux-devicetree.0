From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH V6 4/5] arm: mm: Add support for PJ4B cpu and init routines
Date: Wed, 21 Nov 2012 15:59:29 +0100
Message-ID: <1353509970-5237-5-git-send-email-gregory.clement@free-electrons.com>
References: <1353509970-5237-1-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1353509970-5237-1-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ike Pan <ike.pan-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ian Molton <ian.molton-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, David Marlin <dmarlin-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jani Monoses <jani.monoses-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Dan Frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Leif Lindholm <leif.lindholm-5wv7dgnIgG8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chris Van Hoof <vanhoof-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-kernel-u79uwXL29TaqPxH82wqD4g@public.gmane.org
List-Id: devicetree@vger.kernel.org

PJ4B is an implementation of the ARMv7 (such as the Cortex A9 for
example) released by Marvell. This CPU is currently found in
Armada 370 and Armada XP SoCs. This patch provides a support for the
specific initialization of this CPU.

Signed-off-by: Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Reviewed-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Acked-by: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/mach-mvebu/Kconfig |    2 +-
 arch/arm/mm/Kconfig         |    4 +++
 arch/arm/mm/proc-v7.S       |   66 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-mvebu/Kconfig b/arch/arm/mach-mvebu/Kconfig
index 79299cd..f4c3bf8 100644
--- a/arch/arm/mach-mvebu/Kconfig
+++ b/arch/arm/mach-mvebu/Kconfig
@@ -21,7 +21,7 @@ menu "Marvell SOC with device tree"
 config MACH_ARMADA_370_XP
 	bool
 	select ARMADA_370_XP_TIMER
-	select CPU_V7
+	select CPU_PJ4B
 
 config MACH_ARMADA_370
 	bool "Marvell Armada 370 boards"
diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 94186b6..3fd629d 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -352,6 +352,10 @@ config CPU_PJ4
 	select ARM_THUMBEE
 	select CPU_V7
 
+config CPU_PJ4B
+	bool
+	select CPU_V7
+
 # ARMv6
 config CPU_V6
 	bool "Support ARM V6 processor" if ARCH_INTEGRATOR || MACH_REALVIEW_EB || MACH_REALVIEW_PBX
diff --git a/arch/arm/mm/proc-v7.S b/arch/arm/mm/proc-v7.S
index 846d279..1aa3891 100644
--- a/arch/arm/mm/proc-v7.S
+++ b/arch/arm/mm/proc-v7.S
@@ -169,6 +169,62 @@ __v7_ca15mp_setup:
 	orreq	r0, r0, r10			@ Enable CPU-specific SMP bits
 	mcreq	p15, 0, r0, c1, c0, 1
 #endif
+
+__v7_pj4b_setup:
+#ifdef CONFIG_CPU_PJ4B
+
+/* Auxiliary Debug Modes Control 1 Register */
+#define STATIC_BP     (1 << 2) /* Enable Static BP */
+#define INTER_PARITY  (1 << 8) /* Disable Internal Parity Handling */
+#define BCK_OFF_STREX (1 << 5) /* Enable the back off of STREX instr */
+#define CLEAN_LINE    (1 << 16) /* Disable data transfer for clean line */
+
+/* Auxiliary Debug Modes Control 2 Register */
+#define FAST_LDR      (1 << 23) /* Disable fast LDR */
+#define SNOOP_DATA    (1 << 25) /* Do not interleave write and snoop data */
+#define CWF           (1 << 27) /* Disable Critical Word First feature */
+#define OUTSANDING_NC (1 << 29) /* Disable outstanding non cacheable request */
+#define L1_REP_RR     (1 << 30) /* L1 replacement - Strict round robin */
+#define AUX_DBG_CTRL2 (SNOOP_DATA | CWF | OUTSANDING_NC | L1_REP_RR)
+
+/* Auxiliary Functional Modes Control Register 0 */
+#define SMP_CFB         (1 << 1) /* Set SMP mode. Join the coherency fabric */
+#define L1_PAR_CHK      (1 << 2) /* Support L1 parity checking */
+#define BROADCAST_CACHE (1 << 8) /* Broadcast Cache and TLB maintenance */
+
+/* Auxiliary Debug Modes Control 0 Register */
+#define WFI_WFE         (1 << 22) /* WFI/WFE - serve the DVM and back to idle */
+
+	/* Auxiliary Debug Modes Control 1 Register */
+	mrc	p15, 1,	r0, c15, c1, 1
+	orr     r0, r0, #CLEAN_LINE
+	orr     r0, r0, #BCK_OFF_STREX
+	orr     r0, r0, #INTER_PARITY
+	bic	r0, r0, #STATIC_BP
+	mcr	p15, 1,	r0, c15, c1, 1
+
+	/* Auxiliary Debug Modes Control 2 Register */
+	mrc	p15, 1,	r0, c15, c1, 2
+	bic	r0, r0, #FAST_LDR
+	orr	r0, r0, #AUX_DBG_CTRL2
+	mcr	p15, 1,	r0, c15, c1, 2
+
+	/* Auxiliary Functional Modes Control Register 0 */
+	mrc	p15, 1,	r0, c15, c2, 0
+#ifdef CONFIG_SMP
+	orr	r0, r0, #SMP_CFB
+#endif
+	orr	r0, r0, #L1_PAR_CHK
+	orr	r0, r0, #BROADCAST_CACHE
+	mcr	p15, 1,	r0, c15, c2, 0
+
+	/* Auxiliary Debug Modes Control 0 Register */
+	mrc	p15, 1,	r0, c15, c1, 0
+	orr	r0, r0, #WFI_WFE
+	mcr	p15, 1,	r0, c15, c1, 0
+
+#endif /* CONFIG_CPU_PJ4B */
+
 __v7_setup:
 	adr	r12, __v7_setup_stack		@ the local stack
 	stmia	r12, {r0-r5, r7, r9, r11, lr}
@@ -342,6 +398,16 @@ __v7_ca9mp_proc_info:
 	.long	0xff0ffff0
 	__v7_proc __v7_ca9mp_setup
 	.size	__v7_ca9mp_proc_info, . - __v7_ca9mp_proc_info
+
+	/*
+	 * Marvell PJ4B processor.
+	 */
+	.type   __v7_pj4b_proc_info, #object
+__v7_pj4b_proc_info:
+	.long	0x562f5840
+	.long	0xfffffff0
+	__v7_proc __v7_pj4b_setup
+	.size	__v7_pj4b_proc_info, . - __v7_pj4b_proc_info
 #endif	/* CONFIG_ARM_LPAE */
 
 	/*
-- 
1.7.9.5
