From: Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: [PATCH v5 0/7] gpio: daVinci: cleanup and feature enhancement
Date: Fri,  8 Nov 2013 15:41:43 +0530
Message-ID: <1383905510-31760-1-git-send-email-prabhakar.csengg@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, LAK <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Prabhakar Lad <prabhakar.csengg@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

From: KV Sujith <sujithkv@ti.com>

This patch series does the following
1> Ports the driver to use irqdomain.
2> Adds dt binding support for gpio-davinci.
3> Adds DA850 dt support goio.

Changes for v5:
1: Fixed review comments pointed by Grygorii.
2: Dropped the fixup patch

This patch series is based on following fixup series
http://us.generation-nt.com/answer/patch-0-2-davinci-gpio-fixes-help-212978272.html

KV Sujith (3):
  gpio: davinci: add OF support
  ARM: davinci: da850: add GPIO DT node
  ARM: davinci: da850 evm: add GPIO pinumux entries DT node

Lad, Prabhakar (4):
  gpio: davinci: remove unnecessary printk
  gpio: davinci: use readl/writel instead of __raw_*
  gpio: davinci: use irqdomain
  gpio: davinci: remove unused variable intc_irq_num

 .../devicetree/bindings/gpio/gpio-davinci.txt      |   39 +++++
 arch/arm/boot/dts/da850-evm.dts                    |   20 +++
 arch/arm/boot/dts/da850.dtsi                       |   14 ++
 arch/arm/mach-davinci/da830.c                      |    1 -
 arch/arm/mach-davinci/da850.c                      |    1 -
 arch/arm/mach-davinci/dm355.c                      |    1 -
 arch/arm/mach-davinci/dm365.c                      |    1 -
 arch/arm/mach-davinci/dm644x.c                     |    1 -
 arch/arm/mach-davinci/dm646x.c                     |    1 -
 drivers/gpio/gpio-davinci.c                        |  170 +++++++++++++-------
 include/linux/platform_data/gpio-davinci.h         |    3 +-
 11 files changed, 185 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.txt

-- 
1.7.9.5

