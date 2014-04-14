From: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: [PATCH 0/4] ARM: at91: move sam9n12 SoC and boards to the CCF
Date: Mon, 14 Apr 2014 10:16:35 +0200
Message-ID: <1397463399-11771-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Bo Shen <voice.shen@atmel.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Boris BREZILLON <boris.brezillon@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Hello,

This series moves the at91sam9n12 SoC and the at91sam9n12-ek board to
the Common Clock Framework.

It depends on this series [1], which introduces new slow clock and main
clock implementation (and DT bindings) for at91 SoCs.

Best Regards,

Boris

[1] http://lkml.iu.edu/hypermail/linux/kernel/1403.3/00074.html

Boris BREZILLON (4):
  ARM: at91: prepare common clk transition for sam9n12 SoC
  ARM: at91/dt: define sam9n12 clocks
  ARM: at91/dt: define sam9n12ek crystal frequencies
  ARM: at91: move sam9n12 SoC to the CCF

 arch/arm/boot/dts/at91sam9n12.dtsi  | 350 +++++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/at91sam9n12ek.dts |   8 +
 arch/arm/mach-at91/Kconfig          |   1 -
 arch/arm/mach-at91/at91sam9n12.c    |   6 +-
 4 files changed, 361 insertions(+), 4 deletions(-)

-- 
1.8.3.2
