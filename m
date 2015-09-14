From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: Add dtb for the Radxa Rock 2
 Square board
Date: Mon, 14 Sep 2015 09:50:20 +0200
Message-ID: <CABxcv==JF5QKG8qmrRRUSi4j0=7guQQJTzVzR2bgSxdtUDBv7Q@mail.gmail.com>
References: <1442011005-4828-1-git-send-email-sjoerd.simons@collabora.co.uk>
	<1442011005-4828-2-git-send-email-sjoerd.simons@collabora.co.uk>
	<CABxcv=nRjge1qMeoXt6U6McKbv30oYUhh9C417mX0B=bt9Jg-g@mail.gmail.com>
	<1442215849.8778.101.camel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442215849.8778.101.camel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Sjoerd,

On Mon, Sep 14, 2015 at 9:30 AM, Sjoerd Simons
<sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:

[snip]

>> > +
>> > +                       vcc18_lcd: REG12 {
>> > +                               regulator-name = "VCC18_LCD";
>> > +                               regulator-min-microvolt =
>> > <1800000>;
>> > +                               regulator-max-microvolt =
>> > <1800000>;
>> > +                               regulator-always-on;
>> > +                       };
>>
>> Should all these regulators really need to be always-on?
>
> Ideally not all of them, turning the ones that aren't needed off is
> definately on my list of things to do (together with the other
> pheripherals, leds, hw. keys etc).
>
> For the first patch i do prefer to keep them on so we can have get some
> more testing  with this board before fine-tuning those things (fwiw,

Ok.

> the rockchip evb board and others with essentially the same pmic setup
> all also have them always-on)

Yes but I believe that's because it was easier and there are
regulators on these boards that don't need to be always-on as well.

> --
> Sjoerd Simons
> Collabora Ltd.

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
