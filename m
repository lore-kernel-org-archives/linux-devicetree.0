From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v7 07/13] drm/sun4i: add a Kconfig option for sun4i-backend
Date: Mon, 15 May 2017 00:30:39 +0800
Message-ID: <20170514163045.40366-8-icenowy@aosc.io>
References: <20170514163045.40366-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBFMN4LEAKGQEKMVLZOI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170514163045.40366-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As sun4i-backend is now a dedicated module, add an Kconfig option for
it to make it optional, since some build may only use other engines.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
Changes in v7:
- Adjusted the position of BACKEND makefile item. (It's now after
  common codes shared between sun4i-backend and sun8i-mixer.)

 drivers/gpu/drm/sun4i/Kconfig  | 10 ++++++++++
 drivers/gpu/drm/sun4i/Makefile |  3 ++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
index a4b357db8856..5a8227f37cc4 100644
--- a/drivers/gpu/drm/sun4i/Kconfig
+++ b/drivers/gpu/drm/sun4i/Kconfig
@@ -12,3 +12,13 @@ config DRM_SUN4I
 	  Choose this option if you have an Allwinner SoC with a
 	  Display Engine. If M is selected the module will be called
 	  sun4i-drm.
+
+config DRM_SUN4I_BACKEND
+	tristate "Support for Allwinner A10 Display Engine Backend"
+	depends on DRM_SUN4I
+	default DRM_SUN4I
+	help
+	  Choose this option if you have an Allwinner SoC with the
+	  original Allwinner Display Engine, which has a backend to
+	  do some alpha blending and feed graphics to TCON. If M is
+	  selected the module will be called sun4i-backend.
diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
index a251fb36c951..da561d064ab8 100644
--- a/drivers/gpu/drm/sun4i/Makefile
+++ b/drivers/gpu/drm/sun4i/Makefile
@@ -9,6 +9,7 @@ sun4i-tcon-y += sun4i_crtc.o
 sun4i-backend-y += sun4i_backend.o sun4i_layer.o
 
 obj-$(CONFIG_DRM_SUN4I)		+= sun4i-drm.o sun4i-tcon.o
-obj-$(CONFIG_DRM_SUN4I)		+= sun4i-backend.o
 obj-$(CONFIG_DRM_SUN4I)		+= sun6i_drc.o
 obj-$(CONFIG_DRM_SUN4I)		+= sun4i_tv.o
+
+obj-$(CONFIG_DRM_SUN4I_BACKEND)		+= sun4i-backend.o
-- 
2.12.2
