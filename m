From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 3/9] drm/exynos: add support for exynos5420 hdmi
Date: Tue, 11 Jun 2013 19:41:25 +0530
Message-ID: <1370959891-8923-4-git-send-email-rahul.sharma@samsung.com>
References: <1370959891-8923-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1370959891-8923-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: devicetree@vger.kernel.org

Add support for exynos5420 hdmi IP.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index a7f7ab3..0c94e54 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -76,6 +76,7 @@ enum HDMI_PACKET_TYPE {
 enum hdmi_version {
 	HDMI_VER_EXYNOS4210,
 	HDMI_VER_EXYNOS4212,
+	HDMI_VER_EXYNOS5420,
 };
 
 struct hdmi_resources {
@@ -1984,6 +1985,9 @@ static struct of_device_id hdmi_match_types[] = {
 		.compatible = "samsung,exynos4212-hdmi",
 		.data	= (void	*)HDMI_VER_EXYNOS4212,
 	}, {
+		.compatible = "samsung,exynos5420-hdmi",
+		.data	= (void	*)HDMI_VER_EXYNOS5420,
+	}, {
 		/* end node */
 	}
 };
-- 
1.7.10.4
