From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 5/8] pinctrl: Add core support for Aspeed SoCs
Date: Tue, 30 Aug 2016 15:34:34 +0930
Message-ID: <CACPK8XfiygdXaDb0Z4V_+JjDvcrST-98qqZLe6r1p8-iMqTtMg@mail.gmail.com>
References: <20160819124414.24242-1-andrew@aj.id.au> <20160819124414.24242-6-andrew@aj.id.au>
 <CACRpkdaBuwqGPbfLK8bR5A4NSefifw8VqPyUbgtAtweqoEnD7g@mail.gmail.com> <1471919451.5707.89.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1471919451.5707.89.camel@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 23, 2016 at 12:00 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Mon, 2016-08-22 at 15:45 +0200, Linus Walleij wrote:
>> On Fri, Aug 19, 2016 at 2:44 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>> >
>> > +++ b/drivers/pinctrl/aspeed/Kconfig
>> > @@ -0,0 +1,8 @@
>> > +config PINCTRL_ASPEED
>> > +       bool
>> > +       depends on (ARCH_ASPEED || COMPILE_TEST) && OF
>> > +       select PINMUX
>> > +       select PINCONF
>> > +       select GENERIC_PINCONF
>> > +       select MFD_SYSCON
>> > +       select REGMAP_MMIO
>> Since this device is spawn from the syscon, should it not be
>> "depends on MFD_SYSCON"?
>>
>> (No big deal, if you think this is right then go with it.)
>
> I think that's a fair point, I will look at rearranging it.

As discussed, lets go with Linus' suggestion.

>>
>> The expression core engine is still a complete mystery
>> for me, I will just trust you that it works as intended.
>
> Gah! However, thanks!

Does what it says on the box. Good work!

Reviewed-by: Joel Stanley <joel@jms.id.au>
