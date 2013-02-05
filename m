From: Andreas Larsson <andreas@gaisler.com>
Subject: [PATCH 0/2] gpio: Fix gpio-generic bug and add driver for GRGPIO cores
Date: Tue,  5 Feb 2013 11:33:01 +0100
Message-ID: <1360060383-16880-1-git-send-email-andreas@gaisler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, software@gaisler.com
List-Id: devicetree@vger.kernel.org

The second patch is v2 of the earlier single GRGPIO patch

Andreas Larsson (2):
  gpio: gpio-generic: Fix bug in big endian bit conversion
  gpio: Add device driver for GRGPIO cores

 drivers/gpio/Kconfig        |    8 ++
 drivers/gpio/Makefile       |    1 +
 drivers/gpio/gpio-generic.c |    5 +-
 drivers/gpio/gpio-grgpio.c  |  244 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 257 insertions(+), 1 deletions(-)
 create mode 100644 drivers/gpio/gpio-grgpio.c
