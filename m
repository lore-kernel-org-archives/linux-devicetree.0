From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH 06/14] platform: add function to initialize OF match table
Date: Wed, 18 Aug 2010 19:59:52 +0100
Message-ID: <1282158000-23081-7-git-send-email-lorenzo.pieralisi@arm.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-6-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1282158000-23081-6-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, philippe.robin-5wv7dgnIgG8@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

If the kernel is configured to enable the Open Firmware device tree
infrastructure, the driver member of struct platform_driver has an
additional member, the match table, that has to be initialized in
order for the kernel to be capable of probing drivers at run-time
using the OF methodology.

This patch adds a static inline function that should be used to
initialize the match table member for platform drivers. When OF is
not enabled, the function is empty and it is just optimized out.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
---
 include/linux/platform_device.h |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 5417944..bdfe6f3 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -84,6 +84,17 @@ extern struct platform_device *platform_create_bundle(struct platform_driver *dr
 					struct resource *res, unsigned int n_res,
 					const void *data, size_t size);
 
+#ifndef CONFIG_OF
+static inline void platform_init_match(struct platform_driver *pdriver,
+		const struct of_device_id *ids) { }
+#else
+static inline void platform_init_match(struct platform_driver *pdriver,
+		const struct of_device_id *ids)
+{
+	pdriver->driver.of_match_table = ids;
+}
+#endif
+
 /* early platform driver interface */
 struct early_platform_driver {
 	const char *class_str;
-- 
1.6.3.3
