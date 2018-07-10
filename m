From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v2 00/18] Allwinner R40 HDMI refactoring
Date: Tue, 10 Jul 2018 22:34:53 +0200
Message-ID: <20180710203511.18454-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBCFRSTNAKGQE5MYD2VA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series fixes several issues found in R40 HDMI patch series after
it was applied. Conversation can be found here:
http://lists.infradead.org/pipermail/linux-arm-kernel/2018-June/586011.html

Patches are based on latest linux-next (next-20180710) and are ordered
in such way that they don't break R40 HDMI at any time. Because of that
I suggest that whole series goes through drm-misc to preserve that order.

I also tested those patches on H3 to make sure it doesn't break other
platforms. However, it would be nice to test for regressions also on
older SoCs (with DE1).

Best regards,
Jernej

Changes from v1:
- added Review-by and Acked-by tags
- added a patch which reorders mixer includes alphabetically
- reworked function which finds mixer id
- dropped register initialization in TCON TOP
- reworded some commit messages

Jernej Skrabec (18):
  dt-bindings: display: sun4i-drm: Add R40 display engine compatible
  drm/sun4i: Add R40 display engine compatible
  ARM: dts: sun8i: r40: Remove fallback display engine compatible
  drm/sun4i: tcon-top: Cleanup clock handling
  drm/sun4i: tcon: Release node when traversing of graph
  dt-bindings: display: sun4i-drm: Add R40 TV TCON description
  drm/sun4i: DW HDMI: Release nodes if error happens during CRTC search
  ARM: dts: sun8i: r40: Add mixer ids to TCON TOP
  drm/sun4i: mixer: Order includes alphabetically
  drm/sun4i: mixer: Read id from DT
  drm/sun4i: tcon-top: Add helpers for mux switching
  drm/sun4i: tcon: Add another way for matching mixers with tcon
  drm/sun4i: tcon: Add support for R40 TCON
  ARM: dts: sun8i: r40: Remove fallback compatible for TCON TV
  ARM: dts: sun8i: r40: Add missing TCON-TOP - TCON connections
  ARM: dts: sun8i: r40: Disable TCONs by default.
  drm/sun4i: tcon-top: Remove mux configuration at probe time
  dt-bindings: display: sun4i-drm: Fix order of DW HDMI PHY compatibles

 .../bindings/display/sunxi/sun4i-drm.txt      |   6 +-
 .../boot/dts/sun8i-r40-bananapi-m2-ultra.dts  |  20 +-
 arch/arm/boot/dts/sun8i-r40.dtsi              |  65 ++++++-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |   1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |  92 ++++++++-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c         |  15 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c           |  42 ++++-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c        | 178 ++++++++----------
 drivers/gpu/drm/sun4i/sun8i_tcon_top.h        |   4 +
 9 files changed, 278 insertions(+), 145 deletions(-)

-- 
2.18.0
