From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 1/2] ARM: smccc-call: Use r12 to route secure monitor calls on TI platforms
Date: Mon, 18 Sep 2017 15:50:04 -0500
Message-ID: <20170918205005.30235-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F . Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Our ROM Secure Monitor(SM) uses the value in r12 to determine which
service is being requested by an SMC call. This inline with the ARM
recommended SMC Calling Convention(SMCCC), which partitions the values
in R0 for this task, OP-TEE's SM follows the ARM recommended convention.

We need a way to signal that a call is for the OP-TEE SM and not for
the ROM SM in a way that is safe for the ROM SM, in case it is still
present. We do this by putting a value of 0x200 in r12 when the call
is for OP-TEE or any other ARM by modifying the SMCCC caller function.

There are four combinations of events:

If the ROM SM is present and we make a legacy style SMC call, as we
do in early boot, the call will not have r12 set to 0x200 as these
calls go through existing mach-omap2/ SMC handlers, so all is well.

If the ROM SM is present and we make an SMCCC style call, r12 will be
set to 0x200 and ROM SM will see this as an invalid service call and
safely return to the normal world.

If OP-TEE is present and we make a legacy style SMC call, r12 will
not be set to 0x200, and OP-TEE will emulate the functionality that
the call is requesting.

If OP-TEE is present and we make an SMCC style call, r12 is checked
and as it will be 0x200 we can ignore it and treat the rest of the
registers in the standard SMCCC way.

To eliminate the need for other platforms to load this r12 sentinel
value on every SMC call we add a TI specific SMC function that
can be selected by users at run-time on TI platforms.

Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
---
 arch/arm/kernel/armksyms.c   |  1 +
 arch/arm/kernel/smccc-call.S | 25 +++++++++++++++++++++++++
 include/linux/arm-smccc.h    | 16 ++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/arch/arm/kernel/armksyms.c b/arch/arm/kernel/armksyms.c
index 5266fd9ad6b4..6216c4678137 100644
--- a/arch/arm/kernel/armksyms.c
+++ b/arch/arm/kernel/armksyms.c
@@ -182,4 +182,5 @@ EXPORT_SYMBOL(__pv_offset);
 #ifdef CONFIG_HAVE_ARM_SMCCC
 EXPORT_SYMBOL(__arm_smccc_smc);
 EXPORT_SYMBOL(__arm_smccc_hvc);
+EXPORT_SYMBOL(arm_ti_smccc_smc);
 #endif
diff --git a/arch/arm/kernel/smccc-call.S b/arch/arm/kernel/smccc-call.S
index e5d43066b889..7a30c253f284 100644
--- a/arch/arm/kernel/smccc-call.S
+++ b/arch/arm/kernel/smccc-call.S
@@ -43,6 +43,21 @@ UNWIND(	.save	{r4-r7})
 UNWIND(	.fnend)
 	.endm
 
+	.macro TI_SMCCC instr
+UNWIND(	.fnstart)
+	mov	r12, sp
+	push	{r4-r11}
+UNWIND(	.save	{r4-r11})
+	ldm	r12, {r4-r7}
+	mov	r12, #0x200
+	\instr
+	pop	{r4-r11}
+	ldr	r12, [sp, #(4 * 4)]
+	stm	r12, {r0-r3}
+	bx	lr
+UNWIND(	.fnend)
+	.endm
+
 /*
  * void smccc_smc(unsigned long a0, unsigned long a1, unsigned long a2,
  *		  unsigned long a3, unsigned long a4, unsigned long a5,
@@ -62,3 +77,13 @@ ENDPROC(__arm_smccc_smc)
 ENTRY(__arm_smccc_hvc)
 	SMCCC SMCCC_HVC
 ENDPROC(__arm_smccc_hvc)
+
+/*
+ * void ti_smccc_smc(unsigned long a0, unsigned long a1, unsigned long a2,
+ *		     unsigned long a3, unsigned long a4, unsigned long a5,
+ *		     unsigned long a6, unsigned long a7,
+ *		     struct arm_smccc_res *res)
+ */
+ENTRY(arm_ti_smccc_smc)
+	TI_SMCCC SMCCC_SMC
+ENDPROC(arm_ti_smccc_smc)
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 4c5bca38c653..5254c03b784a 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -130,5 +130,21 @@ asmlinkage void __arm_smccc_hvc(unsigned long a0, unsigned long a1,
 
 #define arm_smccc_hvc_quirk(...) __arm_smccc_hvc(__VA_ARGS__)
 
+/**
+ * arm_ti_smccc_smc() - make TI SMC calls
+ * @a0-a7: arguments passed in registers 0 to 7
+ * @res: result values from registers 0 to 3
+ *
+ * This function is used to make TI style SMC calls following a TI proprietary
+ * SMC Call. The content of the supplied params are copied to registers 0 to 7
+ * and register 12 is set to a sentinel value prior to the SMC instruction.
+ * The return values are updated with the content from register 0 to 3 on
+ * return from the SMC instruction.
+ */
+asmlinkage void arm_ti_smccc_smc(unsigned long a0, unsigned long a1,
+			unsigned long a2, unsigned long a3, unsigned long a4,
+			unsigned long a5, unsigned long a6, unsigned long a7,
+			struct arm_smccc_res *res);
+
 #endif /*__ASSEMBLY__*/
 #endif /*__LINUX_ARM_SMCCC_H*/
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
