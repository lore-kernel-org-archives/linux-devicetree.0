From: Alan Tull <delicious.quinoa@gmail.com>
Subject: [PATCH 0/1] gpio: add a driver for the Synopsys DesignWare APB GPIO
Date: Wed, 6 Nov 2013 16:49:41 -0600
Message-ID: <1383778182-16941-1-git-send-email-delicious.quinoa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@stericsson.com>, linux-doc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jamie Iles <jamie@jamieiles.com>, delicious quinoa <delicious.quinoa@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Alan Tull <atull@altera.com>, Dinh Nguyen <dinguyen@altera.com>, Yves Vandervennet <rocket.yvanderv@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@altera.com>

Version 6 - Implementing Sebastian's suggestions.

To make reviewing more to-the-point, I squashed all three commits
into one.  I hope that expedites things rather than getting in the
way, we will see.

I am currently leaving nr-gpios as a required property because I saw a
mailing list comment that that register to read the IP configuration is
not available on earlier versions of the IP.

s/bank/port/ because the register names use the word 'port'

s/nr-gpio/nr-gpios/

I removed previous acked-by's and sign-off-by's as I felt that
it would be weird and sneaky to make lots of changes and keep
them, although it feels like a step backwards.

I didn't want to mess with the interrupt enable/mask stuff so I
left those as separate.

Alan Tull


Jamie Iles (1):
  gpio: add a driver for the Synopsys DesignWare APB GPIO block

 .../devicetree/bindings/gpio/snps-dwapb-gpio.txt   |   57 +++
 drivers/gpio/Kconfig                               |    9 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-dwapb.c                          |  458 ++++++++++++++++++++
 4 files changed, 525 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
 create mode 100644 drivers/gpio/gpio-dwapb.c

-- 
1.7.9.5


