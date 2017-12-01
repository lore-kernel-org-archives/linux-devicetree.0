From: Tony Lindgren <tony@atomide.com>
Subject: Re: [RFC PATCH 2/3] pinctrl: sunxi: introduce DT-based generic driver
Date: Fri, 1 Dec 2017 09:45:59 -0800
Message-ID: <20171201174559.GR28152@atomide.com>
References: <20171113012523.2328-1-andre.przywara@arm.com>
 <20171113012523.2328-3-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171113012523.2328-3-andre.przywara@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.xyz>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

* Andre Przywara <andre.przywara@arm.com> [171113 01:28]:
> This driver (shim) allows to fully describe an Allwinner pin controller
> and its GPIO ports in device tree nodes.
> It will read some newly introduced properties to build a table
> describing the pins and their routing. This table matches those that we
> have hardcoded for various SoCs in the kernel so far.
> After this table has been created, it will be handed over to the actual
> pinctrl driver, which registers it with the pinctrl subsystem.

Hmm so how come you're not using GENERIC_PINCTRL_GROUPS and
GENERIC_PINMUX_FUNCTIONS that we now have?

These together with the #pinctrl-cells property should make things
quite easy and should also simplify your binding hopefully.

Regards,

Tony
