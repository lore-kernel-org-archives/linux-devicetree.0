From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] usb: ohci-at91: Forcibly suspend ports while USB
 suspend
Date: Wed, 8 Jun 2016 12:45:39 +0200
Message-ID: <5757F753.8010408@atmel.com>
References: <1465359311-14544-1-git-send-email-wenyou.yang@atmel.com>
 <1465359311-14544-2-git-send-email-wenyou.yang@atmel.com>
 <5757EDB4.3020806@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5757EDB4.3020806-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 08/06/2016 12:04, Nicolas Ferre a =E9crit :
> Le 08/06/2016 06:15, Wenyou Yang a =E9crit :
>> In order to the save power consumption, as a workaround, suspend
>> forcibly the USB PORTA/B/C via set the SUSPEND_A/B/C bits of OHCI
>> Interrupt Configuration Register in the SFRs while OHCI USB suspend.
>>
>> This suspend operation must be done before the USB clock is disabled=
,
>> resume after the USB clock is enabled.
>>
>> Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>=20
> Little nitpicking below...
>=20
>> ---
>>
>> Changes in v3:
>>  - Change the compatible description for more precise.
>>
>> Changes in v2:
>>  - Add compatible to support forcibly suspend the ports.
>>  - Add soc/at91/at91_sfr.h to accommodate the defines.
>>  - Add error checking for .sfr_regmap.
>>  - Remove unnecessary regmap_read() statement.
>>
>>  .../devicetree/bindings/usb/atmel-usb.txt          |  6 +-
>>  drivers/usb/host/ohci-at91.c                       | 80 +++++++++++=
++++++++++-
>>  include/soc/at91/at91_sfr.h                        | 29 ++++++++

Oops sorry, additional comment which is not nitpicking, this one:

We already have SFR header file in this patch:

Author: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Date:   Thu Mar 17 17:04:00 2016 +0100

    ARM: dts: at91: sama5d2: add SFR node

    This SFR node is looked up by the I2S controller driver to tune the
    SFR_I2SCLKSEL register.

    Signed-off-by: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
    Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
    Acked-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
    Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
    Signed-off-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Which is already accepted by arm-soc guys for 4.7... So my ack
transforms into a nack, sorry...

We will have to coordinate the effort and maybe take the whole series
with us. But for sure, you'll have to use the existing
include/soc/at91/atmel-sfr.h file and build on top of it...

Bye,

>>  3 files changed, 112 insertions(+), 3 deletions(-)
>>  create mode 100644 include/soc/at91/at91_sfr.h

[..]

>=20
> But you can take my:
>=20
> Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>=20
> with the little corrections listed.
>=20
> Alan, We plan to take the second patch of this series with AT91 git t=
ree
> through arm-soc. Do you agree to take this one through yours?

Alan, forget this request, we'll have to coordinate differently.

Sorry for the noise. Bye,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
