From: Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH 2/5] gpio: Cygnus: add GPIO driver
Date: Sun, 7 Dec 2014 17:59:57 -0800
Message-ID: <5485061D.1060302@broadcom.com>
References: <Ray Jui <rjui@broadcom.com>	 <1417826408-1600-1-git-send-email-rjui@broadcom.com>	 <1417826408-1600-3-git-send-email-rjui@broadcom.com> <1417829282.31745.3.camel@perches.com> <5482668F.1040907@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <5482668F.1040907@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 12/5/2014 6:14 PM, Ray Jui wrote:
>>> +static struct irq_chip bcm_cygnus_gpio_irq_chip =3D {
>>> +    .name =3D "bcm-cygnus-gpio",
>>> +    .irq_ack =3D bcm_cygnus_gpio_irq_ack,
>>> +    .irq_mask =3D bcm_cygnus_gpio_irq_mask,
>>> +    .irq_unmask =3D bcm_cygnus_gpio_irq_unmask,
>>> +    .irq_set_type =3D bcm_cygnus_gpio_irq_set_type,
>>> +};
>>
>> const?
>>
>
>
> Sure, will add const to bcm_cygnus_gpio_irq_chip
>
>>> +static struct irq_domain_ops bcm_cygnus_irq_ops =3D {
>>> +    .map =3D bcm_cygnus_gpio_irq_map,
>>> +    .unmap =3D bcm_cygnus_gpio_irq_unmap,
>>> +    .xlate =3D irq_domain_xlate_twocell,
>>> +};
>>
>> const here too?
>>
>
> Yes, will make bcm_cygnus_irq_ops const.
>
Actually, I cannot make them const here. Note they are passed into othe=
r=20
APIs which can potentially modifies their values internally.

drivers/gpio/gpio-bcm-cygnus.c: In function =91bcm_cygnus_gpio_irq_map=92=
:
drivers/gpio/gpio-bcm-cygnus.c:430:4: warning: passing argument 2 of=20
=91irq_set_chip_and_handler=92 discards =91const=92 qualifier from poin=
ter=20
target type [enabled by default]
     handle_simple_irq);
     ^
In file included from drivers/gpio/gpio-bcm-cygnus.c:17:0:
include/linux/irq.h:461:20: note: expected =91struct irq_chip *=92 but=20
argument is of type =91const struct irq_chip *=92
  static inline void irq_set_chip_and_handler(unsigned int irq, struct=20
irq_chip *chip,
                     ^
drivers/gpio/gpio-bcm-cygnus.c: In function =91bcm_cygnus_gpio_probe=92=
:
drivers/gpio/gpio-bcm-cygnus.c:679:5: warning: passing argument 2 of=20
=91irq_set_chip_and_handler=92 discards =91const=92 qualifier from poin=
ter=20
target type [enabled by default]
      handle_simple_irq);
      ^
In file included from drivers/gpio/gpio-bcm-cygnus.c:17:0:
include/linux/irq.h:461:20: note: expected =91struct irq_chip *=92 but=20
argument is of type =91const struct irq_chip *=92
  static inline void irq_set_chip_and_handler(unsigned int irq, struct=20
irq_chip *chip,
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
