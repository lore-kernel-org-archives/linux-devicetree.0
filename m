From: Alan Tull <delicious.quinoa@gmail.com>
Subject: [PATCH 0/3] gpio-dwapb plus irq domain
Date: Tue, 5 Nov 2013 10:55:49 -0600
Message-ID: <1383670552-17566-1-git-send-email-delicious.quinoa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@stericsson.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jamie Iles <jamie@jamieiles.com>, delicious quinoa <delicious.quinoa@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Alan Tull <atull@altera.com>, Dinh Nguyen <dinguyen@altera.com>, Yves Vandervennet <rocket.yvanderv@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@altera.com>

Resending Jamie's gpio-dwapb driver patches.  Adding a patch to get 
them building with current irq domain stuff.

Alan Tull


Alan Tull (1):
  use linear irq domain in gpio-dwapb

Jamie Iles (2):
  gpio: add a driver for the Synopsys DesignWare APB GPIO block
  gpio: dwapb: add support for GPIO interrupts

 .../devicetree/bindings/gpio/snps-dwapb-gpio.txt   |   57 +++
 drivers/gpio/Kconfig                               |    9 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-dwapb.c                          |  436 ++++++++++++++++++++
 4 files changed, 503 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
 create mode 100644 drivers/gpio/gpio-dwapb.c

-- 
1.7.9.5


