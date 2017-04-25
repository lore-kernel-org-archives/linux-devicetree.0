From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 0/3] drm/sun4i: More cleanups and fixes
Date: Tue, 25 Apr 2017 23:25:02 +0800
Message-ID: <20170425152505.6796-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBVOU7XDQKGQENOKAJMQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

The subject is probably getting old. Here are a few more cleanups.

Patch 1 should have been part of the patch

    drm/sun4i: Use lists to track registered display backends and TCONs

from my multiple pipeline support series. Please squash it in if you can.

Patch 2 just moves setting the TCON clocks back inside the TCON driver.

Patch 3 cleans up a DRM driver debug message.

Regards
ChenYu


Chen-Yu Tsai (3):
  drm/sun4i: Drop unused tcon pointer
  drm/sun4i: Set TCON clock inside sun4i_tconX_mode_set
  drm/sun4i: backend: Clarify sun4i_backend_layer_enable debug message

 drivers/gpu/drm/sun4i/sun4i_backend.c | 3 ++-
 drivers/gpu/drm/sun4i/sun4i_drv.h     | 1 -
 drivers/gpu/drm/sun4i/sun4i_rgb.c     | 2 --
 drivers/gpu/drm/sun4i/sun4i_tcon.c    | 6 ++++++
 drivers/gpu/drm/sun4i/sun4i_tv.c      | 2 --
 5 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.11.0
