From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH 0/3] pinctrl: sunxi: Add DT-based generic pinctrl driver
Date: Fri, 24 Nov 2017 11:28:36 +0100
Message-ID: <CACRpkdYFoUmGJYdKz0t9gsrkK=u8-oJjaRBXtNYHaUt9kSa3_g@mail.gmail.com>
References: <20171113012523.2328-1-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171113012523.2328-1-andre.przywara@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-gpio@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Icenowy Zheng <icenowy@aosc.xyz>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 13, 2017 at 2:25 AM, Andre Przywara <andre.przywara@arm.com> wrote:

> so far the pinctrl driver for supporting a particular Allwinner SoC requires
> a hardcoded table in the kernel code.
(...)
> This series here moves the data encoded in the table so far into the DT itself,
> removing the need for a hardcoded table in the kernel.
(...)

The DT maintainers have been pretty clear on that they don't like
using the the DT as a generic fit-all information dump. They
prefer to look up hardware data from per-soc compatible strings.

I have been sceptic about it too, on the grounds that I think it
make configuration and multiplatform kernels easy, while making
debugging and reading code+device tree hard, also affecting
maintenance cost.

I'd like to have Maxime's buy-in before we progress and also some
discussion on these themes in general.

> The approach taken here is to parse the DT and generate the table with
> the help of additional properties, then hand this table over to the existing
> driver. This is covered by three basic extensions to the DT binding:

I adressed this in the bindings patch.

> The benefit of this series is two-fold:
> - Future SoCs don't need an in-kernel table anymore. They can describe
>   everything in the DT,

It can be debated whether that is really a good thing or actually
a bad thing for the reasons stated above.

Also an additional bad thing is inconsistency between different
SoCs.

What we have in the kernel for all-DT is pinctrl-single.c.

This exists for the case where there is exactly one register per
pin and all you have is strange macro files from the ASIC people
that noone understands. OMAP and HiSilicon is using this.
It's a compromise, I'm not super-happy with that driver at all times
but it is for a very strongly specified case.

Would it be possible for you guys to simply use/embrace/extend
pinctrl-single.c if you want to go this route?

Any higher order of complexity than "one register per pin" I think
is better handled by open coding it than trying to push things into
the device tree, because of readability, debuggability and maintenance
issues.

Yours,
Linus Walleij
