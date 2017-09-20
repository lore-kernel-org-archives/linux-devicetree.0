From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [RESEND RFC PATCH 2/7] drm: bridge: Enable workaround
 in dw_hdmi for v1.32a
Date: Wed, 20 Sep 2017 22:01:19 +0200
Message-ID: <20170920200124.20457-3-jernej.skrabec@siol.net>
References: <20170920200124.20457-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBJESRPHAKGQEYIQEJ2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170920200124.20457-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Allwinner SoCs have dw hdmi controller v1.32a which exhibits same
magenta line issue as i.MX6Q and i.MX6DL. Enable workaround for it.

Allwinner never released any kind of dw hdmi or errata documentation,
so it is not clear how many iterations need to be executed. One
iteration seems to be enough.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 09cb5a3e4c71..72969240a9d4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1631,9 +1631,10 @@ static void dw_hdmi_clear_overflow(struct dw_hdmi *hdmi)
 	 * then write one of the FC registers several times.
 	 *
 	 * The number of iterations matters and depends on the HDMI TX revision
-	 * (and possibly on the platform). So far only i.MX6Q (v1.30a) and
-	 * i.MX6DL (v1.31a) have been identified as needing the workaround, with
-	 * 4 and 1 iterations respectively.
+	 * (and possibly on the platform). So far i.MX6Q (v1.30a), i.MX6DL
+	 * (v1.31a) and multiple Allwinner SoCs (v1.32a) have been identified
+	 * as needing the workaround, with 4 iterations for v1.30a and 1
+	 * iteration for others.
 	 */
 
 	switch (hdmi->version) {
@@ -1641,6 +1642,7 @@ static void dw_hdmi_clear_overflow(struct dw_hdmi *hdmi)
 		count = 4;
 		break;
 	case 0x131a:
+	case 0x132a:
 		count = 1;
 		break;
 	default:
-- 
2.14.1
