From: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH RFC 7/8] PM / devfreq: Rename the exynos5250 devfreq driver
Date: Sun, 27 Apr 2014 02:08:47 +0530
Message-ID: <1398544728-2075-8-git-send-email-a.kesavan@samsung.com>
References: <1398544728-2075-1-git-send-email-a.kesavan@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398544728-2075-1-git-send-email-a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-pm-u79uwXL29TaqPxH82wqD4g@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

In anticipation of the new 5420 devfreq driver which is significantly
different in structure as compared to the 5250 one let us modify the
exynos5250 driver name.

Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/devfreq/Kconfig                                    | 2 +-
 drivers/devfreq/Makefile                                   | 2 +-
 drivers/devfreq/exynos/Makefile                            | 5 +++--
 drivers/devfreq/exynos/{exynos5_bus.c => exynos5250_bus.c} | 0
 4 files changed, 5 insertions(+), 4 deletions(-)
 rename drivers/devfreq/exynos/{exynos5_bus.c => exynos5250_bus.c} (100%)

diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index c023c57..40da99f 100644
--- a/drivers/devfreq/Kconfig
+++ b/drivers/devfreq/Kconfig
@@ -79,7 +79,7 @@ config ARM_EXYNOS4_BUS_DEVFREQ
 	  To operate with optimal voltages, ASV support is required
 	  (CONFIG_EXYNOS_ASV).
 
-config ARM_EXYNOS5_BUS_DEVFREQ
+config ARM_EXYNOS5250_BUS_DEVFREQ
 	bool "ARM Exynos5250 Bus DEVFREQ Driver"
 	depends on SOC_EXYNOS5250
 	select ARCH_HAS_OPP
diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
index 16138c9..e33ade0 100644
--- a/drivers/devfreq/Makefile
+++ b/drivers/devfreq/Makefile
@@ -6,4 +6,4 @@ obj-$(CONFIG_DEVFREQ_GOV_USERSPACE)	+= governor_userspace.o
 
 # DEVFREQ Drivers
 obj-$(CONFIG_ARM_EXYNOS4_BUS_DEVFREQ)	+= exynos/
-obj-$(CONFIG_ARM_EXYNOS5_BUS_DEVFREQ)	+= exynos/
+obj-$(CONFIG_ARM_EXYNOS5250_BUS_DEVFREQ)+= exynos/
diff --git a/drivers/devfreq/exynos/Makefile b/drivers/devfreq/exynos/Makefile
index 49bc917..f4ab613 100644
--- a/drivers/devfreq/exynos/Makefile
+++ b/drivers/devfreq/exynos/Makefile
@@ -1,3 +1,4 @@
 # Exynos DEVFREQ Drivers
-obj-$(CONFIG_ARM_EXYNOS4_BUS_DEVFREQ)	+= exynos_ppmu.o exynos4_bus.o
-obj-$(CONFIG_ARM_EXYNOS5_BUS_DEVFREQ)	+= exynos_ppmu.o exynos5_bus.o
+obj-y		:= exynos_ppmu.o
+obj-$(CONFIG_ARM_EXYNOS4_BUS_DEVFREQ)		+= exynos4_bus.o
+obj-$(CONFIG_ARM_EXYNOS5250_BUS_DEVFREQ)	+= exynos5250_bus.o
diff --git a/drivers/devfreq/exynos/exynos5_bus.c b/drivers/devfreq/exynos/exynos5250_bus.c
similarity index 100%
rename from drivers/devfreq/exynos/exynos5_bus.c
rename to drivers/devfreq/exynos/exynos5250_bus.c
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
