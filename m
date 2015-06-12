From: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 01/15] drm/exynos: remove the dependency of DP driver for
 ARCH_EXYNOS
Date: Fri, 12 Jun 2015 21:58:56 +0900
Message-ID: <1434113958-15877-2-git-send-email-human.hwang@samsung.com>
References: <1434113958-15877-1-git-send-email-human.hwang@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1434113958-15877-1-git-send-email-human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This dependency is a historical thing. It is added when this DP driver is
under media subsystem. Now because it is under Exynos DRM, this dependency
is not needed anymore.

Signed-off-by: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
Changes for v6:
- New
 drivers/gpu/drm/exynos/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 8203283..926ed36 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -50,7 +50,7 @@ config DRM_EXYNOS_DSI

 config DRM_EXYNOS_DP
 	bool "EXYNOS DRM DP driver support"
-	depends on (DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON) && ARCH_EXYNOS && (DRM_PTN3460=n || DRM_PTN3460=y || DRM_PTN3460=DRM_EXYNOS)
+	depends on (DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON) && (DRM_PTN3460=n || DRM_PTN3460=y || DRM_PTN3460=DRM_EXYNOS)
 	default DRM_EXYNOS
 	select DRM_PANEL
 	help
--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
