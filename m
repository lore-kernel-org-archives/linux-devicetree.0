From: Rahul Tanwar <rahul.tanwar@linux.intel.com>
Subject: [PATCH v1 1/2] x86/rtc: Add option to skip using RTC
Date: Thu, 22 Aug 2019 15:44:03 +0800
Message-ID: <becacc523508b295a52db9f1592e2868e3988e28.1566458029.git.rahul.tanwar@linux.intel.com>
References: <cover.1566456205.git.rahul.tanwar@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1566456205.git.rahul.tanwar@linux.intel.com>
In-Reply-To: <cover.1566458029.git.rahul.tanwar@linux.intel.com>
References: <cover.1566458029.git.rahul.tanwar@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, tony.luck@intel.com, x86@kernel.org, a.zummo@towertech.it, alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, andriy.shevchenko@intel.com, alan@linux.intel.com, linux-kernel@vger.kernel.org, qi-ming.wu@intel.com, cheol.yong.kim@intel.com, rahul.tanwar@intel.com, Rahul Tanwar <rahul.tanwar@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Use a newly introduced optional "status" property of "motorola,mc146818"
compatible DT node to determine if RTC is supported. Skip read/write from
RTC device only when this node is present and status is "disabled". In all
other cases, proceed as before.

Suggested-by: Alan Cox <alan@linux.intel.com>
Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>
---
 arch/x86/kernel/rtc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/x86/kernel/rtc.c b/arch/x86/kernel/rtc.c
index 586f718b8e95..f9f760a8e76a 100644
--- a/arch/x86/kernel/rtc.c
+++ b/arch/x86/kernel/rtc.c
@@ -32,6 +32,11 @@ EXPORT_SYMBOL(cmos_lock);
 DEFINE_SPINLOCK(rtc_lock);
 EXPORT_SYMBOL(rtc_lock);
 
+static const struct of_device_id of_cmos_match[] = {
+        { .compatible = "motorola,mc146818" },
+        {}
+};
+
 /*
  * In order to set the CMOS clock precisely, set_rtc_mmss has to be
  * called 500 ms after the second nowtime has started, because when
@@ -42,9 +47,14 @@ EXPORT_SYMBOL(rtc_lock);
 int mach_set_rtc_mmss(const struct timespec64 *now)
 {
 	unsigned long long nowtime = now->tv_sec;
+	struct device_node *node;
 	struct rtc_time tm;
 	int retval = 0;
 
+	node = of_find_matching_node(NULL, of_cmos_match);
+	if (node && !of_device_is_available(node))
+		return -EINVAL;
+
 	rtc_time64_to_tm(nowtime, &tm);
 	if (!rtc_valid_tm(&tm)) {
 		retval = mc146818_set_time(&tm);
@@ -63,8 +73,15 @@ int mach_set_rtc_mmss(const struct timespec64 *now)
 void mach_get_cmos_time(struct timespec64 *now)
 {
 	unsigned int status, year, mon, day, hour, min, sec, century = 0;
+	struct device_node *node;
 	unsigned long flags;
 
+	node = of_find_matching_node(NULL, of_cmos_match);
+	if (node && !of_device_is_available(node)) {
+		now->tv_sec = now->tv_nsec = 0;
+		return;
+	}
+
 	/*
 	 * If pm_trace abused the RTC as storage, set the timespec to 0,
 	 * which tells the caller that this RTC value is unusable.
-- 
2.11.0
