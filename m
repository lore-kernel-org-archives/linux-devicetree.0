From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: [PATCH 0/3] clk: sunxi: Simpler driver for Allwinner's clocks
Date: Tue, 28 Jun 2016 19:44:58 +0200
Message-ID: <cover.1467135898.git.moinejf@free.fr>
Reply-To: moinejf-GANU6spQydw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBPMJZO5QKGQE3OAKEHY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The 'sunxi-ng' proposal from Maxime Ripard did a great advance in
handling the clocks of Allwinner's SoCs, but it appeared that it
was not easy to extend its functions and handle some other SoCs as
the A83T.

This patch series proposes a more flexible and simpler structure.
The basic idea is to have the same structure for all clocks.
All parameters (multipliers, dividers, mux, gates..) may be defined
or not in each clock. An 'extra' pointer permits to handle rare
or specific functions.

The notion of 'bus gates' appearing in previous drivers and DTs
are of no interest outside the clock driver itself. So, this
driver maps the bus gate and clock gate operations to the standard
clock functions 'prepare/unprepare' and 'enable/disable'.

The reset functions are included in this driver.
As often, the resets occur at probe time, at the same time as the
clock prepare calls, this driver optionally proposes to hide them
by doing a 'reset and enable bus gate' on clock prepare (and same
in inverse order on clock unprepare).

This driver has been tested on a Banana Pi M3 (A83T):
- working: UART0, USB0, MMC0, THS, video (DE + LCD1 + HDMI)
- not tested yet: HDMI audio (the EDID cannot be read
				preventing audio to be enabled)
- not working: MMC1 (wifi), MMC2 (eMMC)

(sorry, Maxime, but I think that my implementation is easier to
 extend than yours)

Jean-Francois Moine (3):
  clk: sunxi: Add a driver for the CCU
  clk: sunxi: Add the A83T clocks
  dt: sun8i: Define the clocks of the A83T

 Documentation/devicetree/bindings/clock/sunxi.txt |   7 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi                 |  16 +-
 drivers/clk/sunxi/Makefile                        |   3 +
 drivers/clk/sunxi/ccu-sun8i-a83t.c                | 858 +++++++++++++++++++
 drivers/clk/sunxi/ccu.c                           | 980 ++++++++++++++++++++++
 drivers/clk/sunxi/ccu.h                           | 153 ++++
 include/dt-bindings/clock/sun8i-a83t.h            |  97 +++
 include/dt-bindings/reset/sun8i-a83t.h            |  62 ++
 8 files changed, 2169 insertions(+), 7 deletions(-)
 create mode 100644 drivers/clk/sunxi/ccu-sun8i-a83t.c
 create mode 100644 drivers/clk/sunxi/ccu.c
 create mode 100644 drivers/clk/sunxi/ccu.h
 create mode 100644 include/dt-bindings/clock/sun8i-a83t.h
 create mode 100644 include/dt-bindings/reset/sun8i-a83t.h

-- 
2.9.0
