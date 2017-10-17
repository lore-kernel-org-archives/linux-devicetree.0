From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 00/10] drm/sunxi: Display pipeline and HDMI
 output on A10/A20
Date: Tue, 17 Oct 2017 20:17:57 +0800
Message-ID: <20171017121807.2994-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBAPKS7HQKGQEQSAPW2Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This series adds display support for Allwinner A10/A20 SoCs to the
sun4i-drm driver. The core display pipeline components and HDMI are
covered. LCD panel RGB output should also be available, but I do not
have devices to test this on.

Jonathan had HDMI working on the A20, along with LCD panels for a
development board. I've picked up the work, polished it, and added A10
(which is what the A20 is based on) support to the batch.

The series is based on my latest sun4i-drm cleanup series. The patches
should apply without them, but display would be broken on devices with
more than 1GB RAM, and HDMI display colors would be inverted on A10
devices.

The TCON changes will likely conflict with the A83T LVDS series Maxime
posted, but they would be obvious and easy to fix.

The patches are pretty self-explaining:

  - 1 patch exports the PLLs used by the HDMI controller

  - 1 patch adds support for the backend output mux

  - 3 patches add A10/A20 compatible strings to the sun4i-drm driver

  - 2 patches add the display pipeline nodes to the .dtsi files
 
  - 2 patches enable HDMI output on various boards

Chen-Yu Tsai (6):
  drm/sun4i: backend: Support output muxing
  drm/sun4i: hdmi: Support HDMI controller on A10
  drm/sun4i: Add support for A10 display pipeline components
  ARM: dts: sun4i: Add device nodes for display pipelines
  ARM: dts: sun4i: Enable HDMI support on some A10 devices
  ARM: dts: sun7i: Enable HDMI support on some A20 devices

Jonathan Liu (4):
  drm/sun4i: tcon: Add support for A10 TCON
  drm/sun4i: Add support for A20 display pipeline components
  clk: sunxi-ng: sun4i: Export video PLLs
  ARM: dts: sun7i: Add device nodes for display pipelines

 .../bindings/display/sunxi/sun4i-drm.txt           |   9 +
 arch/arm/boot/dts/sun4i-a10-cubieboard.dts         |  25 ++
 arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts     |  21 ++
 arch/arm/boot/dts/sun4i-a10.dtsi                   | 306 ++++++++++++++++++++
 arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts   |  25 ++
 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts        |  25 ++
 arch/arm/boot/dts/sun7i-a20-cubietruck.dts         |  25 ++
 arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts          |  25 ++
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts     |  25 ++
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts    |  25 ++
 arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts    |  25 ++
 arch/arm/boot/dts/sun7i-a20.dtsi                   | 307 +++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun4i-a10.h               |   4 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c              |  68 ++++-
 drivers/gpu/drm/sun4i/sun4i_backend.h              |   3 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |  10 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  53 ++++
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |  37 +++
 include/dt-bindings/clock/sun4i-a10-ccu.h          |   2 +
 19 files changed, 1012 insertions(+), 8 deletions(-)

-- 
2.14.2
