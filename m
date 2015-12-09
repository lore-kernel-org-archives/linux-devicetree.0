From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 0/5] mfd: tps65912: Driver rewrite with DT support
Date: Wed, 9 Dec 2015 13:35:00 +0100
Message-ID: <CACRpkdZU3RrXmPr1fDzCMumhQ8nWEf126iC1rDu=xiLFj7DU+A@mail.gmail.com>
References: <1447869580-10416-1-git-send-email-afd@ti.com>
	<20151124162624.GI807@x1>
	<20151204120240.GW26072@sirena.org.uk>
	<5665E4F7.1070707@ti.com>
	<20151208191657.GA5727@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20151208191657.GA5727@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: "Andrew F. Davis" <afd@ti.com>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 8, 2015 at 8:16 PM, Mark Brown <broonie@kernel.org> wrote:
> On Mon, Dec 07, 2015 at 01:58:47PM -0600, Andrew F. Davis wrote:
>
>> As all of this driver should be taken though the MFD tree how
>> can this gpiolib change be handled? If we have gpio.parent it
>> will not build on MFD, with gpio.dev it will fail to build when
>> the changes are merged from the gpio subsystem. As the change
>> has not been merged into linux-next as far a I can tell maybe
>> this should be taken as is, then when the gpiolib change is
>> made this can be changed with all the other drivers?
>
> Do a cross tree merge in one direction or the other between MFD and GPIO.

If Lee makes an immutable branch with this stuff on it I can
pull that in and put a fix on top of it (like I recently did with
the ASoC AC97 codec). I have "only" renamed
the .dev field of struct gpio_chip to .parent but I'm bombing
out another 150 or so patches today, ridding all GPIO drivers
in the kernel of container_of().

A bit painful but nothing to what tglx has gone through for
refactoring IRQ chips...

Yours,
Linus Walleij
