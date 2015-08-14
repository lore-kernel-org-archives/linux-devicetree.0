From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v4 1/4] edac: Export edac_debugfs
Date: Fri, 14 Aug 2015 00:46:06 -0600
Message-ID: <1439534769-22811-2-git-send-email-lho@apm.com>
References: <1439534769-22811-1-git-send-email-lho@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439534769-22811-1-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch exports and expose the edac_debugfs file node. This allows
EDAC driver to create debugfs node under the EDAC debugfs node.

Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---
 drivers/edac/edac_core.h     |    1 +
 drivers/edac/edac_mc_sysfs.c |    5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/edac_core.h b/drivers/edac/edac_core.h
index ad42587..a978a4f 100644
--- a/drivers/edac/edac_core.h
+++ b/drivers/edac/edac_core.h
@@ -511,5 +511,6 @@ extern void edac_pci_remove_sysfs(struct edac_pci_ctl_info *pci);
  * edac misc APIs
  */
 extern char *edac_op_state_to_string(int op_state);
+extern struct dentry *edac_debugfs;
 
 #endif				/* _EDAC_CORE_H_ */
diff --git a/drivers/edac/edac_mc_sysfs.c b/drivers/edac/edac_mc_sysfs.c
index 33df7d9..236e76c 100644
--- a/drivers/edac/edac_mc_sysfs.c
+++ b/drivers/edac/edac_mc_sysfs.c
@@ -896,9 +896,10 @@ static struct device_type mci_attr_type = {
 	.release	= mci_attr_release,
 };
 
-#ifdef CONFIG_EDAC_DEBUG
-static struct dentry *edac_debugfs;
+struct dentry *edac_debugfs;
+EXPORT_SYMBOL_GPL(edac_debugfs);
 
+#ifdef CONFIG_EDAC_DEBUG
 int __init edac_debugfs_init(void)
 {
 	edac_debugfs = debugfs_create_dir("edac", NULL);
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
