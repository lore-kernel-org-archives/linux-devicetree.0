From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: Add vendor prefix for Energy Micro
Date: Fri, 26 Sep 2014 11:34:26 -0500
Message-ID: <CAL_JsqJ0hbvK2FD9LaOucKP0Q0tMtfREk_aKXKPDRGmC0ZQj6w@mail.gmail.com>
References: <1395756677-6166-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1406146969-26279-1-git-send-email-u.kleine-koenig@pengutronix.de> <20140724103801.GD4079@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140724103801.GD4079@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 24, 2014 at 5:38 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wr=
ote:
> On Wed, Jul 23, 2014 at 09:22:49PM +0100, Uwe Kleine-K=C3=B6nig wrote=
:
>> The kernel supports devices with the following compatible strings
>> already:
>>
>>       energymicro,efm32-i2c
>>       energymicro,efm32-uart
>>       energymicro,efm32-spi
>>       energymicro,efm32-timer
>>
>> So add "energymicro" to the list of vendors.
>>
>> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org=
>
>> ---
>> Hello,
>>
>> An earlier version (with a different changelog) was sent with
>> Message-Id: 1395756677-6166-1-git-send-email-u.kleine-koenig@pengutr=
onix.de
>> in March and got an Ack by Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> and
>> Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>.
>> I adapted the change log because the drivers are in mainline in the =
meantime.
>
> As with last time, this looks sensible to me:
>
> Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>
> Rob, do you want to pick this up?

Applied. Sorry for the delay.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
