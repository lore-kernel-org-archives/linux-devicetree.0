From: Rabin Vincent <rabin@rab.in>
Subject: Re: [PATCH] gpio: add ETRAXFS GPIO driver
Date: Fri, 5 Jun 2015 21:36:31 +0200
Message-ID: <20150605193631.GA28794@debian>
References: <1431728843-21583-1-git-send-email-rabin@rab.in>
 <CACRpkdZcbvrcOMJavU5TacR1nD5+ot2FdC5zxBc=8XdhZN0SqQ@mail.gmail.com>
 <20150521184855.GA6159@debian>
 <CACRpkdabE5ztEDT8797iOO3fwDLgJOYyQp_cfjk7iDEAE+Uh8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdabE5ztEDT8797iOO3fwDLgJOYyQp_cfjk7iDEAE+Uh8A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 01, 2015 at 03:45:35PM +0200, Linus Walleij wrote:
> There is also the code such as of_gpio_simple_xlate()
> that can't be reused for this, so thus it needs its own xlate
> function and adds some complexity to the code.
> But the convention in of_gpio_simple_xlate() is that
> cell 0 is offset, and cell 1 is flags, so what about
> moving the bank number to the last argument so you
> can still use of_gpio_simple_xlate()?
> 
> Like so:
> gpios = <&gio 5 0 0xD>, <&gio 6 0 0xD>;
> 
> I.e. extra cells go at the end. I can see you have a check
> hack to see it is hitting a valid GPIO chip by using the label,
> but that doesn't seem totally necessary.

That code is quite necessary, because that is what makes us bind to the
correct gpio chip.  The wrong gpio chips' xlate() return an error code
and the code in of_gpiochip_find_and_xlate() makes sure we look through
the rest of the chips in the OF node until we find the right one.

But the xlate function can change the order as you suggest and use
of_gpio_simple_xlate() as a helper.  I'll make it do that.
