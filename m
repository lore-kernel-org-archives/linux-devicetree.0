From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v3 21/24] drm: of: Export drm_crtc_port_mask()
Date: Mon, 25 Jun 2018 14:03:01 +0200
Message-ID: <20180625120304.7543-22-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBF5VYPMQKGQE5HCFQYI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180625120304.7543-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Function is useful when drm_of_find_possible_crtcs() can't be used and
custom parsing is needed. This can happen for example when there is a
node with multiple muxes between crtc and encoder.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/drm_of.c | 5 +++--
 include/drm/drm_of.h     | 8 ++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 1fe122461298..50e738857258 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -22,8 +22,8 @@ static void drm_release_of(struct device *dev, void *data)
  * Given a port OF node, return the possible mask of the corresponding
  * CRTC within a device's list of CRTCs.  Returns zero if not found.
  */
-static uint32_t drm_crtc_port_mask(struct drm_device *dev,
-				   struct device_node *port)
+uint32_t drm_crtc_port_mask(struct drm_device *dev,
+			    struct device_node *port)
 {
 	unsigned int index = 0;
 	struct drm_crtc *tmp;
@@ -37,6 +37,7 @@ static uint32_t drm_crtc_port_mask(struct drm_device *dev,
 
 	return 0;
 }
+EXPORT_SYMBOL(drm_crtc_port_mask);
 
 /**
  * drm_of_find_possible_crtcs - find the possible CRTCs for an encoder port
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index b93c239afb60..a61fd77e46ba 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -17,6 +17,8 @@ struct drm_bridge;
 struct device_node;
 
 #ifdef CONFIG_OF
+uint32_t drm_crtc_port_mask(struct drm_device *dev,
+			    struct device_node *port);
 uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 				    struct device_node *port);
 void drm_of_component_match_add(struct device *master,
@@ -34,6 +36,12 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				struct drm_panel **panel,
 				struct drm_bridge **bridge);
 #else
+static inline uint32_t drm_crtc_port_mask(struct drm_device *dev,
+					  struct device_node *port)
+{
+	return 0;
+}
+
 static inline uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 						  struct device_node *port)
 {
-- 
2.18.0
