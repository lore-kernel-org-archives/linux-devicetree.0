From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: add gpio-ranges property to iMX GPIO
 controllers
Date: Fri, 9 Sep 2016 11:44:10 +0300
Message-ID: <729f2fd7-df40-c631-5365-892ee25854b3@mentor.com>
References: <1473386556-1934-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <20160909072020.ieehalkgxxjfewhs@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160909072020.ieehalkgxxjfewhs-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Deepak Das <deepak_das-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Uwe,

On 09/09/2016 10:20 AM, Uwe Kleine-König wrote:
> On Fri, Sep 09, 2016 at 05:02:36AM +0300, Vladimir Zapolskiy wrote:
>> To establish a connection between GPIO controllers and pin multiplexor
>> controller add gpio-ranges properties to all GPIO controllers found
>> on iMX50, iMX6Q/D, iMX6DL/S, iMX6SL, iMX6SX, iMX6UL and iMX7D/S
>> SoCs. The change was done after human parsing of output from
>
> When looking at doing the same for i.MX35 there are a few pin pairs that
> are driven by the same GPIO, e.g.:
>
> 	$ grep GPIO3_9 imx35-pinfunc.h
> 	#define MX35_PAD_CTS1__GPIO3_9					0x194 0x5d8 0x918 0x5 0x0
> 	#define MX35_PAD_FEC_COL__GPIO3_9				0x2ec 0x750 0x918 0x5 0x1
>
> With this it's not possible to correctly add a gpio-ranges, right?

this is an interesting exceptional case, I don't think that pinctrl
and gpio subsystems are ready to handle it.

If both pads are muxed to the same GPIO, then I presume on output it
behaves like a tee, but do you know what would be the input value,
if one line is driven high and another one is low?

> i.MX1, i.MX21, i.MX25, i.MX27 and i.MX53 could benefit from such a
> change though. i.MX35 and i.MX51 have duplicates.
>

I keep my hands off it, because I don't have any boards powered by
these SoCs to be able to test the change. FWIW I hold one i.MX31
powered board from old times, but I see that i.MX31 has poor DTS
support in general, there is no GPIO controller device node to
add the property.

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
