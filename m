From: Ray Jui <rjui@broadcom.com>
Subject: [PATCH v2 0/5] Add common clock support for Broadcom iProc architecture
Date: Mon, 5 Jan 2015 15:21:11 -0800
Message-ID: <1420500076-18302-1-git-send-email-rjui@broadcom.com>
References: <Ray Jui <rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Ray Jui <rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Matt Porter <mporter@linaro.org>, Alex Elder <elder@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>
List-Id: devicetree@vger.kernel.org

This patchset contains the initial common clock support for Broadcom's iProc
family of SoCs. The iProc clock architecture comprises of various PLLs, e.g.,
ARMPLL, GENPLL, LCPLL0, MIPIPLL, and etc. An onboard crystal serves as the
basic reference clock for these PLLs. Each PLL may have several leaf clocks.
One special group of clocks is the ASIU clocks, which are dervied directly
from the crystal reference clock.

This patchset also contains the basic clock support for the Broadcom Cygnus
SoC, which implements the iProc clock architecture

Changes from v1:
 - Separate drivers/clk/Makefile change for drivers/clk/bcm out to a standalone patch

Ray Jui (5):
  clk: iproc: define Broadcom iProc clock binding
  clk: iproc: add initial common clock support
  clk: Change bcm clocks build dependency
  clk: cygnus: add clock support for Broadcom Cygnus
  ARM: dts: enable clock support for Broadcom Cygnus

 arch/arm/boot/dts/bcm-cygnus-clock.dtsi |  110 +++++--
 arch/arm/boot/dts/bcm-cygnus.dtsi       |    2 +-
 brcm,iproc-clocks.txt                   |  178 ++++++++++++
 drivers/clk/Makefile                    |    2 +-
 drivers/clk/bcm/Kconfig                 |    9 +
 drivers/clk/bcm/Makefile                |    2 +
 drivers/clk/bcm/clk-cygnus.c            |  277 ++++++++++++++++++
 drivers/clk/bcm/clk-iproc-armpll.c      |  286 ++++++++++++++++++
 drivers/clk/bcm/clk-iproc-asiu.c        |  275 ++++++++++++++++++
 drivers/clk/bcm/clk-iproc-clk.c         |  238 +++++++++++++++
 drivers/clk/bcm/clk-iproc-pll.c         |  483 +++++++++++++++++++++++++++++++
 drivers/clk/bcm/clk-iproc.h             |  155 ++++++++++
 include/dt-bindings/clock/bcm-cygnus.h  |   77 +++++
 13 files changed, 2067 insertions(+), 27 deletions(-)
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
