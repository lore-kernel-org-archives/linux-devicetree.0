From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 4/5] ARM: at91/dt: add AIC irq1 muxed peripheral id
 definitions
Date: Wed, 14 Jan 2015 14:40:42 +0100
Message-ID: <54B671DA.7020009@atmel.com>
References: <1421174781-4340-1-git-send-email-boris.brezillon@free-electrons.com>	<1421174781-4340-5-git-send-email-boris.brezillon@free-electrons.com>	<54B66D6B.9050205@atmel.com> <20150114143448.09d362b8@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150114143448.09d362b8@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 14/01/2015 14:34, Boris Brezillon a =C3=A9crit :
> On Wed, 14 Jan 2015 14:21:47 +0100
> Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:
>=20
>> Le 13/01/2015 19:46, Boris Brezillon a =C3=A9crit :
>>> These ids will be used to define irqs multiplexed on the first irq =
line.
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>> ---
>>>  .../dt-bindings/interrupt-controller/atmel-aic.h   | 22 ++++++++++=
++++++++++++
>>>  1 file changed, 22 insertions(+)
>>>  create mode 100644 include/dt-bindings/interrupt-controller/atmel-=
aic.h
>>>
>>> diff --git a/include/dt-bindings/interrupt-controller/atmel-aic.h b=
/include/dt-bindings/interrupt-controller/atmel-aic.h
>>> new file mode 100644
>>> index 0000000..e14a94f
>>> --- /dev/null
>>> +++ b/include/dt-bindings/interrupt-controller/atmel-aic.h
>>> @@ -0,0 +1,22 @@
>>> +#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_ARM_GIC_H
>>> +#define _DT_BINDINGS_INTERRUPT_CONTROLLER_ARM_GIC_H
>>
>> Nit.: why ARM_GIC?
>=20
> Because I copied it from the arm-gic.h header and forgot to rename
> those macros :-).
> I'll fix that.
>=20
>>
>>> +#include <dt-bindings/interrupt-controller/irq.h>
>>> +
>>> +#define AIC_IRQ1_PMC		0
>>> +#define AIC_IRQ1_ST		1
>>> +#define AIC_IRQ1_PIT		1
>>> +#define AIC_IRQ1_DBGU		2
>>> +#define AIC_IRQ1_RTC		3
>>> +#define AIC_IRQ1_RTT		4
>>> +#define AIC_IRQ1_WATCHDOG	5
>>> +#define AIC_IRQ1_MC		6
>>> +#define AIC_IRQ1_SDRAMC		6
>>> +#define AIC_IRQ1_DDRSDRC	6
>>> +#define AIC_IRQ1_RSTC		7
>>> +#define AIC_IRQ1_PMERRLOC	8
>>> +#define AIC_IRQ1_PMECC		9
>=20
> Following up the discussion we had privately regarding these
> macros (whether we really need them or not), maybe adding a comment
> above the irqs property would be enough:
>=20
> 	dumb_irq1_demux: dumb-irq-demux@1 {
> 		compatible =3D "irqchip-dumb-demux";
> 		interrupt-controller;
> 		#interrupt-cells =3D <1>;
> 		interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH 7>;
> 		/*
> 		 * Interrupt lines:
> 		 * 0: PMC
> 		 * 1: PIT
> 		 * 2: DBGU
> 		 * 3: RTT
> 		 * 4: WATCHDOG
> 		 * 5: RSTC
> 		 */
> 		irqs =3D <0x3f>;
> 	};

Well, I tend to prefer when no additional macros are defined in DT for
no real added value. So, this comment seems to be enough... I would vot=
e
for this solution ;-)

Thanks, bye,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
