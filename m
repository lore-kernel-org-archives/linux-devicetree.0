From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH 0/3] GPIO: Add driver for ThunderX and OCTEON-TX SoCs
Date: Tue,  3 Jan 2017 16:55:31 -0800
Message-ID: <1483491334-167095-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney@cavium.com>

The subject says it all.  The Cavium ThunderX and OCTEON-TX family of
SoCs have on-chip GPIO lines.  This patch set adds a driver for these.

David Daney (3):
  dt-bindings: gpio: Add binding documentation for gpio-thunderx
  gpio: Add gpio driver support for ThunderX and OCTEON-TX
  MAINTAINERS: Add entry for THUNDERX GPIO Driver.

 .../devicetree/bindings/gpio/gpio-thunderx.txt     |  33 ++
 MAINTAINERS                                        |   5 +
 drivers/gpio/Kconfig                               |   7 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-thunderx.c                       | 467 +++++++++++++++++++++
 5 files changed, 513 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
 create mode 100644 drivers/gpio/gpio-thunderx.c

-- 
1.8.3.1

