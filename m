From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH v2 0/6] ARM: sunxi: Convert sun4i/sun7i series
 SoCs to sunxi-ng
Date: Sun, 26 Mar 2017 20:20:15 +0300
Message-ID: <cover.a58841efb571d44013658505f3fa140536a89d1c.1490545262.git-series.plaes@plaes.org>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJLTBEBXENBBB7R37DAKGQET3MRGJY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This serie brings A10 (sun4i) and A20 (sun7i) SoCs into the
sunxi-ng world.

As mentioned in sun5i conversion, this is pretty much standard
stuff as all the required clocks were already implemented in
the sunxi-ng framework.

Unfortunately there's an issue with LVDS reset control that
causes issues with LVDS displays unless 'clk_ignore_unused'
option is used.

Need help with that :(

Changes from v1:
 - Drop useless comments
 - Add support for A10 / sun4i.
 - Rename driver to sunxi-a10-a20.
 - Add previously unimplemented clocks.
 - Document the audio pll hardcoded post-divider
 - Add Acked-by: Rob Herring <robh at kernel.org> on patch 4

Priit Laes (6):
  clk: sunxi-ng: Add sun4i/sun7i CCU driver
  ARM: sun7i: Convert to CCU
  ARM: sun4i: Convert to CCU
  dt-bindings: List devicetree binding for the CCU of Allwinner A20
  dt-bindings: List devicetree binding for the CCU of Allwinner A10
  clk: sunxi-ng: Display index when clock registration fails

 Documentation/devicetree/bindings/clock/sunxi-ccu.txt |    2 +-
 arch/arm/boot/dts/sun4i-a10.dtsi                      |  636 +----
 arch/arm/boot/dts/sun7i-a20.dtsi                      |  717 +-----
 drivers/clk/sunxi-ng/Kconfig                          |   13 +-
 drivers/clk/sunxi-ng/Makefile                         |    1 +-
 drivers/clk/sunxi-ng/ccu-sunxi-a10-a20.c              | 1532 ++++++++++-
 drivers/clk/sunxi-ng/ccu-sunxi-a10-a20.h              |   59 +-
 drivers/clk/sunxi-ng/ccu_common.c                     |    4 +-
 include/dt-bindings/clock/sunxi-a10-a20-ccu.h         |  208 +-
 include/dt-bindings/reset/sunxi-a10-a20-ccu.h         |   66 +-
 10 files changed, 2050 insertions(+), 1188 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sunxi-a10-a20.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sunxi-a10-a20.h
 create mode 100644 include/dt-bindings/clock/sunxi-a10-a20-ccu.h
 create mode 100644 include/dt-bindings/reset/sunxi-a10-a20-ccu.h

base-commit: 8e19fb843be8934d48b31fafbb32a4176f7feb65
-- 
git-series 0.9.1
