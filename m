From: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 3/3] arm: exynos: Add /dev/bL_status user interface on
 Exynos5420
Date: Tue, 22 Apr 2014 11:47:37 +0530
Message-ID: <1398147457-3186-1-git-send-email-a.kesavan@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Dave.Martin-5wv7dgnIgG8@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a user interface to check the core and cluster status on
Exynos5420. This can be utilized while debugging mcpm issues.
cat /dev/bL_status will show the current power status of all
the 8 cores along with the cluster.

Signed-off-by: Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Inderpal Singh <inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-exynos/mcpm-exynos.c |   64 ++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm/mach-exynos/mcpm-exynos.c b/arch/arm/mach-exynos/mcpm-exynos.c
index 49b9031..6c74c82 100644
--- a/arch/arm/mach-exynos/mcpm-exynos.c
+++ b/arch/arm/mach-exynos/mcpm-exynos.c
@@ -293,6 +293,53 @@ static void __init exynos_mcpm_usage_count_init(void)
 	cpu_use_count[cpu][cluster] = 1;
 }
 
+static size_t bL_check_status(char *info)
+{
+	size_t len = 0;
+	int i;
+
+	len += sprintf(&info[len], "\t0 1 2 3 L2\n");
+	len += sprintf(&info[len], "[A15]   ");
+	for (i = 0; i < 4; i++) {
+		len += sprintf(&info[len], "%d ",
+			(readl(EXYNOS_ARM_CORE_STATUS(i)) & 0x3) == 3 ? 1 : 0);
+	}
+	len += sprintf(&info[len], "%d\n",
+			(readl(EXYNOS_COMMON_STATUS(0)) & 0x3) == 3 ? 1 : 0);
+
+	len += sprintf(&info[len], "[A7]    ");
+	for (i = 4; i < 8; i++)
+		len += sprintf(&info[len], "%d ",
+			(readl(EXYNOS_ARM_CORE_STATUS(i)) & 0x3) == 3 ? 1 : 0);
+	len += sprintf(&info[len], "%d\n\n",
+			(readl(EXYNOS_COMMON_STATUS(1)) & 0x3) == 3 ? 1 : 0);
+
+	return len;
+}
+
+static ssize_t bL_status_read(struct file *file, char __user *buf,
+			size_t len, loff_t *pos)
+{
+	size_t count = 0;
+	char info[100];
+
+	count = bL_check_status(info);
+	if (count < 0)
+		return -EINVAL;
+
+	return simple_read_from_buffer(buf, len, pos, info, count);
+}
+
+static const struct file_operations bL_status_fops = {
+	.read		= bL_status_read,
+};
+
+static struct miscdevice bL_status_device = {
+	MISC_DYNAMIC_MINOR,
+	"bL_status",
+	&bL_status_fops
+};
+
 /*
  * Enable cluster-level coherency, in preparation for turning on the MMU.
  */
@@ -343,3 +390,20 @@ static int __init exynos_mcpm_init(void)
 }
 
 early_initcall(exynos_mcpm_init);
+
+static int __init exynos_bl_status_init(void)
+{
+	int ret;
+
+	if (!soc_is_exynos5420())
+		return -ENODEV;
+
+	ret = misc_register(&bL_status_device);
+	if (ret) {
+		pr_info("bl_status not available\n");
+		return ret;
+	}
+	return 0;
+}
+
+late_initcall(exynos_bl_status_init);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
