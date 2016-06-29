From: Alexander Stein <alexanders83@web.de>
Subject: Re: Re: linux-next: Tree for Jun 27 (pinctrl && !CONFIG_OF)
Date: Wed, 29 Jun 2016 07:54:29 +0200
Message-ID: <7003426.R6hER1qrYx@ws-stein>
References: <20160627163939.20e454d5@canb.auug.org.au> <2044946.aGLaEK2W6I@ws-stein> <3990550.tEk9cGVQPW@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <3990550.tEk9cGVQPW@wuerfel>
Sender: linux-gpio-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, "Linus Walleij (linus.walleij@linaro.org)" <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 28 June 2016, 10:37:52 wrote Arnd Bergmann:
> > > I think the commit should just be reverted, it clearly breaks
> > > stuff, and whatever needs it can be fixed in a better way.
> > 
> > Why not depend PINCTRL_IPROC_GPIO on CONFIG_OF as Randy stated 
> > pinconf_generic_dt_node_to_map_pin and friends are only present if 
CONFIG_OF 
> > is enabled. Depending on OF_GPIO only is enough under the assumption a) 
you 
> > made below.
> > Also what about providing dummy implementation for those missing function 
in 
> > case CONFIG_OF is disabled, my preference as more code can be compile 
tested.
> >
> > > Specifically, we have three ways that the OF_GPIO symbol
> > > is used:
> > > 
> > > a) it is implicitly enabled when both GPIOLIB and OF are turned on
> > 
> > or if COMPILE_TEST is enabled
> > 
> > I think a problem in this and possibly other cases is that COMPILE_TEST 
> > loosens the Kconfig dependencies to some degree. How to proceed? Allow 
compile 
> > testing drivers only if some optional settings are enabled?
> 
> I think we can start by reverting your patch: for compile-testing we can
> always enable CONFIG_OF these days, which will also turn on OF_GPIO.

My intention was to compile test (device tree) drivers also without CONFIG_OF 
which is disabled by defconfig default on arch/x86/configs/*

> Compile-testing drivers that need OF_GPIO while OF is disabled makes
> no sense to me, it's not a configuration that anybody can ever use
> and it adds no build coverage.

That seems sensible. If we can agree that anyone who wants to compile test 
drivers has to enable CONFIG_OF even it is not needed for the current 
configuration.

Best regards,
Alexander
