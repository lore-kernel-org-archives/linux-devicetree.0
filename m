From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [RFC 01/12] ARM: tegra: Register drivers before devices
Date: Fri, 24 Apr 2015 16:47:17 +0200
Message-ID: <1429886848-5843-2-git-send-email-tomeu.vizoso@collabora.com>
References: <1429886848-5843-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429886848-5843-1-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

So devices can be probed on demand, we need to have the drivers already
registered as we don't have enough information to register a driver on
demand.
---
 arch/arm/mach-tegra/tegra.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
index 2378fa56..5fe5bd4 100644
--- a/arch/arm/mach-tegra/tegra.c
+++ b/arch/arm/mach-tegra/tegra.c
@@ -55,6 +55,8 @@
 #include "reset.h"
 #include "sleep.h"
 
+struct soc_device *soc_dev;
+
 /*
  * Storage for debug-macro.S's state.
  *
@@ -87,12 +89,10 @@ static void __init tegra_dt_init_irq(void)
 static void __init tegra_dt_init(void)
 {
 	struct soc_device_attribute *soc_dev_attr;
-	struct soc_device *soc_dev;
-	struct device *parent = NULL;
 
 	soc_dev_attr = kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
 	if (!soc_dev_attr)
-		goto out;
+		return;
 
 	soc_dev_attr->family = kasprintf(GFP_KERNEL, "Tegra");
 	soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%d",
@@ -105,17 +105,7 @@ static void __init tegra_dt_init(void)
 		kfree(soc_dev_attr->revision);
 		kfree(soc_dev_attr->soc_id);
 		kfree(soc_dev_attr);
-		goto out;
 	}
-
-	parent = soc_device_to_device(soc_dev);
-
-	/*
-	 * Finished with the static registrations now; fill in the missing
-	 * devices
-	 */
-out:
-	of_platform_populate(NULL, of_default_bus_match_table, NULL, parent);
 }
 
 static void __init paz00_init(void)
@@ -133,8 +123,13 @@ static struct {
 
 static void __init tegra_dt_init_late(void)
 {
+	struct device *parent = NULL;
 	int i;
 
+	parent = soc_device_to_device(soc_dev);
+
+	of_platform_populate(NULL, of_default_bus_match_table, NULL, parent);
+
 	tegra_init_suspend();
 	tegra_cpuidle_init();
 
-- 
2.3.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
