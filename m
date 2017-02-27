From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 0/4] ARM: sun7i: Convert sun7i SoC to sunxi-ng
Date: Mon, 27 Feb 2017 23:09:10 +0200
Message-ID: <20170227210914.18954-1-plaes@plaes.org>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJLTBEBXENBBHNL2LCQKGQEX3HGF5Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This is serie brings another SoC into the sunxi-ng world.

As mentioned in sun5i conversion, this is pretty much standard
stuff as all the required clocks were already implemented in
the sunxi-ng framework.


Priit Laes (4):
  clk: sunxi-ng: Add clocks and reset indices for sun7i-a20 SoC
  clk: sunxi-ng: Add sun7i-a20 CCU driver
  ARM: sun7i: Convert to CCU
  dt-bindings: List devicetree binding for the CCU of Allwinner A20

 .../devicetree/bindings/clock/sunxi-ccu.txt        |    1 +
 arch/arm/boot/dts/sun7i-a20.dtsi                   |  719 ++-----------
 drivers/clk/sunxi-ng/Kconfig                       |   11 +
 drivers/clk/sunxi-ng/Makefile                      |    1 +
 drivers/clk/sunxi-ng/ccu-sun7i-a20.c               | 1068 ++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun7i-a20.h               |  121 +++
 include/dt-bindings/clock/sun7i-ccu.h              |  127 +++
 include/dt-bindings/reset/sun7i-ccu.h              |   40 +
 8 files changed, 1455 insertions(+), 633 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun7i-a20.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun7i-a20.h
 create mode 100644 include/dt-bindings/clock/sun7i-ccu.h
 create mode 100644 include/dt-bindings/reset/sun7i-ccu.h

-- 
2.9.3
