From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 0/5] ARM: sunxi: Convert sun4i/sun7i series SoCs
 to sunxi-ng CCU
Date: Wed, 26 Apr 2017 22:31:34 +0300
Message-ID: <cover.908ce010a25e503bb5ad0967759c723219c6ed0d.1493234410.git-series.plaes@plaes.org>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJLTBEBXENBBJ7LQPEAKGQEQLDCWBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This serie brings A10 (sun4i) and A20 (sun7i) SoCs into the
sunxi-ng world.

As mentioned in sun5i conversion, this is pretty much standard
stuff as all the required clocks were already implemented in
the sunxi-ng framework.

TODO: Unfortunately there's still an issue with SATA clocks
which will fail unless u-boot has set up the clocks. Clocks
probably need some extra work to handle fixed postdivider
and multiple parents.

Changes from v2:
 - Rename driver and relevant files to sun4i-a10-ccu.
 - Drop mmc output and sample clocks for sun4i-a10.
 - Rename CSI ISP clock to SCLK as it is called on other variants.
 - Add comment on why PLL6 is used as AHB parent.
 - Fix parents for out_a/out_b clocks.
 - Stop exporting PLL_PERIPH_SATA gate. Driver takes care of gate.
 - Rework SATA clock handling.
 - Fix ahb gate parents.
 - Simplefb clock fixes (add dependencies for HDMI/LVDS clocks).
 - Fixes for pll-ve and pll-video1 clocks pointed out by Jonathan Liu.
 - Adapt to latest upstream changes from sunxi-next.

Changes from v1:
 - Drop useless comments
 - Add support for A10 / sun4i.
 - Rename driver to sunxi-a10-a20.
 - Add previously unimplemented clocks.
 - Document the audio pll hardcoded post-divider
 - Add Acked-by: Rob Herring <robh at kernel.org> on patch 4

Priit Laes (5):
  clk: sunxi-ng: Add sun4i/sun7i CCU driver
  dt-bindings: List devicetree binding for the CCU of Allwinner A20
  dt-bindings: List devicetree binding for the CCU of Allwinner A10
  ARM: sun7i: Convert to CCU
  ARM: sun4i: Convert to CCU

 Documentation/devicetree/bindings/clock/sunxi-ccu.txt |    2 +-
 arch/arm/boot/dts/sun4i-a10.dtsi                      |  645 +----
 arch/arm/boot/dts/sun7i-a20.dtsi                      |  720 +-----
 drivers/clk/sunxi-ng/Kconfig                          |   14 +-
 drivers/clk/sunxi-ng/Makefile                         |    1 +-
 drivers/clk/sunxi-ng/ccu-sun4i-a10.c                  | 1443 ++++++++++-
 drivers/clk/sunxi-ng/ccu-sun4i-a10.h                  |   60 +-
 include/dt-bindings/clock/sun4i-a10-ccu.h             |  207 +-
 include/dt-bindings/reset/sun4i-a10-ccu.h             |   67 +-
 9 files changed, 1954 insertions(+), 1205 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun4i-a10.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun4i-a10.h
 create mode 100644 include/dt-bindings/clock/sun4i-a10-ccu.h
 create mode 100644 include/dt-bindings/reset/sun4i-a10-ccu.h

base-commit: 4c5e651abcb0fe1c7dd61d4ceb0388cc4a80485f
-- 
git-series 0.9.1
