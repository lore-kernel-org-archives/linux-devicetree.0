From: Alan Tull <delicious.quinoa@gmail.com>
Subject: [PATCH v8] add a driver for the Synopsys DesignWare APB GPIO block
Date: Tue, 3 Dec 2013 10:41:15 -0600
Message-ID: <1386088876-29205-1-git-send-email-delicious.quinoa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@stericsson.com>, linux-doc@vger.kernel.org, Jamie Iles <jamie@jamieiles.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, delicious quinoa <delicious.quinoa@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Alan Tull <atull@altera.com>, Dinh Nguyen <dinguyen@altera.com>, Yves Vandervennet <rocket.yvanderv@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@altera.com>

Minor cleanup from v7 as noted below.

Hi Jamie,

I changed the interrupt implementation of your driver to work with the
current kernel (wouldn't build othewise).  Could you please test and
let me know if this will work for you?

Alan

Jamie Iles (1):
  gpio: add a driver for the Synopsys DesignWare APB GPIO block

 .../devicetree/bindings/gpio/snps-dwapb-gpio.txt   |   57 +++
 drivers/gpio/Kconfig                               |    9 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-dwapb.c                          |  426 ++++++++++++++++++++
 4 files changed, 493 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
 create mode 100644 drivers/gpio/gpio-dwapb.c

-- 
1.7.9.5
