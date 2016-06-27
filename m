From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: Tree for Jun 27 (pinctrl && !CONFIG_OF)
Date: Mon, 27 Jun 2016 23:36:29 +0200
Message-ID: <735717690.oeI6DkomRc@wuerfel>
References: <20160627163939.20e454d5@canb.auug.org.au> <57716D3D.4070302@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <57716D3D.4070302@infradead.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, "Linus Walleij (linus.walleij@linaro.org)" <linus.walleij@linaro.org>, Alexander Stein <alexanders83@web.de>
List-Id: devicetree@vger.kernel.org

On Monday, June 27, 2016 11:15:25 AM CEST Randy Dunlap wrote:
> On 06/26/16 23:39, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20160624:
> > 
> 
> on i386, when CONFIG_OF is not enabled ...
> but OF_GPIO is enabled due to this in drivers/gpio/Kconfig:
> 
> config OF_GPIO
>         def_bool y
>         depends on OF || COMPILE_TEST
> 
> (above from commit 1e4a80640338924b9f9fd7a121ac31d08134410a
> from Alexander Stein <alexanders83@web.de>)
> 
> 
> ../drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:381:20: error: 'pinconf_generic_dt_node_to_map_pin' undeclared here (not in a function)
> ../drivers/pinctrl/bcm/pinctrl-cygnus-mux.c:739:20: error: 'pinconf_generic_dt_node_to_map_group' undeclared here (not in a function)
> ../drivers/pinctrl/bcm/pinctrl-nsp-gpio.c:365:20: error: 'pinconf_generic_dt_node_to_map_pin' undeclared here (not in a function)
> 
> because that function is only present when CONFIG_OF is enabled.
> 
> 
> Also, why does that commit (1e4a80640338924b9f9fd7a121ac31d08134410a)
> not have any other S-O-B lines in it?  like whoever merged it?

(adding Linus Walleij and Alexander Stein to Cc)

Unfortunately, the changelog also doesn't say what triggered that
change. I guess there was a driver that did 'select OF_GPIO'
and had a dependency on COMPILE_TEST, though I don't see any
driver doing that in linux-next.

I think the commit should just be reverted, it clearly breaks
stuff, and whatever needs it can be fixed in a better way.

Specifically, we have three ways that the OF_GPIO symbol 
is used:

a) it is implicitly enabled when both GPIOLIB and OF are turned on
b) some drivers 'depends on OF_GPIO'
c) some other drivers 'select OF_GPIO'

The combination of b) and c) can easily lead to circular dependencies,
and is also confusing. It would be better to change all of those
to 'depends on'.

	Arnd
