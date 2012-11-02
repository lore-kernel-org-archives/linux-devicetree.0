From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: [RFC PATCH 3.7.0-rc2] dt/platform: insert resources correctly into
 resource tree
Date: Fri,  2 Nov 2012 10:46:19 +0000
Message-ID: <1351853179-27741-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>

This patch add new code to correctly add resources into platform device.
Issue with the existing code was the resources are added as flat entry
without creating any tree, this is very much different to what non-dt
platform code does.

With this patch the resources appear correctly as tree in /proc/iomem,
without this patch the resources in /proc/iomem appear as single entry.

i2c example in /proc/iomem:

With-patch:

fed41000-fed4110f : /soc/i2c-stm@fed41000
  fed41000-fed4110f : i2c

Without patch:
fed41000-fed4110f : i2c

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
---
Hi All, 
Recently I noticed that appearance of /proc/iomem ouput changed 
when I started using device trees and the reason for this was 
the of-plaform code was not adding resources in same way as 
non-dt platform code does.

Do you have any reason for not doing it the same way as non-dt platform code?

This patch is a fixup to that issue.

Comment?
thanks,
srini

 drivers/of/platform.c |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index b80891b..f43922c 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -203,6 +203,7 @@ struct platform_device *of_platform_device_create_pdata(
 					struct device *parent)
 {
 	struct platform_device *dev;
+	int i;
 
 	if (!of_device_is_available(np))
 		return NULL;
@@ -218,6 +219,28 @@ struct platform_device *of_platform_device_create_pdata(
 	dev->dev.bus = &platform_bus_type;
 	dev->dev.platform_data = platform_data;
 
+	for (i = 0; i < dev->num_resources; i++) {
+		struct resource *p, *r = &dev->resource[i];
+
+		if (r->name == NULL)
+			r->name = dev_name(&dev->dev);
+
+		p = r->parent;
+		if (!p) {
+			if (resource_type(r) == IORESOURCE_MEM)
+				p = &iomem_resource;
+			else if (resource_type(r) == IORESOURCE_IO)
+				p = &ioport_resource;
+		}
+
+		if (p && insert_resource(p, r)) {
+			pr_err("%s: failed to claim resource %d\n",
+			       dev_name(&dev->dev), i);
+			platform_device_put(dev);
+			return NULL;
+		}
+	}
+
 	/* We do not fill the DMA ops for platform devices by default.
 	 * This is currently the responsibility of the platform code
 	 * to do such, possibly using a device notifier
-- 
1.7.0.4
