From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 05/20] ARM: dts: efm32: Add generic compatible string
 for I2C EEPROM
Date: Thu, 25 May 2017 22:17:40 +0200
Message-ID: <CABxcv==49dyQJ6wLAWuet7hqQ36vo=Zd4-SB7OkMvR2L7XGnsQ@mail.gmail.com>
References: <20170523133448.4794-1-javier@dowhile0.org> <20170523133448.4794-6-javier@dowhile0.org>
 <20170525182902.irlm5zbgmbsosvq4@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170525182902.irlm5zbgmbsosvq4-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Uwe,

On Thu, May 25, 2017 at 8:29 PM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Hello,
>
> On Tue, May 23, 2017 at 03:34:33PM +0200, Javier Martinez Canillas wrote:
>> The at24 driver allows to register I2C EEPROM chips using different vend=
or
>> and devices, but the I2C subsystem does not take the vendor into account
>> when matching using the I2C table since it only has device entries.
>>
>> But when matching using an OF table, both the vendor and device has to b=
e
>> taken into account so the driver defines only a set of compatible string=
s
>> using the "atmel" vendor as a generic fallback for compatible I2C device=
s.
>>
>> So add this generic fallback to the device node compatible string to mak=
e
>> the device to match the driver using the OF device ID table.
>>
>> Signed-off-by: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
>
> Assuming the of-table patch is accepted this can have my:
>
> Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>

Thanks a lot for the Ack.

> Otherwise I'm not convinced this is worth the churn.
>

Both changes are needed in order to make sure that the driver and DTS
won't regress when the I2C core is modified to report a proper
MODALIAS for I2C devices registered via OF.

> Thanks
> Uwe
>

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
