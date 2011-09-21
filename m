From: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/3] mfd: allow mfd_cell association with device tree node
Date: Wed, 21 Sep 2011 13:01:48 +0100 (BST)
Message-ID: <20110921120148.4A81E9D401D@zog.reactivated.net>
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
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

This allows a mfd_cell to be linked with a device tree node, which
then allows child drivers to have easy access to that handle.

Signed-off-by: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
---
 drivers/mfd/mfd-core.c   |    1 +
 include/linux/mfd/core.h |    4 ++++
 2 files changed, 5 insertions(+), 0 deletions(-)

I think this is what is being suggested at 
http://lists.ozlabs.org/pipermail/devicetree-discuss/2011-September/008235.html

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 0902523..7d22dcd 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -87,6 +87,7 @@ static int mfd_add_device(struct device *parent, int id,
 		goto fail_device;
 
 	pdev->dev.parent = parent;
+	pdev->dev.of_node = cell->of_node;
 
 	if (cell->pdata_size) {
 		ret = platform_device_add_data(pdev,
diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
index 4e76163..9b836f9 100644
--- a/include/linux/mfd/core.h
+++ b/include/linux/mfd/core.h
@@ -15,6 +15,7 @@
 #define MFD_CORE_H
 
 #include <linux/platform_device.h>
+#include <linux/of.h>
 
 /*
  * This struct describes the MFD part ("cell").
@@ -37,6 +38,9 @@ struct mfd_cell {
 	void			*platform_data;
 	size_t			pdata_size;
 
+	/* association with device tree node (optional) */
+	struct device_node	*of_node;
+
 	/*
 	 * These resources can be specified relative to the parent device.
 	 * For accessing hardware you should use resources from the platform dev
-- 
1.7.6.2
