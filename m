From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v3 1/4] edac: Add an function to retrieve the EDAC debugfs node
Date: Tue, 11 Aug 2015 14:47:54 -0600
Message-ID: <1439326077-25507-2-git-send-email-lho@apm.com>
References: <1439326077-25507-1-git-send-email-lho@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439326077-25507-1-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds an function to retrieve the EDAC debugfs node. This allows
EDAC driver to create debugfs node under the EDAC debugfs node.

Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---
 drivers/edac/edac_core.h     |    1 +
 drivers/edac/edac_mc_sysfs.c |   10 ++++++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/edac/edac_core.h b/drivers/edac/edac_core.h
index ad42587..6771e64 100644
--- a/drivers/edac/edac_core.h
+++ b/drivers/edac/edac_core.h
@@ -511,5 +511,6 @@ extern void edac_pci_remove_sysfs(struct edac_pci_ctl_info *pci);
  * edac misc APIs
  */
 extern char *edac_op_state_to_string(int op_state);
+extern struct dentry *edac_get_debugfs(void);
 
 #endif				/* _EDAC_CORE_H_ */
diff --git a/drivers/edac/edac_mc_sysfs.c b/drivers/edac/edac_mc_sysfs.c
index 33df7d9..b76afe0 100644
--- a/drivers/edac/edac_mc_sysfs.c
+++ b/drivers/edac/edac_mc_sysfs.c
@@ -959,6 +959,16 @@ nomem:
 	debugfs_remove(mci->debugfs);
 	return -ENOMEM;
 }
+
+struct dentry *edac_get_debugfs(void)
+{
+	return edac_debugfs;
+}
+#else
+struct dentry *edac_get_debugfs(void)
+{
+	return NULL;
+}
 #endif
 
 /*
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
