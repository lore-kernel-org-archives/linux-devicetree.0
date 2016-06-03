From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] usb: ohci-at91: Forcibly suspend ports while USB
 suspend
Date: Fri, 3 Jun 2016 15:32:11 +0200
Message-ID: <575186DB.6030405@atmel.com>
References: <1464755400-6825-1-git-send-email-wenyou.yang@atmel.com>
 <1464755400-6825-2-git-send-email-wenyou.yang@atmel.com>
 <20160603015409.GA18051@rob-hp-laptop>
 <B256D81BAE5131468A838E5D7A24364101650B1491@penmbx01>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <B256D81BAE5131468A838E5D7A24364101650B1491@penmbx01>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Yang, Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 03/06/2016 11:22, Yang, Wenyou a =A8=A6crit :
>> -----Original Message-----
>> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
>> Sent: 2016=C4=EA6=D4=C23=C8=D5 9:54
>> To: Yang, Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>> Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>; Greg Kroah-Hartman
>> <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>; Ferre, Nicolas <Nicolas.FERRE-AIFe0yeh4nA@public.gmane.org=
m>;
>> Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>; Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Ia=
n
>> Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>; Kumar Gala <galak@codeauro=
ra.org>;
>> Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>; linux-
>> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
>> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Subject: Re: [PATCH v2 1/2] usb: ohci-at91: Forcibly suspend ports w=
hile USB
>> suspend
>>
>> On Wed, Jun 01, 2016 at 12:29:59PM +0800, Wenyou Yang wrote:
>>> In order to the save power consumption, as a workaround, suspend
>>> forcibly the USB PORTA/B/C via set the SUSPEND_A/B/C bits of OHCI
>>> Interrupt Configuration Register in the SFRs while OHCI USB suspend=
=2E
>>>
>>> This suspend operation must be done before the USB clock is disable=
d,
>>> resume after the USB clock is enabled.
>>>
>>> Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>>> ---
>>>
>>> Changes in v2:
>>>  - Add compatible to support forcibly suspend the ports.
>>>  - Add soc/at91/at91_sfr.h to accommodate the defines.
>>>  - Add error checking for .sfr_regmap.
>>>  - Remove unnecessary regmap_read() statement.
>>>
>>>  .../devicetree/bindings/usb/atmel-usb.txt          |  5 +-
>>>  drivers/usb/host/ohci-at91.c                       | 80 ++++++++++=
+++++++++++-
>>>  include/soc/at91/at91_sfr.h                        | 29 ++++++++
>>>  3 files changed, 111 insertions(+), 3 deletions(-)  create mode
>>> 100644 include/soc/at91/at91_sfr.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt
>>> b/Documentation/devicetree/bindings/usb/atmel-usb.txt
>>> index 5883b73..3e3e58a 100644
>>> --- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
>>> +++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
>>> @@ -3,8 +3,9 @@ Atmel SOC USB controllers  OHCI
>>>
>>>  Required properties:
>>> - - compatible: Should be "atmel,at91rm9200-ohci" for USB controlle=
rs
>>> -   used in host mode.
>>> + - compatible: Should be one of the following
>>> +	       "atmel,at91rm9200-ohci" for USB controllers used in host m=
ode.
>>> +	       "atmel,sama5d2-ohci" for SAMA5D2 which can force to suspen=
d.
>>
>> That may be why you need this now, but that is irrelevant to having =
a chip specific
>> compatible string.
>=20
> Maybe a property is better.

It seems that it's not an issue to the binding that Rob is talking abou=
t
but the description that you used: "for SAMA5D2 which can force
suspend". Don't modify it to use a property for this: a compatible stin=
g
makes a lot of sense.

So just listing the new compatible string is enough. If the "force
suspend" is not needed anymore in next product, we will come back to th=
e
"atmel,at91rm9200-ohci" compatible string or add a new one if needed...

bye,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
