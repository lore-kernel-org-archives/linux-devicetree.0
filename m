From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v2 10/27] dt-bindings: display: sun4i-drm: Add
 R40 TV TCON description
Date: Tue, 12 Jun 2018 22:00:19 +0200
Message-ID: <20180612200036.21483-11-jernej.skrabec@siol.net>
References: <20180612200036.21483-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBRWNQDMQKGQEYIJVIUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180612200036.21483-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

TCON description is expanded with R40 TV TCON compatibles. TV TCONs,
which are connected to TCON TOP muxes, such as those on R40 SoC, also
needs additional clock gate to be specified.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 .../devicetree/bindings/display/sunxi/sun4i-drm.txt          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index ef64c589a4b3..68c4b2995624 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -145,6 +145,7 @@ Required properties:
    * allwinner,sun8i-a33-tcon
    * allwinner,sun8i-a83t-tcon-lcd
    * allwinner,sun8i-a83t-tcon-tv
+   * allwinner,sun8i-r40-tcon-tv
    * allwinner,sun8i-v3s-tcon
    * allwinner,sun9i-a80-tcon-lcd
    * allwinner,sun9i-a80-tcon-tv
@@ -178,8 +179,10 @@ For TCONs with channel 0, there is one more clock required:
    - 'tcon-ch0': The clock driving the TCON channel 0
 For TCONs with channel 1, there is one more clock required:
    - 'tcon-ch1': The clock driving the TCON channel 1
+TV TCONs which are connected to TCON TOP (found in R40 SoC) need one more clock:
+   - 'tcon-top': TV TCON gate found in TCON TOP unit
 
-When TCON support LVDS (all TCONs except TV TCON on A83T and those found
+When TCON support LVDS (all TCONs except TV TCONs on A83T, R40 and those found
 in A13, H3, H5 and V3s SoCs), you need one more reset line:
    - 'lvds': The reset line driving the LVDS logic
 
-- 
2.17.1
