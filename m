From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] ARM: sunxi: gpio: Add Allwinner SoCs GPIO drivers
Date: Thu, 17 Jan 2013 12:06:33 +0100
Message-ID: <CACRpkdYK2GN_mhghhHHM+qqZ_tzy2ncu8Rm0Q7T2cagxaj7LUQ@mail.gmail.com>
References: <1357317909-12458-1-git-send-email-maxime.ripard@free-electrons.com>
	<1357317909-12458-2-git-send-email-maxime.ripard@free-electrons.com>
	<CACRpkda0yhVvCW9edWBi3XusfS4NaiWqKsoCfLpT9+X5iO-GXg@mail.gmail.com>
	<50F127A4.907@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <50F127A4.907@free-electrons.com>
Sender: linux-doc-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Jan 12, 2013 at 10:06 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

>> Use gpiochip_add_pin_range() from the GPIO driver.
>>
>> An example is provided in
>> drivers/pinctrl/pinctrl-coh901.c
>
> Ok, will do. But we need to find a way to share the pins arrays between
> the pinctrl and gpio drivers then.
>
> Maybe add a pinctrl-sunxi-pins.h file? or merge the pinctrl and gpio
> drivers?
>
> I'm kind of reluctant to merging the drivers into one single messy file,
> but if that's the way to go, fine.

Well, does it have to be that messy?

You can merge it different ways.

For example there is *no* need to have two different device driver
structs and two probe functions, right?

Just one device named pinctrl that has one state container and
one single dd and probe function. That makes everything sooo
much easier I think.

Just register both a pinctrl and GPIO interface (in that order).

See the recent pinctrl-abx500.c submission for an example on
how to do this.

Yours,
Linus Walleij
