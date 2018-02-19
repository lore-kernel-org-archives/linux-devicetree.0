Return-Path: <SRS0=kFSR=FN=gmail.com=joel.stan@kernel.org>
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2 0/3] misc: aspeed-lpc-ctrl fixes
Date: Mon, 19 Feb 2018 17:54:19 +1030
Message-Id: <20180219072422.22733-1-joel@jms.id.au>
To: Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Cyril Bur <cyrilbur@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Lei YU <mine260309@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Hi Greg,

Once Andrew has acked the bindings I think this is ready to go.

v2: Fix binding layout and add Rob's ack

These patches were developed when testing upstream Linux with OpenBMC on
Romulus. We need to ensure the LPC clock is enabled, now that the clock
driver turns off any unused clocks. We also need to enable the LPC
firmware cycles bit as we do not intend to upstream any mach-aspeed
hacks.

There was no existing binding document for the LPC host interface
controller, so I wrote one that includes the required clock description.

Joel Stanley (3):
  dt-bindings: aspeed-lpc: Document LPC Host Interface Controller
  misc: aspeed-lpc: Request and enable LPC clock
  misc: aspeed-lpc-ctrl: Enable FWH and A2H bridge cycles

 .../devicetree/bindings/mfd/aspeed-lpc.txt         | 41 ++++++++++++++++++++
 drivers/misc/aspeed-lpc-ctrl.c                     | 44 +++++++++++++++++++---
 2 files changed, 80 insertions(+), 5 deletions(-)

-- 
2.15.1
