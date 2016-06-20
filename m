From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] usb: ohci-at91: Forcibly suspend ports while USB
 suspend
Date: Mon, 20 Jun 2016 11:21:37 +0200
Message-ID: <5767B5A1.4040307@atmel.com>
References: <1465359311-14544-1-git-send-email-wenyou.yang@atmel.com>
 <1465359311-14544-2-git-send-email-wenyou.yang@atmel.com>
 <20160608202651.GA23604@rob-hp-laptop> <20160608203810.GF2466@piout.net>
 <B256D81BAE5131468A838E5D7A24364101650C3632@penmbx01>
 <20160617135448.GI5809@piout.net>
 <B256D81BAE5131468A838E5D7A24364101650C5253@penmbx01>
 <20160620080334.GL5809@piout.net>
 <B256D81BAE5131468A838E5D7A24364101650C547F@penmbx01>
 <20160620085205.GN5809@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160620085205.GN5809-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "Yang, Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 20/06/2016 10:52, Alexandre Belloni a =C3=A9crit :
> On 20/06/2016 at 08:46:02 +0000, Yang, Wenyou wrote :
>> Hi Alexandre & Nicolas,
>>
>>> -----Original Message-----
>>> From: Alexandre Belloni [mailto:alexandre.belloni-wi1+55ScJUtKEb57/3fJTGGXanvQGlWp@public.gmane.org=
m]
>>> Sent: 2016=E5=B9=B46=E6=9C=8820=E6=97=A5 16:04
>>> To: Yang, Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>>> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Alan Stern <stern-nwvwT67g6+6OqQnuSApjIw@public.gmane.org=
d.edu>;
>>> Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>; Ferre, Nicolas
>>> <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>; Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>; Mark Br=
own
>>> <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>;=
 Kumar
>>> Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
>>> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; l=
inux-
>>> usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Subject: Re: [PATCH v3 1/2] usb: ohci-at91: Forcibly suspend ports =
while USB
>>> suspend
>>>
>>> On 20/06/2016 at 03:16:35 +0000, Yang, Wenyou wrote :
>>>>> Sure, what I mean is that you can try to get the regmap for the S=
=46R in every
>>> case.
>>>>> Depending on whether you were able to get it, you can decide to c=
all
>>>>> ohci_at91_port_suspend/resume or not (just test for sfr_regmap !=3D=
 NULL).
>>>>
>>>> I don't think so. The SFR includes a lot of miscellaneous function=
s, more than
>>> this one.
>>>>
>>>
>>> I know but this is irrelevant to this discussion. If you need to us=
e the SFR from
>>> another driver you will simply get it from that other driver.
>>>
>>> I that case, you will try to get "atmel,sama5d2-sfr". It is only pr=
esent on sama5d2
>>> so you have enough information to know whether or not you can use i=
t to
>>> suspend/resume.
>>
>> I understand what your meaning :).
>> Use "atmel,sama5d2-sfr" compatible to distinguish whether forcibly s=
uspend USB port via SFR or not.
>>
>> I am not sure if it is a better solution.
>>
>=20
> It is definitively superior. There is only one lookup in the device t=
ree
> instead of two because whatever happens, you will have to get the SFR
> regmap and you don't need to add a compatible string for an IP that
> didn't change.
>=20
>> Nicolas, could you give your opinion?

I'll paraphrase Alexandre but this is what I understood:

Having the information in one place and not having to managed the
synchronization with 2 potential sources of information is clearly an
advantage of Alexandre's solution.

If the next SoC has the same workaround/feature, we will anyway have a
different SFR string to cling to...
So it won't change much and we won't have the confusion of having the
same sama5d2 compatible string on the OHCI side (same behavior) and
different compatible string on the SFR side (probably a new SFR for a
new SoC...).

If the next SoC doesn't have this workaround/feature... well, it's
simple, we don't look for the SFR, we don't use the bits, and we come
back to the situation that we've always experienced ; with the same
compatibility sting for OHCI as the IP never actually changed...

In conclusion: try Alexandre's solution and we'll certainly find that
it's actually simpler.

Bonus point: it voids the discussion on the OHCI compatible string
descriptions!

Bye,

>>> Alexandre Belloni, Free Electrons
>>> Embedded Linux, Kernel and Android engineering http://free-electron=
s.com
>>
>>
>> Best Regards,
>> Wenyou Yang
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
