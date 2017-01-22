From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: [PATCH 3/9] drm/simple-helpers: Add missing includes
Date: Sun, 22 Jan 2017 19:11:11 +0100
Message-ID: <20170122181117.8210-4-noralf@tronnes.org>
References: <20170122181117.8210-1-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170122181117.8210-1-noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add missing includes to pull in definitions for drm_crtc,
drm_plane and drm_encoder.

Signed-off-by: Noralf Trønnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
---
 include/drm/drm_simple_kms_helper.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index fe8c4ba..d138d08 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -10,6 +10,10 @@
 #ifndef __LINUX_DRM_SIMPLE_KMS_HELPER_H
 #define __LINUX_DRM_SIMPLE_KMS_HELPER_H
 
+#include <drm/drm_crtc.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_plane.h>
+
 struct drm_simple_display_pipe;
 
 /**
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
