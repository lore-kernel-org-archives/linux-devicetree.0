From: Ray Jui <rjui@broadcom.com>
Subject: [PATCH v5 0/6] Add common clock support for Broadcom iProc architecture
Date: Wed, 4 Feb 2015 16:54:59 -0800
Message-ID: <1423097705-22939-1-git-send-email-rjui@broadcom.com>
References: <Ray Jui <rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Ray Jui <rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Matt Porter <mporter@linaro.org>, Alex Elder <elder@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>
List-Id: devicetree@vger.kernel.org

This patchset contains the initial common clock support for Broadcom's iProc
family of SoCs. The iProc clock architecture comprises of various PLLs, e.g.,
ARMPLL, GENPLL, LCPLL0, MIPIPLL, and etc. An onboard crystal serves as the
basic reference clock for these PLLs. Each PLL may have several leaf clocks.
One special group of clocks is the ASIU clocks, which are dervied directly
from the crystal reference clock.

This patchset also contains the basic clock support for the Broadcom Cygnus
SoC, which implements the iProc clock architecture

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
  clk: add of_clk_get_parent_rate function
  clk: iproc: define Broadcom iProc clock binding
  clk: iproc: add initial common clock support
  clk: Change bcm clocks build dependency
  clk: cygnus: add clock support for Broadcom Cygnus
  ARM: dts: enable clock support for Broadcom Cygnus

 arch/arm/boot/dts/bcm-cygnus-clock.dtsi |  110 ++++++--
 arch/arm/boot/dts/bcm-cygnus.dtsi       |    2 +-
 brcm,iproc-clocks.txt                   |  178 ++++++++++++
 drivers/clk/Makefile                    |    2 +-
 drivers/clk/bcm/Kconfig                 |    9 +
 drivers/clk/bcm/Makefile                |    2 +
 drivers/clk/bcm/clk-cygnus.c            |  277 +++++++++++++++++++
 drivers/clk/bcm/clk-iproc-armpll.c      |  282 +++++++++++++++++++
 drivers/clk/bcm/clk-iproc-asiu.c        |  275 ++++++++++++++++++
 drivers/clk/bcm/clk-iproc-clk.c         |  238 ++++++++++++++++
 drivers/clk/bcm/clk-iproc-pll.c         |  461 +++++++++++++++++++++++++++++++
 drivers/clk/bcm/clk-iproc.h             |  157 +++++++++++
 drivers/clk/clk.c                       |   17 ++
 include/dt-bindings/clock/bcm-cygnus.h  |   65 +++++
 include/linux/clk-provider.h            |    6 +-
 15 files changed, 2053 insertions(+), 28 deletions(-)
 create mode 100644 brcm,iproc-clocks.txt
 create mode 100644 drivers/clk/bcm/clk-cygnus.c
 create mode 100644 drivers/clk/bcm/clk-iproc-armpll.c
 create mode 100644 drivers/clk/bcm/clk-iproc-asiu.c
 create mode 100644 drivers/clk/bcm/clk-iproc-clk.c
 create mode 100644 drivers/clk/bcm/clk-iproc-pll.c
 create mode 100644 drivers/clk/bcm/clk-iproc.h
 create mode 100644 include/dt-bindings/clock/bcm-cygnus.h

-- 
1.7.9.5
