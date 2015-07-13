From: Florian Fainelli <fainelli-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: brcmstb-gpio: document properties
 for wakeup
Date: Mon, 13 Jul 2015 10:35:57 -0700
Message-ID: <55A3F6FD.1070006@broadcom.com>
References: <1434589243-502-1-git-send-email-gregory.0xf0@gmail.com>	<1434589243-502-3-git-send-email-gregory.0xf0@gmail.com> <CACRpkdY5YH7MwGxA_UFg1bzwojT6XouBErBm86PtL_8RCSej0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdY5YH7MwGxA_UFg1bzwojT6XouBErBm86PtL_8RCSej0Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 13/07/15 05:29, Linus Walleij wrote:
> On Thu, Jun 18, 2015 at 3:00 AM, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
>=20
>> Some brcmstb GPIO controllers can be used to wake from suspend, so u=
se
>> the de facto standard property 'wakeup-source' to mark the nodes of
>> controllers with that capability.
>>
>> Also document interrupts-extended, which will be used for wakeup
>> handling because the interrupt parent for the wake IRQ is different
>> from the regular IRQ.
>>
>> While we're at it, a few more fixes: We don't actually use the
>> "interrupt-names" property, so remove it from the listed optional
>> properties and from the examples.  And since we're modifying the
>> examples, also follow Brian's suggestions to:
>> - change #gpio-cells, #interrupt-cells, and brcm,gpio-bank-widths fr=
om
>>   hex to dec
>> - use phandles
>>
>> Reviewed-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> v3: Update per Brian's suggestions described in above message.
>=20
> I'm very uncertain regarding these interrupts-extended etc.

Gregory's additions to the binding are correct and comply with how the
'interrupts-extended' property is meant to be used. FYI, this is
required because most wake-up capable HW on brcmstb chips have N
interrupts feeding to a GIC, but their wake-up interrupt(s) feed to an
always-on interrupt controller. With the 'interrupts' +
'interrupt-parent' property, you can "cross" multiple interrupt domains=
=2E

The precedence and rules for interpreting the "legacy" interrupts
property vs. interrupts-extended is documented in the tree.

>=20
> Can someone who understands that ACK this?

Acked-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

>=20
> E.g. Grant Likely, Bj=C3=B6rn Helgaas, Rob Herring.
>=20
> Yours,
> Linus Walleij
>=20


--=20
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
