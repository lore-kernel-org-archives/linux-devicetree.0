From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: Tree for Jun 27 (pinctrl && !CONFIG_OF)
Date: Mon, 4 Jul 2016 11:46:55 +0200
Message-ID: <CACRpkdb2a=7QhW5A7yucC-DPo4NmNNcd3NcOznVtk0+8XMtbHA@mail.gmail.com>
References: <20160627163939.20e454d5@canb.auug.org.au> <57716D3D.4070302@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <57716D3D.4070302@infradead.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 27, 2016 at 8:15 PM, Randy Dunlap <rdunlap@infradead.org> wrote:

> On 06/26/16 23:39, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20160624:
>>
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

I merged it I think, Alex made a long series enabling compile
testing and I started to cherry-pick the first commits to let
them trickle in.

I was worried about it because some of the patches caused
severe build problems on some archs.

It's a  bit tricky to know what to do here: we want compile
coverage to get proper testing, when we turn it on we get regressions,
so trying to improve things make things break and it becomes a
vicious circle of trouble. I don't know what the biggest pain is ...

I don't really see the conclusion of this discussion thread, whether
I should revert the patch or not? For fixes or next?

Yours,
Linus Walleij
