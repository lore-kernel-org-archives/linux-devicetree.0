From: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: [PATCH v5 0/5] mfd: add basic sun6i A31 PRCM support
Date: Thu, 15 May 2014 10:55:08 +0200
Message-ID: <1400144113-27659-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Philipp Zabel <p.zabel@pengutronix.de>, Shuge <shuge@allwinnertech.com>, kevin@allwinnertech.com, Hans de Goede <hdegoede@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dev@linux-sunxi.org, Boris BREZILLON <boris.brezillon@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Hello,

This patch series adds support for some functions provided by the PRCM
(Power/Reset/Clock Management) unit:
- AR100, AHB0 and APB0 clocks
- APB0 reset controller

Best Regards,

Boris

Changes since v4:
- remove merged patch from the series
- move the MFD_SUN6I_PRCM option selection out of the clk support commit

Changes since v3:
- split clk drivers into 3 different drivers: ar100, apb0 and apb0_gates
- fix indentation
- add comments to the clk drivers
- select the MFD_SUN6I_PRCM when compiling for SUN6I arch

Changes since v2:
- use devm_ioremap_resource instead of devm_request_and_ioremap
- remove unnecessary header inclusions
- remove info trace when the probe succeed
- rename apb0_timer01 clk into apb0_timer

Changes since v1:
- fix prcm and prcm-clks DT documentation
- remove unneeded iounmap and kfree calls from sunxi_reset_remove function
- rework the AR100 clk implementation

Boris BREZILLON (5):
  mfd: add support for sun6i PRCM (Power/Reset/Clock Management) unit
  mfd: sun6i-prcm: document DT bindings
  clk: sunxi: add PRCM (Power/Reset/Clock Management) clks support
  clk: sunxi: document PRCM clock compatible strings
  ARM: sunxi: select MFD_SUN6I_PRCM when sun6i arch support is enabled

 Documentation/devicetree/bindings/clock/sunxi.txt  |   3 +
 .../devicetree/bindings/mfd/sun6i-prcm.txt         |  59 ++++++
 arch/arm/mach-sunxi/Kconfig                        |   1 +
 drivers/clk/sunxi/Makefile                         |   2 +
 drivers/clk/sunxi/clk-sun6i-apb0-gates.c           |  99 +++++++++
 drivers/clk/sunxi/clk-sun6i-apb0.c                 |  77 +++++++
 drivers/clk/sunxi/clk-sun6i-ar100.c                | 233 +++++++++++++++++++++
 drivers/mfd/Kconfig                                |   8 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/sun6i-prcm.c                           | 134 ++++++++++++
 10 files changed, 617 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/sun6i-prcm.txt
 create mode 100644 drivers/clk/sunxi/clk-sun6i-apb0-gates.c
 create mode 100644 drivers/clk/sunxi/clk-sun6i-apb0.c
 create mode 100644 drivers/clk/sunxi/clk-sun6i-ar100.c
 create mode 100644 drivers/mfd/sun6i-prcm.c

-- 
1.8.3.2

