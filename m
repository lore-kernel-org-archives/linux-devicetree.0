From: Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH v5 0/5] ARM: at91: pm: add ULP1 mode support
Date: Wed, 16 Mar 2016 14:58:04 +0800
Message-ID: <1458111489-23774-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Russell King <linux@arm.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Wenyou Yang <wenyou.yang@atmel.com>
List-Id: devicetree@vger.kernel.org

The ULP1 (Ultra Low-power mode 1) is introduced by SAMA5D2.

In order to achieve the lowest power consumption, in the ULP1 mode,
all the clocks are shut off, inclusive the embedded 12MHz RC oscillator.

The fast startup signal is used as a wake up source for ULP1 mode.
As soon as the wake up event is asserted, the embedded 12MHz RC
oscillator restarts automatically, which fast startup signal
to trigger the PMC to wake up the system from the ULP1 mode can be
configured via DT.

Changes in v5:
 - to improve the scalability, rework the DT expression part, use
   the child nodes to describe the wake-up input and its active level.
 - due to the DT property expression change, update the binding
   document.
 - due to the DT property expression change, update the fast restart
   node's property.

Changes in v4:
 - add Acked-by tag.
 - add fast_restart node to the DT file.

Changes in v3:
 - use 0 and 1, not string, to define the trigger active polarity.
 - update the property description.

Changes in v2:
 - fix label pm_exit to ulp_exit.
 - shorten the pmc-fast-startup property's name.
 - use the value property, instead of bool property for high
   or low triggered.
 - change the property name and property description.

Wenyou Yang (5):
  ARM: at91: pm: create a separate procedure for the ULP0 mode
  ARM: at91: pm: add ULP1 mode support
  ARM: at91: pm: configure PMC fast startup signals
  Documentation: atmel-pmc: add DT bindings for fast startup
  ARM: at91/dt: sama5d2_xplained: add fast_restart node

 .../devicetree/bindings/arm/atmel-pmc.txt          |   52 +++++++
 arch/arm/boot/dts/at91-sama5d2_xplained.dts        |   19 +++
 arch/arm/mach-at91/pm.c                            |   82 +++++++++-
 arch/arm/mach-at91/pm.h                            |    7 +
 arch/arm/mach-at91/pm_suspend.S                    |  158 +++++++++++++++++---
 include/linux/clk/at91_pmc.h                       |   18 +++
 6 files changed, 311 insertions(+), 25 deletions(-)

-- 
1.7.9.5

