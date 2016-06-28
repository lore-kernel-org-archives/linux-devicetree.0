From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: Tree for Jun 27 (pinctrl && !CONFIG_OF)
Date: Tue, 28 Jun 2016 10:37:52 +0200
Message-ID: <3990550.tEk9cGVQPW@wuerfel>
References: <20160627163939.20e454d5@canb.auug.org.au> <735717690.oeI6DkomRc@wuerfel> <2044946.aGLaEK2W6I@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <2044946.aGLaEK2W6I@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexander Stein <alexanders83@web.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, "Linus Walleij (linus.walleij@linaro.org)" <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tuesday, June 28, 2016 9:00:47 AM CEST Alexander Stein wrote:
> On Monday 27 June 2016 23:36:29, Arnd Bergmann wrote:
> > On Monday, June 27, 2016 11:15:25 AM CEST Randy Dunlap wrote:
> > > On 06/26/16 23:39, Stephen Rothwell wrote:
> > > > Hi all,
> > > 
> > > > Changes since 20160624:
> > > on i386, when CONFIG_OF is not enabled ...
> > > but OF_GPIO is enabled due to this in drivers/gpio/Kconfig:
> > > 
> > > config OF_GPIO
> > > 
> > >         def_bool y
> > >         depends on OF || COMPILE_TEST
> > > 
> > > (above from commit 1e4a80640338924b9f9fd7a121ac31d08134410a
> > > from Alexander Stein <alexanders83@web.de>)
> > > 
> > > 
> > > ../drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:381:20: error:
> > > 'pinconf_generic_dt_node_to_map_pin' undeclared here (not in a function)
> > > ../drivers/pinctrl/bcm/pinctrl-cygnus-mux.c:739:20: error:
> > > 'pinconf_generic_dt_node_to_map_group' undeclared here (not in a
> > > function) ../drivers/pinctrl/bcm/pinctrl-nsp-gpio.c:365:20: error:
> > > 'pinconf_generic_dt_node_to_map_pin' undeclared here (not in a function)
> > > 
> > > because that function is only present when CONFIG_OF is enabled.
> > > 
> > > 
> > > Also, why does that commit (1e4a80640338924b9f9fd7a121ac31d08134410a)
> > > not have any other S-O-B lines in it?  like whoever merged it?
> > 
> > (adding Linus Walleij and Alexander Stein to Cc)
> > 
> > Unfortunately, the changelog also doesn't say what triggered that
> > change. I guess there was a driver that did 'select OF_GPIO'
> > and had a dependency on COMPILE_TEST, though I don't see any
> > driver doing that in linux-next.
> 
> It was the first change of the changes done in my branch 
> https://github.com/AlexanderStein/linux/tree/gpio-compile-test
>  in order to compile test as much gpio drivers as possible. Yet, pinctrl 
> drivers were out of my scope.

I see

> > I think the commit should just be reverted, it clearly breaks
> > stuff, and whatever needs it can be fixed in a better way.
> 
> Why not depend PINCTRL_IPROC_GPIO on CONFIG_OF as Randy stated 
> pinconf_generic_dt_node_to_map_pin and friends are only present if CONFIG_OF 
> is enabled. Depending on OF_GPIO only is enough under the assumption a) you 
> made below.
> Also what about providing dummy implementation for those missing function in 
> case CONFIG_OF is disabled, my preference as more code can be compile tested.
>
> > Specifically, we have three ways that the OF_GPIO symbol
> > is used:
> > 
> > a) it is implicitly enabled when both GPIOLIB and OF are turned on
> 
> or if COMPILE_TEST is enabled
> 
> I think a problem in this and possibly other cases is that COMPILE_TEST 
> loosens the Kconfig dependencies to some degree. How to proceed? Allow compile 
> testing drivers only if some optional settings are enabled?

I think we can start by reverting your patch: for compile-testing we can
always enable CONFIG_OF these days, which will also turn on OF_GPIO.

Compile-testing drivers that need OF_GPIO while OF is disabled makes
no sense to me, it's not a configuration that anybody can ever use
and it adds no build coverage.

I think we should also drop all 'select OF_GPIO' statements, AFAICT
we have just proven that they are all redundant because they would
have otherwise broken things. This should be a separate cleanup patch.

	Arnd
