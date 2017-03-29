From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v3 00/11] Initial Allwinner Display Engine 2.0 Support
Date: Thu, 30 Mar 2017 03:46:02 +0800
Message-ID: <20170329194613.55548-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBHU66DDAKGQEDINQZKY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset is the initial patchset for Allwinner DE2 support.

It contains the support of clocks in DE2 and the mixers in DE2.

The SoC used to develop this patchset is V3s, as V3s is the simplest
one of the SoCs that have DE2.
(Allwinner V3s features only one mixer, although its clock control
unit contains support for second mixer's clock; and its only video
output is RGB LCD, which is already supported in our TCON driver)

The last patch is only a testing patch, it shouldn't be merged; and
for the patch to be really usable, the RFC fix of the TCON driver [1]
is needed.

No HDMI, TV encoder or other internal bridges' support is included
in this patchset, which makes it currently not usable on H3.

Thanks to Jean-Francois Moine and Jernej Skrabec for their efforts
to discover the internal of DE2!

[1] https://lists.freedesktop.org/archives/dri-devel/2016-December/126264.html

Icenowy Zheng (11):
  dt-bindings: add binding for the Allwinner DE2 CCU
  clk: sunxi-ng: add support for DE2 CCU
  dt-bindings: add bindings for DE2 on V3s SoC
  drm/sun4i: abstruct the layer type
  drm/sun4i: abstract a mixer type
  drm/sun4i: add support for Allwinner DE2 mixers
  drm/sun4i: Add compatible string for V3s display engine
  drm/sun4i: tcon: add support for V3s TCON
  ARM: dts: sun8i: add DE2 nodes for V3s SoC
  ARM: dts: sun8i: add pinmux for LCD pins of V3s SoC
  [DO NOT MERGE] ARM: dts: sun8i: enable LCD panel of Lichee Pi Zero

 .../devicetree/bindings/clock/sun8i-de2.txt        |  31 ++
 .../bindings/display/sunxi/sun4i-drm.txt           |  37 +-
 arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts      |  36 ++
 arch/arm/boot/dts/sun8i-v3s.dtsi                   |  96 +++++
 drivers/clk/sunxi-ng/Kconfig                       |   5 +
 drivers/clk/sunxi-ng/Makefile                      |   1 +
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c               | 204 +++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-de2.h               |  28 ++
 drivers/gpu/drm/sun4i/Kconfig                      |  20 ++
 drivers/gpu/drm/sun4i/Makefile                     |  10 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c              |  26 +-
 drivers/gpu/drm/sun4i/sun4i_backend.h              |   5 -
 drivers/gpu/drm/sun4i/sun4i_crtc.c                 |  31 +-
 drivers/gpu/drm/sun4i/sun4i_crtc.h                 |  10 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |   4 +-
 drivers/gpu/drm/sun4i/sun4i_drv.h                  |   3 +-
 drivers/gpu/drm/sun4i/sun4i_layer.c                |  22 +-
 drivers/gpu/drm/sun4i/sun4i_layer.h                |   6 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |   7 +-
 drivers/gpu/drm/sun4i/sun4i_tv.c                   |   8 +-
 drivers/gpu/drm/sun4i/sun8i_layer.c                | 156 +++++++++
 drivers/gpu/drm/sun4i/sun8i_layer.h                |  35 ++
 drivers/gpu/drm/sun4i/sun8i_mixer.c                | 386 +++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_mixer.h                | 131 +++++++
 drivers/gpu/drm/sun4i/sunxi_layer.h                |  17 +
 drivers/gpu/drm/sun4i/sunxi_mixer.h                |  22 ++
 include/dt-bindings/clock/sun8i-de2.h              |  54 +++
 include/dt-bindings/reset/sun8i-de2.h              |  50 +++
 28 files changed, 1391 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/sun8i-de2.txt
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-de2.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-de2.h
 create mode 100644 drivers/gpu/drm/sun4i/sun8i_layer.c
 create mode 100644 drivers/gpu/drm/sun4i/sun8i_layer.h
 create mode 100644 drivers/gpu/drm/sun4i/sun8i_mixer.c
 create mode 100644 drivers/gpu/drm/sun4i/sun8i_mixer.h
 create mode 100644 drivers/gpu/drm/sun4i/sunxi_layer.h
 create mode 100644 drivers/gpu/drm/sun4i/sunxi_mixer.h
 create mode 100644 include/dt-bindings/clock/sun8i-de2.h
 create mode 100644 include/dt-bindings/reset/sun8i-de2.h

-- 
2.12.0
