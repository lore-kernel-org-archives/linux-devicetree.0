From: delicious quinoa <delicious.quinoa@gmail.com>
Subject: Re: [PATCH v9] gpio: add a driver for Synopsys DesignWare APB GPIO
Date: Thu, 30 Jan 2014 13:40:04 -0600
Message-ID: <CANk1AXRxTGRMJMvXe4jgG2GfuELsDTNJnRLXK-MGe3gGxinmLA@mail.gmail.com>
References: <1386364179-28650-1-git-send-email-delicious.quinoa@gmail.com>
	<CANk1AXS=CADN53aO5KVN3UorddJ0wZ2PTqwo2XmeRuxYe_DoLg@mail.gmail.com>
	<20131212090838.GD25478@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131212090838.GD25478@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Linus Walleij <linus.walleij@stericsson.com>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jamie Iles <jamie@jamieiles.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Alan Tull <atull@altera.com>, Dinh Nguyen <dinguyen@altera.com>, Yves Vandervennet <rocket.yvanderv@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 12, 2013 at 3:08 AM, Steffen Trumtrar
<s.trumtrar@pengutronix.de> wrote:

> Second: The interrupt is registered as "GIC 37", which is a real interrupt on
> the Socfpga. I would expect it to be marked as "GPIO 2xx" (or something in that
> range). The interrupt from the gpiochip itself isn't registered at all ?!

Hi Stephen,

Did you export the gpio lines and set the edge in sysfs?  Because the
interrupts aren't allocated otherwise.

For instance:

root@socfpga_cyclone5:~# echo 195 > /sys/class/gpio/export
root@socfpga_cyclone5:~# echo rising > /sys/class/gpio/gpio195/edge

Now I can see a pretty nicely named interrupt in /proc/interrupts:

256:          0          0  gpio-dwapb  24  gpiolib

Alan Tull
Altera Corp
