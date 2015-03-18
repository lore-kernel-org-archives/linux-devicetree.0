From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v6 0/6] Add common clock support for Broadcom iProc architecture
Date: Tue, 17 Mar 2015 22:45:16 -0700
Message-ID: <1426657522-2473-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset contains the initial common clock support for Broadcom's iProc
family of SoCs. The iProc clock architecture comprises of various PLLs, e.g.,
ARMPLL, GENPLL, LCPLL0, MIPIPLL, and etc. An onboard crystal serves as the
basic reference clock for these PLLs. Each PLL may have several leaf clocks.
One special group of clocks is the ASIU clocks, which are dervied directly
from the crystal reference clock.

This patchset also contains the basic clock support for the Broadcom Cygnus
SoC, which implements the iProc clock architecture

Changes from v5:
 - Rebase to v4.0-rc4
 - Drop of_clk_get_parent_rate helper function from the clock framework
 - Get rid of custom "clock-frequency" support in iProc PLL code. Instead, add
   standard clock set_rate and round_rate support and make use of DT properties
   "assigned-clocks" and "assigned-clock-rates" to initialize PLL to the
   desired rate when registering to the clock framework
 - Add SW workaround for ASIC bug on MIPI PLL to always read back the same
   register following a write transaction, to ensure value is written to the
   correct register

Changes from v4:
 - Add of_clk_get_parent_rate helper function into the clock framework
 - Switch to use of_clk_get_parent_rate in the iProc PLL clock driver

Changes from v3:
 - Fix incorrect use of passing in of_clk_src_onecell_get when adding ARM PLL
   and other iProc PLLs as clock provider. These PLLs have zero cells in DT and
   thefore of_clk_src_simple_get should be used instead
 - Rename Cygnus MIPI PLL Channel 2 clock from BCM_CYGNUS_MIPIPLL_CH2_UNUSED
   to BCM_CYGNUS_MIPIPLL_CH2_V3D, since a 3D graphic rendering engine has been
   integrated into Cygnus revision B0 and has its core clock running off
   MIPI PLL Channel 2
 - Changed default MIPI PLL VCO frequency from 1.75 GHz to 2.1 GHz. This allows
   us to derive 300 MHz V3D clock from channel 2 through the post divisor

Changes from v2:
 - Re-arrange Cygnus clock/pll init functions so each init function is right
   next to its clock table
 - Removed #defines for number of clocks in Cygnus. Have the number of clocks
   automatically determined based on array size of the clock table

Changes from v1:
 - Separate drivers/clk/Makefile change for drivers/clk/bcm out to a standalone patch

Ray Jui (6):
  clk: iproc: define Broadcom iProc clock binding
  clk: iproc: add initial common clock support
  clk: Change bcm clocks build dependency
  clk: cygnus: add clock support for Broadcom Cygnus
  ARM: dts: enable clock support for Broadcom Cygnus
  clk: cygnus: remove Cygnus dummy clock binding

 .../devicetree/bindings/clock/bcm-cygnus-clock.txt |   34 --
 .../bindings/clock/brcm,iproc-clocks.txt           |  171 +++++++
 arch/arm/boot/dts/bcm-cygnus-clock.dtsi            |  112 ++++-
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |    2 +-
 drivers/clk/Makefile                               |    2 +-
 drivers/clk/bcm/Kconfig                            |    9 +
 drivers/clk/bcm/Makefile                           |    2 +
 drivers/clk/bcm/clk-cygnus.c                       |  284 ++++++++++++
 drivers/clk/bcm/clk-iproc-armpll.c                 |  282 +++++++++++
 drivers/clk/bcm/clk-iproc-asiu.c                   |  275 +++++++++++
 drivers/clk/bcm/clk-iproc-clk.c                    |  244 ++++++++++
 drivers/clk/bcm/clk-iproc-pll.c                    |  490 ++++++++++++++++++++
 drivers/clk/bcm/clk-iproc.h                        |  164 +++++++
 include/dt-bindings/clock/bcm-cygnus.h             |   65 +++
 14 files changed, 2075 insertions(+), 61 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/bcm-cygnus-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
 create mode 100644 drivers/clk/bcm/clk-cygnus.c
 create mode 100644 drivers/clk/bcm/clk-iproc-armpll.c
 create mode 100644 drivers/clk/bcm/clk-iproc-asiu.c
 create mode 100644 drivers/clk/bcm/clk-iproc-clk.c
 create mode 100644 drivers/clk/bcm/clk-iproc-pll.c
 create mode 100644 drivers/clk/bcm/clk-iproc.h
 create mode 100644 include/dt-bindings/clock/bcm-cygnus.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
