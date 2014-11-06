From: arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org (Arnaud Ebalard)
Subject: Re: [PATCHv0 2/3] rtc: rtc-isl12057: fix isil vs isl naming for intersil
Date: Thu, 06 Nov 2014 23:46:21 +0100
Message-ID: <874mucne0y.fsf@natisbad.org>
References: <cover.1415222752.git.arno@natisbad.org>
	<2ac5b475fd757ea771296ea0731de75d963999ef.1415222752.git.arno@natisbad.org>
	<20141106053253.GK8509@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Huewe <peter.huewe-d0qZbvYSIPpWk0Htik3J/w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> On Wed, Nov 05, 2014 at 10:42:41PM +0100, Arnaud Ebalard wrote:
>
>> When Intersil ISL12057 driver was introduced by commit 70e123373c05
>> (rtc: Add support for Intersil ISL12057 I2C RTC chip), the vendor
>> prefix 'isl' was used instead of the expected 'isil' (Intersil
>> NASDAQ symbol). Recently, a patch from Philip Zabel (7a6540ca856a,
>> ARM: mvebu: Change vendor prefix for Intersil Corporation to isil)
>> fixed that prefix in ReadyNAS devices .dts files (AFAICT, the only
>> kernel users at the moment).
>
> They may be the only in kernel users but someone with an out of tree DT
> may be using the existing prefix, we shouldn't break compatibility with
> them so we should support both compatible strings even if we want to
> deprecate the isl, one.

Updating the patch in the following way should make it possible to
support out-of-tree users while avoiding additional uses of 'isl': 

- have two compatible entries in isl12057_dt_match struct instead of one
  i.e.:

    static const struct of_device_id isl12057_dt_match[] = {
   	{ .compatible = "isl,isl12057" },
   	{ .compatible = "isil,isl12057" },
    	{ },
    };

  I think it matches the situation we have.

- keeping the updates I had for trivial-devices.txt and
  vendor-prefixes.txt files.

Thoughts?

Cheers,

a+
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
