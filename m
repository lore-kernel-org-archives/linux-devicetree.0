From: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/4] arm64: arch_timer: Introduce a generic erratum handing mechanism for fsl-a008585
Date: Thu, 27 Oct 2016 15:34:09 +0800
Message-ID: <1477553651-13428-2-git-send-email-dingtianhong@huawei.com>
References: <1477553651-13428-1-git-send-email-dingtianhong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477553651-13428-1-git-send-email-dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
Cc: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The workaround for hisilicon,161601 will check the return value of the system counter
by different way, in order to distinguish with the fsl-a008585 workaround, introduce
a new generic erratum handing mechanism for fsl-a008585 and rename some functions. 

v2: Introducing a new generic erratum handling mechanism for fsl erratum a008585.

Signed-off-by: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/include/asm/arch_timer.h  | 20 +++++++++-----
 drivers/clocksource/arm_arch_timer.c | 51 +++++++++++++++++++++---------------
 2 files changed, 43 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/include/asm/arch_timer.h b/arch/arm64/include/asm/arch_timer.h
index eaa5bbe..118719d8 100644
--- a/arch/arm64/include/asm/arch_timer.h
+++ b/arch/arm64/include/asm/arch_timer.h
@@ -31,15 +31,21 @@
 
 #if IS_ENABLED(CONFIG_FSL_ERRATUM_A008585)
 extern struct static_key_false arch_timer_read_ool_enabled;
-#define needs_fsl_a008585_workaround() \
+#define needs_timer_erratum_workaround() \
 	static_branch_unlikely(&arch_timer_read_ool_enabled)
 #else
-#define needs_fsl_a008585_workaround()  false
+#define needs_timer_erratum_workaround()  false
 #endif
 
-u32 __fsl_a008585_read_cntp_tval_el0(void);
-u32 __fsl_a008585_read_cntv_tval_el0(void);
-u64 __fsl_a008585_read_cntvct_el0(void);
+
+struct arch_timer_erratum_workaround {
+	int erratum;
+	u32 (*read_cntp_tval_el0)(void);
+	u32 (*read_cntv_tval_el0)(void);
+	u64 (*read_cntvct_el0)(void);
+};
+
+extern struct arch_timer_erratum_workaround *erratum_workaround;
 
 /*
  * The number of retries is an arbitrary value well beyond the highest number
@@ -62,8 +68,8 @@ u64 __fsl_a008585_read_cntvct_el0(void);
 #define arch_timer_reg_read_stable(reg) 		\
 ({							\
 	u64 _val;					\
-	if (needs_fsl_a008585_workaround())		\
-		_val = __fsl_a008585_read_##reg();	\
+	if (needs_timer_erratum_workaround())		\
+		_val = erratum_workaround->read_##reg();	\
 	else						\
 		_val = read_sysreg(reg);		\
 	_val;						\
diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 73c487d..e4f7fa1 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -95,10 +95,32 @@ early_param("clocksource.arm_arch_timer.evtstrm", early_evtstrm_cfg);
  */
 
 #ifdef CONFIG_FSL_ERRATUM_A008585
+struct arch_timer_erratum_workaround *erratum_workaround = NULL;
+
 DEFINE_STATIC_KEY_FALSE(arch_timer_read_ool_enabled);
 EXPORT_SYMBOL_GPL(arch_timer_read_ool_enabled);
 
-static int fsl_a008585_enable = -1;
+
+static u32 fsl_a008585_read_cntp_tval_el0(void)
+{
+	return __fsl_a008585_read_reg(cntp_tval_el0);
+}
+
+static  u32 fsl_a008585_read_cntv_tval_el0(void)
+{
+	return __fsl_a008585_read_reg(cntv_tval_el0);
+}
+
+static u64 fsl_a008585_read_cntvct_el0(void)
+{
+	return __fsl_a008585_read_reg(cntvct_el0);
+}
+
+static struct arch_timer_erratum_workaround arch_timer_fsl_a008585 = {
+	.read_cntp_tval_el0 = fsl_a008585_read_cntp_tval_el0,
+	.read_cntv_tval_el0 = fsl_a008585_read_cntv_tval_el0,
+	.read_cntvct_el0 = fsl_a008585_read_cntvct_el0,
+};
 
 static int __init early_fsl_a008585_cfg(char *buf)
 {
@@ -109,26 +131,12 @@ static int __init early_fsl_a008585_cfg(char *buf)
 	if (ret)
 		return ret;
 
-	fsl_a008585_enable = val;
+	if (val)
+		erratum_workaround = &arch_timer_fsl_a008585;
+
 	return 0;
 }
 early_param("clocksource.arm_arch_timer.fsl-a008585", early_fsl_a008585_cfg);
-
-u32 __fsl_a008585_read_cntp_tval_el0(void)
-{
-	return __fsl_a008585_read_reg(cntp_tval_el0);
-}
-
-u32 __fsl_a008585_read_cntv_tval_el0(void)
-{
-	return __fsl_a008585_read_reg(cntv_tval_el0);
-}
-
-u64 __fsl_a008585_read_cntvct_el0(void)
-{
-	return __fsl_a008585_read_reg(cntvct_el0);
-}
-EXPORT_SYMBOL(__fsl_a008585_read_cntvct_el0);
 #endif /* CONFIG_FSL_ERRATUM_A008585 */
 
 static __always_inline
@@ -891,9 +899,10 @@ static int __init arch_timer_of_init(struct device_node *np)
 	arch_timer_c3stop = !of_property_read_bool(np, "always-on");
 
 #ifdef CONFIG_FSL_ERRATUM_A008585
-	if (fsl_a008585_enable < 0)
-		fsl_a008585_enable = of_property_read_bool(np, "fsl,erratum-a008585");
-	if (fsl_a008585_enable) {
+	if (!erratum_workaround && of_property_read_bool(np, "fsl,erratum-a008585"))
+		erratum_workaround = &arch_timer_fsl_a008585;
+
+	if (erratum_workaround) {
 		static_branch_enable(&arch_timer_read_ool_enabled);
 		pr_info("Enabling workaround for FSL erratum A-008585\n");
 	}
-- 
1.9.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
