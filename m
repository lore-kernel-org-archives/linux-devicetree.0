Return-Path: <SRS0=oCC0=MH=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 0/3] Add GPIO brownout detection support
Date: Tue, 25 Sep 2018 11:42:27 +0200
Message-Id: <20180925094230.32679-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: dmitry.torokhov@gmail.com, broonie@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-input@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi,

this small series adds a generic gpio-based brownout detection driver to
inform the userspace that something went wrong.

Additional there is a optional support to release devices from their
drivers, because there are board power designs which cut of external
devices supply immediately and keep the host (SoC) alive for a few
seconds to switch into a safe state. Due to the hard power cut some
external devices throw interrupts and depending of the amount of
external devices these interrupts will flood the host. The driver
unloads all specified devices from their drivers so the interrupts are
ignored. At the moment only spi and i2c devices are supported.

I've tested the driver on a customer arm based board, but other testers
are welcome. Maybe there are problems unloading device drivers which have a
incorrect .remove() or devm_alloc() order. Then these drivers must be
fixed.

Regards,
Marco

Marco Felsch (3):
  spi: switch to SPDX license identifier
  spi: make OF helper available for others
  Input: add generic gpio brownout driver

 .../bindings/input/gpio-brownout.txt          |  36 ++++
 drivers/input/misc/Kconfig                    |  12 ++
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/gpio-brownout.c            | 166 ++++++++++++++++++
 drivers/spi/spi.c                             |  18 +-
 include/linux/spi/spi.h                       |  30 ++--
 6 files changed, 239 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/gpio-brownout.txt
 create mode 100644 drivers/input/misc/gpio-brownout.c

-- 
2.19.0
