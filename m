From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] of/device: Make of_device_make_bus_id() usable by other code.
Date: Sat, 24 Jul 2010 10:01:11 -0600
Message-ID: <20100724160111.7072.68144.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The AMBA bus should also use of_device_make_bus_id() when populating device
out of device tree data.  This patch makes the function non-static, and
adds a suitable prototype in of_device.h

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 drivers/of/platform.c     |    2 +-
 include/linux/of_device.h |    3 +++
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 94fa719..600d77f 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -508,7 +508,7 @@ EXPORT_SYMBOL(of_unregister_driver);
  * value to derive a unique name.  As a last resort it will use the node
  * name followed by a unique number.
  */
-static void of_device_make_bus_id(struct device *dev)
+void of_device_make_bus_id(struct device *dev)
 {
 	static atomic_t bus_no_reg_magic;
 	struct device_node *node = dev->of_node;
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index e11a0be..249bc11 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -27,6 +27,9 @@
 
 extern const struct of_device_id *of_match_device(
 	const struct of_device_id *matches, const struct device *dev);
+#if !defined(CONFIG_SPARC)
+extern void of_device_make_bus_id(struct device *dev);
+#endif
 
 /**
  * of_driver_match_device - Tell if a driver's of_match_table matches a device.
