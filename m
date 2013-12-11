From: delicious quinoa <delicious.quinoa@gmail.com>
Subject: Re: [PATCH v9] gpio: add a driver for Synopsys DesignWare APB GPIO
Date: Wed, 11 Dec 2013 14:15:25 -0600
Message-ID: <CANk1AXS=CADN53aO5KVN3UorddJ0wZ2PTqwo2XmeRuxYe_DoLg@mail.gmail.com>
References: <1386364179-28650-1-git-send-email-delicious.quinoa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1386364179-28650-1-git-send-email-delicious.quinoa@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@stericsson.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jamie Iles <jamie@jamieiles.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, delicious quinoa <delicious.quinoa@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Alan Tull <atull@altera.com>, Dinh Nguyen <dinguyen@altera.com>, Yves Vandervennet <rocket.yvanderv@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 6, 2013 at 3:09 PM, Alan Tull <delicious.quinoa@gmail.com> wrote:
> From: Alan Tull <atull@altera.com>
>
> Hi Linus,
>
> If you don't have any further comments, can you take this patch?
>
> Alan

Basically, this is a driver that Jamie wrote and was upstreaming a few
years ago.  For some reason it never quite made it into the kernel.  I
picked it up, updated the interrupt support, posted it to the list and
went through some reviews with it.

This driver has been reviewed, I hope it can make it into the kernel.

Alan

>
> Jamie Iles (1):
>   gpio: add a driver for the Synopsys DesignWare APB GPIO block
>
>  .../devicetree/bindings/gpio/snps-dwapb-gpio.txt   |   59 +++
>  drivers/gpio/Kconfig                               |    9 +
>  drivers/gpio/Makefile                              |    1 +
>  drivers/gpio/gpio-dwapb.c                          |  415 ++++++++++++++++++++
>  4 files changed, 484 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
>  create mode 100644 drivers/gpio/gpio-dwapb.c
>
> --
> 1.7.9.5
>
>
