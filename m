From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 06/17] gpio: mvebu: add suspend/resume support
Date: Mon, 27 Oct 2014 14:27:16 +0900
Message-ID: <CAAVeFu+_UZkQHa38wvaBSmRZCWof6-J13eVYgrG6KS7yargsYA@mail.gmail.com>
References: <1414151970-6626-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1414151970-6626-7-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141024163051.GG4529@psi-dev26.jf.intel.com> <20141024204532.GA6436@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20141024204532.GA6436@lunn.ch>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: David Cohen <david.a.cohen@linux.intel.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 25, 2014 at 5:45 AM, Andrew Lunn <andrew@lunn.ch> wrote:
>> > +   switch (mvchip->soc_variant) {
>> > +   case MVEBU_GPIO_SOC_VARIANT_ORION:
>> > +           mvchip->edge_mask_regs[0] =
>> > +                   readl(mvchip->membase + GPIO_EDGE_MASK_OFF);
>> > +           mvchip->level_mask_regs[0] =
>> > +                   readl(mvchip->membase + GPIO_LEVEL_MASK_OFF);
>> > +           break;
>> > +   case MVEBU_GPIO_SOC_VARIANT_MV78200:
>> > +           for (i = 0; i < 2; i++) {
>> > +                   mvchip->edge_mask_regs[i] =
>> > +                           readl(mvchip->membase +
>> > +                                 GPIO_EDGE_MASK_MV78200_OFF(i));
>> > +                   mvchip->level_mask_regs[i] =
>> > +                           readl(mvchip->membase +
>> > +                                 GPIO_LEVEL_MASK_MV78200_OFF(i));
>> > +           }
>> > +           break;
>> > +   case MVEBU_GPIO_SOC_VARIANT_ARMADAXP:
>> > +           for (i = 0; i < 4; i++) {
>> > +                   mvchip->edge_mask_regs[i] =
>> > +                           readl(mvchip->membase +
>> > +                                 GPIO_EDGE_MASK_ARMADAXP_OFF(i));
>> > +                   mvchip->level_mask_regs[i] =
>> > +                           readl(mvchip->membase +
>> > +                                 GPIO_LEVEL_MASK_ARMADAXP_OFF(i));
>> > +           }
>> > +           break;
>> > +   default:
>> > +           BUG();
>>
>> Isn't it too severe? Is the platform going too unstable if driver
>> reaches this case?
>> I'd consider a WARN() instead.
>
> This is a common pattern in this driver. So i guess Thomas just
> cut/pasted the switch statement from _probe(), which also has the
> BUG().
>
> Given that _probe() should of thrown a BUG() in this situation, if it
> happens here, it means mvchip->soc_variant has been corrupted, and so
> bad things are happening. So a BUG() is maybe called for?

I agree that BUG() is adequate here. probe() should recognize the
exact same set of chips - if we reach this point this means that
either the data has been corrupted or we added support for a new chip
in probe() and forgot suspend/resume. In both cases the driver should
express its discontent.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
