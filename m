From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2] drm/exynos: Get HDMI version from device tree
Date: Tue,  8 Jan 2013 15:16:21 -0500
Message-ID: <1357676181-16728-1-git-send-email-seanpaul@chromium.org>
References: <50EC5EDE.3030208@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50EC5EDE.3030208-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a property to the hdmi node so we can specify the HDMI version in
the device tree instead of just defaulting to v1.4 with the existence of
the dt node.

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 .../devicetree/bindings/drm/exynos/hdmi.txt        |    2 +
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   22 ++++++++++----------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/drm/exynos/hdmi.txt b/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
index 589edee..228ede6 100644
--- a/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
+++ b/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
@@ -11,6 +11,7 @@ Required properties:
 	c) pin function mode.
 	d) optional flags and pull up/down.
 	e) drive strength.
+- hdmi-version: (major << 8) | minor
 
 Example:
 
@@ -19,4 +20,5 @@ Example:
 		reg = <0x14530000 0x100000>;
 		interrupts = <0 95 0>;
 		hpd-gpio = <&gpx3 7 0xf 1 3>;
+		hdmi-version = <0x104>; /* version 1.4 */
 	};
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 2c46b6c..71736f9 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -74,8 +74,8 @@ enum HDMI_PACKET_TYPE {
 };
 
 enum hdmi_type {
-	HDMI_TYPE13,
-	HDMI_TYPE14,
+	HDMI_TYPE13 = (1 << 8) | 3,
+	HDMI_TYPE14 = (1 << 8) | 4,
 };
 
 struct hdmi_resources {
@@ -2444,7 +2444,6 @@ static struct platform_device_id hdmi_driver_types[] = {
 static struct of_device_id hdmi_match_types[] = {
 	{
 		.compatible = "samsung,exynos5-hdmi",
-		.data	= (void	*)HDMI_TYPE14,
 	}, {
 		/* end node */
 	}
@@ -2459,6 +2458,7 @@ static int __devinit hdmi_probe(struct platform_device *pdev)
 	struct s5p_hdmi_platform_data *pdata;
 	struct resource *res;
 	int ret;
+	u32 ver;
 
 	DRM_DEBUG_KMS("[%d]\n", __LINE__);
 
@@ -2498,16 +2498,16 @@ static int __devinit hdmi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, drm_hdmi_ctx);
 
-	if (dev->of_node) {
-		const struct of_device_id *match;
-		match = of_match_node(of_match_ptr(hdmi_match_types),
-					pdev->dev.of_node);
-		if (match == NULL)
-			return -ENODEV;
-		hdata->type = (enum hdmi_type)match->data;
-	} else {
+	if (!dev->of_node) {
 		hdata->type = (enum hdmi_type)platform_get_device_id
 					(pdev)->driver_data;
+	} else {
+		ret = of_property_read_u32(dev->of_node, "hdmi-version", &ver);
+		if (ret) {
+			DRM_ERROR("Could not resolve HDMI version support\n");
+			return ret;
+		}
+		hdata->type = (enum hdmi_type)ver;
 	}
 
 	hdata->hpd_gpio = pdata->hpd_gpio;
-- 
1.7.7.3
