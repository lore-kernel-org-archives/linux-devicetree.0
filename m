From: Rabin Vincent <rabin@rab.in>
Subject: Re: [PATCH] gpio: add ETRAXFS GPIO driver
Date: Thu, 21 May 2015 21:09:33 +0200
Message-ID: <20150521190933.GB6159@debian>
References: <1431728843-21583-1-git-send-email-rabin@rab.in>
 <1431784767.2341.28.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1431784767.2341.28.camel@x220>
Sender: linux-gpio-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, May 16, 2015 at 03:59:27PM +0200, Paul Bolle wrote:
> On Sat, 2015-05-16 at 00:27 +0200, Rabin Vincent wrote:
> > +obj-$(CONFIG_GPIO_ETRAXFS)	+= gpio-etraxfs.o
> 
> GPIO_ETRAXFS is a bool symbol, so gpio-etraxfs.o can only be built-in,
> right?

Right.

> > --- /dev/null
> > +++ b/drivers/gpio/gpio-etraxfs.c
> 
> > +MODULE_DEVICE_TABLE(of, etraxfs_gpio_of_table);
> 
> > +module_platform_driver(etraxfs_gpio_driver);
> 
> (A patch was submitted that would allow built-in only code to use
> builtin_platform_driver(), see https://lkml.org/lkml/2015/5/10/125 .) 

Thanks, good to know.

> 
> > +MODULE_DESCRIPTION("ETRAX FS GPIO driver");
> > +MODULE_LICENSE("GPL");
> 
> But the code this patch adds contains a bit of module specific
> boilerplate. Was it perhaps your intention to make GPIO_ETRAXFS
> tristate?

No, the intention is to have it boolean as it is now.  I'll remove the
unnecessary lines.
