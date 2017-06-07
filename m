From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH 0/2] Add bcm2835aux interrupt controller
Date: Wed, 7 Jun 2017 12:11:29 +0100
Message-ID: <6dc301c8-e5a2-1334-c476-1ce7e303787f@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Devices in the AUX block share a common interrupt line, with a register
indicating which devices have active IRQs. Expose this as a nested
interrupt controller to avoid IRQ sharing problems (easily observed if
UART1 and SPI1/2 are enabled simultaneously).

The interrupt functionality could arguably be forked off as a separate
irqchip driver, but the clock driver has already claimed the AUX_IRQ
register so some driver and DT surgery would still be required.
Eric Anholt thought that including it here is reasonable, but I'm
prepared to split it out if this is considered too hacky.

Phil Elwell (2):
  clk: bcm2835: Add AUX interrupt controller
  ARM: dts: bcm283x: Enable AUX interrupt controller

 arch/arm/boot/dts/bcm283x.dtsi    |  12 +++-
 drivers/clk/bcm/clk-bcm2835-aux.c | 120 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 129 insertions(+), 3 deletions(-)

-- 
1.9.1
