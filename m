From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 0/5] USB: atmel: rework clock handling
Date: Tue, 17 Mar 2015 17:15:45 +0100
Message-ID: <1426608950-31555-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Douglas Gilbert <dgilbert@interlog.com>, Robert Nelson <robert.nelson@digikey.com>, Boris Brezillon <boris.brezillon@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Hello,

This series reworks clock handling in atmel USB host drivers, and while
doing so fixes a regression introduced by 3440ef1 (ARM: at91/dt: fix USB
high-speed clock to select UTMI).

Best Regards,

Boris

Boris Brezillon (5):
  USB: ehci-atmel: rework clk handling
  USB: host: ohci-at91: remove useless uclk clock
  USB: atmel: update DT bindings documentation
  ARM: at91/dt: remove useless uhpck clock references from ehci
    defintions
  ARM: at91/dt: remove useless usb clock

 .../devicetree/bindings/usb/atmel-usb.txt          | 25 ++++++++++++++++++
 arch/arm/boot/dts/at91rm9200.dtsi                  |  4 +--
 arch/arm/boot/dts/at91sam9260.dtsi                 |  4 +--
 arch/arm/boot/dts/at91sam9261.dtsi                 |  4 +--
 arch/arm/boot/dts/at91sam9263.dtsi                 |  4 +--
 arch/arm/boot/dts/at91sam9g45.dtsi                 |  8 +++---
 arch/arm/boot/dts/at91sam9n12.dtsi                 |  5 ++--
 arch/arm/boot/dts/at91sam9x5.dtsi                  |  8 +++---
 arch/arm/boot/dts/sama5d3.dtsi                     |  9 +++----
 arch/arm/boot/dts/sama5d4.dtsi                     |  9 +++----
 drivers/usb/host/ehci-atmel.c                      | 30 +++++++---------------
 drivers/usb/host/ohci-at91.c                       | 18 +++----------
 12 files changed, 63 insertions(+), 65 deletions(-)

-- 
1.9.1
