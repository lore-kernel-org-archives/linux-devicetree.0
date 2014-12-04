From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/4] Add common clock support for Broadcom iProc architecture
Date: Thu, 4 Dec 2014 13:43:24 -0800
Message-ID: <1417729408-30357-1-git-send-email-rjui@broadcom.com>
References: <Ray Jui <rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset contains the initial common clock support for Broadcom's iProc
family of SoCs. The iProc clock architecture comprises of various PLLs, e.g.,
ARMPLL, GENPLL, LCPLL0, MIPIPLL, and etc. An onboard crystal serves as the
basic reference clock for these PLLs. Each PLL may have several leaf clocks.
One special group of clocks is the ASIU clocks, which are dervied directly
from the crystal reference clock.

This patchset also contains the basic clock support for the Broadcom Cygnus
SoC, which implements the iProc clock architecture

Ray Jui (4):
  clk: iproc: define Broadcom iProc clock binding
  clk: iproc: add initial common clock support
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
