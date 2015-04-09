From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: Question about shared interrupts in devicetree
Date: Thu, 9 Apr 2015 09:37:52 +0200
Message-ID: <CAMuHMdXpByUO4S_Qdhvbm8PF8hfGTtqr7aA9mmRE5Dk6LrZkJw@mail.gmail.com>
References: <2039290448.1160624.1428183613109.JavaMail.open-xchange@oxbaltgw03.schlund.de>
	<20150407112928.GA3812@leverpostej>
	<2146749411.2111.1428426398346.JavaMail.open-xchange@oxbaltgw03.schlund.de>
	<CAMuHMdUaQTotvzRiGczyVxfeu34UNLMmwU=aVGTP6rDSHUK45Q@mail.gmail.com>
	<55262935.9080005@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55262935.9080005-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, kernelnewbies <kernelnewbies-7JyXY6prKcjpASu1u0TL5ti2O/JbrIOy@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex-ynQEQJNshbs@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stefan,

On Thu, Apr 9, 2015 at 9:24 AM, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> =
wrote:
> Am 08.04.2015 um 21:20 schrieb Geert Uytterhoeven:
>> On Tue, Apr 7, 2015 at 7:06 PM, Stefan Wahren <stefan.wahren-TePAdz2rOow@public.gmane.org=
m> wrote:
>>> [...]
>>>
>>> thanks for the good explanation. After looking into the reference m=
anual [1] of
>>> the i.MX28 i still can't decide if the subsystem generate the inter=
rupts as a
>>> whole or
>>> as a logical group. I only found this para in chapter 11.11:
>>>
>>>     The VDDA_BO_IRQ, VDDD_BO_IRQ, VDDIO_BO_IRQ, and BATT_BO_IRQ eac=
h
>>>     have their own interrupt line back to the interrupt collector.
>>>     However, the remaining five interrupts=E2=80=94VDD5V_GT_VDDIO_I=
RQ, DC_OK_IRQ,
>>>     VBUSVALID_IRQ, LINREG_OK_IRQ and PSWITCH_IRQ=E2=80=94all share =
a single
>>>     interrupt line. In this case, software must read the interrupt =
status
>>>     bits to discover which event caused the interrupt.
>>>
>>> In my case DC_OK_IRQ and PSWITCH_IRQ are relevant.
>>>
>>> Maybe someone else has a idea?
>> Perhaps you can implement an interrupt-controller to handle the mult=
iplexing
>> of the 5 remaining interrupts?
>
> Could you please explain the benefit / reason of this approach?

Since you have different logical modules in the subsystem, this allows =
to model
the subsystem as separate modules and a separate interrupt controller, =
and
have separate drivers for all modules.

Look at da9063 for an example (there are more according to "git grep ir=
q_chip
-- drivers/mfd", but not all of them may have DT bindings).

>> Can they be disabled/enabled individually?
>
> Yes. What are the consequences?

If they cannot be disabled/enabled individually, it's more difficult to=
 handle
by implementing an interrupt-controller.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
