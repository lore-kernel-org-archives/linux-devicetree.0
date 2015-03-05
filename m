From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8 2/2] drivers/gpio: Altera soft IP GPIO driver
Date: Thu, 5 Mar 2015 10:37:19 +0100
Message-ID: <CACRpkdZPDHwmJaoSBV01wjXC63W90Qk3om8vqkN8RV7E-4hhhQ@mail.gmail.com>
References: <1419409345-8297-1-git-send-email-thloh@altera.com>
	<1419409345-8297-3-git-send-email-thloh@altera.com>
	<CACRpkdZ1kTjq979RbxzUSsb88v8XKjXRhRCpPkgS2wHrCcPGkg@mail.gmail.com>
	<1423191299.1110.17.camel@ubuntu>
	<1423642806.7842.2.camel@ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423642806.7842.2.camel@ubuntu>
Sender: linux-kernel-owner@vger.kernel.org
To: Tien Hock Loh <thloh@altera.com>
Cc: Tien Hock Loh <thloh.linux@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Antti Palosaari <crope@iki.fi>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Dinh Nguyen <dinguyen@altera.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 11, 2015 at 9:20 AM, Tien Hock Loh <thloh@altera.com> wrote:

>> > These calls seem like pretty vanilla generic GPIO functions.
>> > Use GENERIC_GPIO with bgpio_init() and override the default
>> > functions only when really needed.
>> >
>> > See e.g. drivers/gpio/gpio-74xx-mmio.c
>> >
>> OK, I'll update this.
>
> I just recall that I couldn't use bgpio because the number of gpio pins
> is configurable and may not be multiple of 8, thus I'll not be updating
> this to use bgpio.

It doesn't matter. ngpio will be respected by gpio_request() so you
will not be able to request any of the GPIOs above the lower bits
anyway.

Yours,
Linus Walleij
