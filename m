From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 3/3] of: protect contents of of_platform.h and of_device.h
Date: Thu, 11 Mar 2010 10:32:09 -0700
Message-ID: <20100311173209.4423.22665.stgit@angua>
References: <20100311173024.4423.53178.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100311173024.4423.53178.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Only process contents of of_platform.h and of_device.h if
CONFIG_OF_DEVICE is set.
---

 include/linux/of_device.h   |    2 ++
 include/linux/of_platform.h |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index d3a74e0..e7904a9 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -1,6 +1,7 @@
 #ifndef _LINUX_OF_DEVICE_H
 #define _LINUX_OF_DEVICE_H
 
+#ifdef CONFIG_OF_DEVICE
 #include <linux/device.h>
 #include <linux/of.h>
 #include <linux/mod_devicetable.h>
@@ -26,5 +27,6 @@ static inline void of_device_free(struct of_device *dev)
 
 extern ssize_t of_device_get_modalias(struct of_device *ofdev,
 					char *str, ssize_t len);
+#endif /* CONFIG_OF_DEVICE */
 
 #endif /* _LINUX_OF_DEVICE_H */
diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index 9084066..ac3ae07 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -11,6 +11,7 @@
  *
  */
 
+#ifdef CONFIG_OF_DEVICE
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
@@ -66,5 +67,6 @@ static inline void of_unregister_platform_driver(struct of_platform_driver *drv)
 extern struct of_device *of_find_device_by_node(struct device_node *np);
 
 extern int of_bus_type_init(struct bus_type *bus, const char *name);
+#endif /* CONFIG_OF_DEVICE */
 
 #endif	/* _LINUX_OF_PLATFORM_H */
