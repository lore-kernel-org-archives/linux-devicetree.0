From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Subject: [PATCH v2 0/4] add dual-boot support
Date: Mon, 26 Aug 2019 13:46:32 +0300
Message-ID: <20190826104636.19324-1-i.mikhaylov@yadro.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Alexander Amelkin <a.amelkin@yadro.com>, openbmc@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ivan Mikhaylov <i.mikhaylov@yadro.com>
List-Id: devicetree@vger.kernel.org

ASPEED SoCs support dual-boot feature for SPI Flash.
When strapped appropriately, the SoC starts wdt2 (/dev/watchdog1)
and if within a minute it is not disabled, it goes off and reboots
the SoC from an alternate SPI Flash chip by changing CS0 controls
to actually drive CS1 line.

When booted from alternate chip, in order to access the main chip
at CS0, the user must reset the appropriate bit in the watchdog
hardware. There is no interface that would allow to do that from
an embedded firmware startup script.

This commit implements support for that feature:

* Enable 'alt-boot' option for wdt2

* Enable secondary SPI flash chip

* Make it possible to get access to the primary SPI flash chip at CS0
  after booting from the alternate chip at CS1. A sysfs interface is added
  to provide an easy way for embedded firmware startup scripts to clear
  the chip select bit to gain access to the primary flash chip in order
  to allow for recovery of its contents.

Ivan Mikhaylov (4):
  vesnin: add wdt2 section with alt-boot option
  vesnin: add secondary SPI flash chip
  watchdog/aspeed: add support for dual boot
  dt-bindings/watchdog: Add access_cs0 option for alt-boot

 .../bindings/watchdog/aspeed-wdt.txt          |  7 +++
 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts   | 12 ++++
 drivers/watchdog/aspeed_wdt.c                 | 62 ++++++++++++++++++-
 3 files changed, 80 insertions(+), 1 deletion(-)

-- 
2.20.1
