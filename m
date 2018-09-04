From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v4 00/11] arm64: allwinner: Add A64 DE2 HDMI support
Date: Tue,  4 Sep 2018 12:40:42 +0800
Message-ID: <20180904044053.15425-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB34ZXDOAKGQE5AVELIQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner A64 has display engine pipeline like other Allwinner SOC's A83T/H3/H5.

A64 behaviour similar to Allwinner A83T where
Mixer0 => TCON0 => LVDS/RGB/MIPI-DSI
Mixer1 => TCON1 => HDMI
as per Display System Block Diagram from the A64 user manual.

This patchset adds support for the two display pipelines, and enables
the HDMI output on several boards. The first pipeline is not enabled in
this patchset yet, although it's added.

Icenowy Zheng (2):
  clk: sunxi-ng: a64: Add max. rate constraint to video PLLs
  dt-bindings: sun4i-drm: add HDMI VCC supply property for sun8i-dw-hdmi

Jagan Teki (8):
  clk: sunxi-ng: a64: Add minimal rate for video PLLs
  dt-bindings: display: Add compatible for A64 DE2 display pipeline
  drm/sun4i: Add support for A64 mixers
  drm/sun4i: Add support for A64 display engine
  dt-bindings: display: Add compatible for A64 HDMI
  dt-bindings: clock: sun50i-a64-ccu: Add PLL_VIDEO0 macro
  arm64: dts: allwinner: a64: Add display pipeline
  arm64: dts: allwinner: a64: Enable HDMI output on A64 boards w/ HDMI

Jernej Skrabec (1):
  drm/sun4i: Add support for HDMI voltage regulator

 .../bindings/display/sunxi/sun4i-drm.txt      |   9 +
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts |  34 ++++
 .../dts/allwinner/sun50i-a64-nanopi-a64.dts   |  34 ++++
 .../dts/allwinner/sun50i-a64-olinuxino.dts    |  34 ++++
 .../dts/allwinner/sun50i-a64-orangepi-win.dts |  34 ++++
 .../boot/dts/allwinner/sun50i-a64-pine64.dts  |  34 ++++
 .../allwinner/sun50i-a64-sopine-baseboard.dts |  34 ++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 170 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c         |  48 ++---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h         |   4 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |   1 +
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c         |  17 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h         |   2 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c           |  24 +++
 include/dt-bindings/clock/sun50i-a64-ccu.h    |   1 +
 15 files changed, 456 insertions(+), 24 deletions(-)

-- 
2.18.0
