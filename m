From: delicious quinoa <delicious.quinoa@gmail.com>
Subject: Re: [PATCH v11] gpio: add a driver for the Synopsys DesignWare APB
 GPIO block
Date: Mon, 24 Feb 2014 08:20:53 -0600
Message-ID: <CANk1AXR+JhJ9Q=yqpAJA4efLkaJ28jBMqsrLiYBrE+xV0f1G0g@mail.gmail.com>
References: <1391724370-30589-1-git-send-email-delicious.quinoa@gmail.com>
	<CACRpkdYiC=nzVG4_nQuRVSNP9TB4W=3VL9QhBQjmqvLvmP6McA@mail.gmail.com>
	<CANk1AXTnnhSnt_ayJYwDHRth44CWAwmxVA5kkbvnjqW39ssLQg@mail.gmail.com>
	<CACRpkdbkcuByEh_pasBoAQpXwa479iTuWLPPQW1TLRapbqjE7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbkcuByEh_pasBoAQpXwa479iTuWLPPQW1TLRapbqjE7Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jamie Iles <jamie@jamieiles.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Alan Tull <atull@altera.com>, Dinh Nguyen <dinguyen@altera.com>, Yves Vandervennet <rocket.yvanderv@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 24, 2014 at 6:20 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Feb 12, 2014 at 5:17 PM, delicious quinoa
> <delicious.quinoa@gmail.com> wrote:
>
>> I am wondering about the change in usage of
>> irq_find_mapping/irq_create_mapping.  It seems like all the GPIO
>> drivers that use irq domains do it the way I was doing it
>
> It is a well known problems that the kernel contain many bad
> examples. When in doubt ask for a good example to be provided.
>
> In gpio-omap.c you will find that this is done in the probe()
> path.
>
>> (that's
>> where I got the idea in the first place): irq_create_mapping is used
>> in the to_irq() function.  I guess this is a general direction all the
>> other drivers will be encouraged to go in also?
>
> Yes. The reason is that it should be possible to reques an IRQ
> from an irqchip no matter whether the gpio_to_irq() function
> was called first, as the APIs are orthogonal.
>
> Yours,
> Linus Walleij

Hi Linus,

Thanks, I made these changes and can see them working for me.

The thing that is currently holding me up is that the DesignWare IP
can be configured to have one irq exiting for the many gpios on port A
or one gpio exiting for each gpio.  I am trying to figure out how to
support both cases with the simplest code.  Currently support works
for the one irq case.

Alan
