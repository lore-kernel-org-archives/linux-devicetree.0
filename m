From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/7] clk: sunxi-ng: Introduce support for A23 and A33 CCUs
Date: Tue,  6 Sep 2016 14:18:30 +0200
Message-ID: <20160906121837.7517-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mylene Josserand <mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi everyone,

Here is the migration for the A23 and A33 clocks to the sunxi-ng
framework.

It has been tested on SinA33 board, and I made sure that everything
was reported at the exact same rate, that the MMC was still working in
DDR, etc.

This has also been tested to implement the DRM driver, so I'm
confident things will work just fine.

Let me know what you think,
Maxime

Changes from v1:
  - Allowed to set a maximum on the dividers, and used that on the CPU
    clocks
  - Renamed the CE (crypto engine) clocks to SS (security system) to
    stick to what's being used in the datasheet
  - Added a TODO to mention that we don't really know whose parents
    are linked to the USB clocks.

Maxime Ripard (7):
  clk: sunxi-ng: div: Add mux table macros
  clk: sunxi-ng: div: Allow to set a maximum
  clk: sunxi-ng: mux: Add mux table macro
  clk: sunxi-ng: Add N-class clocks support
  clk: sunxi-ng: Add A33 CCU support
  clk: sunxi-ng: Add A23 CCU
  ARM: sun8i: Convert the A23 and A33 to the CCU

 .../devicetree/bindings/clock/sunxi-ccu.txt        |   2 +
 arch/arm/boot/dts/sun8i-a23-a33.dtsi               | 257 ++-----
 arch/arm/boot/dts/sun8i-a23.dtsi                   |  51 +-
 arch/arm/boot/dts/sun8i-a33.dtsi                   |  73 +-
 drivers/clk/sunxi-ng/Kconfig                       |  28 +
 drivers/clk/sunxi-ng/Makefile                      |   3 +
 drivers/clk/sunxi-ng/ccu-sun8i-a23-a33.h           |  63 ++
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c               | 732 +++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c               | 780 +++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_div.h                     |  49 +-
 drivers/clk/sunxi-ng/ccu_mp.c                      |  23 +-
 drivers/clk/sunxi-ng/ccu_mult.c                    | 133 ++++
 drivers/clk/sunxi-ng/ccu_mult.h                    |  35 +
 drivers/clk/sunxi-ng/ccu_mux.h                     |  26 +-
 drivers/clk/sunxi-ng/ccu_nkm.c                     |   4 +-
 drivers/clk/sunxi-ng/ccu_nkmp.c                    |  21 +-
 drivers/clk/sunxi-ng/ccu_nm.c                      |  16 +-
 include/dt-bindings/clock/sun8i-a23-a33-ccu.h      | 127 ++++
 include/dt-bindings/reset/sun8i-a23-a33-ccu.h      |  87 +++
 19 files changed, 2151 insertions(+), 359 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-a23-a33.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-a23.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-a33.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_mult.c
 create mode 100644 include/dt-bindings/clock/sun8i-a23-a33-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-a23-a33-ccu.h

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
