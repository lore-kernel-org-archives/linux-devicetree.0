From: Peter Korsgaard <peter-+2lRwdCCLRT2eFz/2MeuCQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] regulator: act8945a: add regulator driver for ACT8945A
Date: Thu, 14 Jan 2016 12:43:00 +0100
Message-ID: <87a8o82xq3.fsf@dell.be.48ers.dk>
References: <1452586629-1117-1-git-send-email-wenyou.yang@atmel.com>
	<1452586629-1117-2-git-send-email-wenyou.yang@atmel.com>
	<87oacp5zl7.fsf@dell.be.48ers.dk>
	<B256D81BAE5131468A838E5D7A243641D63EBC6E@penmbx01>
	<87egdk39ji.fsf@dell.be.48ers.dk>
	<B256D81BAE5131468A838E5D7A243641D63EBEC7@penmbx01>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <B256D81BAE5131468A838E5D7A243641D63EBEC7@penmbx01> (Wenyou
	Yang's message of "Thu, 14 Jan 2016 08:07:40 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Yang, Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Ferre, Nicolas" <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>>>>> "Yang," == Yang, Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> writes:

Hi,

>> 
 >>> Isn't the regulator part of the act8945a identical to act8865? Can't we just use
 >>> the existing act8865-regulator.c driver? (E.G. support 8865 variant in the mfd
 >>> driver, but only register the regulator sub device?)
 >> 
 >> > Yes, the regulator part of the act8945a is identical to act8865.
 >> 
 >> > But the act8865-regulator driver is a struct i2c_driver, and the mfd  > sub-
 >> device driver is a platform_driver driver, it is not easy to use  > it.
 >> 
 >> But the mfd driver could support the act8865 variant as well (by only registering
 >> the regulator mfd cell).

 > I still don't understand.

 > The MFD sub device is registered as a platform device, the existing
 > act8865 driver is registered as an i2c_driver. How do they match? :)

 > Could you point out which exiting driver for me to reference.  Thank you!

What I'm saying is that it isn't nice that we end up with both
act8865-regulator.c and act8954-regulator.c doing 95% the same. This can
either be fixed by:

- Adding act8865 support to your mfd driver (but only registering the
  regulator subdev for act8865) and changing the existing
  act8865-regulator driver to work as a mfd subdev (platform device)

- Extending the act8865-regulator driver to register as a platform
  driver in ADDITION to a i2c driver so it can be used with mfd. The
  driver already uses regmap so it should only be a matter of adding the
  pdev probe/remove functions.

-- 
Venlig hilsen,
Peter Korsgaard 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
