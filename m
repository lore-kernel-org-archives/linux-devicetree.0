From: Matthieu CASTET <matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 7/9] usb: chipidea: udc: add force-full-speed option
Date: Fri, 16 Nov 2012 15:53:21 +0100
Message-ID: <50A65361.5070209@parrot.com>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de> <1352909950-32555-8-git-send-email-m.grzeschik@pengutronix.de> <87wqxl679k.fsf@ashishki-desk.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87wqxl679k.fsf-qxRn5AmX6ZD9BXuAQUXR0fooFf0ArEBIu+b9c/7xato@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Alexander Shishkin a =E9crit :
> Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
>=20
>> This patch makes it possible to set the chipidea udc
>> into full-speed only mode. It can be set by the oftree
>> property "force-full-speed".
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> ---
>>  drivers/usb/chipidea/bits.h  |    1 +
>>  drivers/usb/chipidea/core.c  |    5 +++++
>>  include/linux/usb/chipidea.h |    1 +
>>  3 files changed, 7 insertions(+)
>>
>> diff --git a/drivers/usb/chipidea/bits.h b/drivers/usb/chipidea/bits=
=2Eh
>> index 3cded5f..85b6b09 100644
>> --- a/drivers/usb/chipidea/bits.h
>> +++ b/drivers/usb/chipidea/bits.h
>> @@ -51,6 +51,7 @@
>>  #define PORTSC_PTS            (BIT(31) | BIT(30))
>>  #define PORTSC_PTW            BIT(28)
>>  #define PORTSC_STS            BIT(29)
>> +#define PORTSC_PFSC           BIT(24)
>=20
> Same for this one, it's in DEVLC in my spec.
>=20
Yes it depends it device support lpm or not.

We have the same problem with hw_port_is_high_speed [1]. Mapping is dif=
ferent
according lpm support for some register.

Matthieu

[1]
drivers/usb/chipidea/udc.c
static int hw_port_is_high_speed(struct ci13xxx *ci)
{
    return ci->hw_bank.lpm ? hw_read(ci, OP_DEVLC, DEVLC_PSPD) :
        hw_read(ci, OP_PORTSC, PORTSC_HSP);
}
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
