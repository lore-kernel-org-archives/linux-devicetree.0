From: Peter Korsgaard <peter-+2lRwdCCLRT2eFz/2MeuCQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] regulator: act8945a: add regulator driver for ACT8945A
Date: Wed, 20 Jan 2016 08:41:55 +0100
Message-ID: <878u3kvgsc.fsf@dell.be.48ers.dk>
References: <1452586629-1117-1-git-send-email-wenyou.yang@atmel.com>
	<1452586629-1117-2-git-send-email-wenyou.yang@atmel.com>
	<87oacp5zl7.fsf@dell.be.48ers.dk>
	<B256D81BAE5131468A838E5D7A243641D63EBC6E@penmbx01>
	<87egdk39ji.fsf@dell.be.48ers.dk>
	<B256D81BAE5131468A838E5D7A243641D63EBEC7@penmbx01>
	<87a8o82xq3.fsf@dell.be.48ers.dk>
	<B256D81BAE5131468A838E5D7A243641D63F6228@penmbx01>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <B256D81BAE5131468A838E5D7A243641D63F6228@penmbx01> (Wenyou
	Yang's message of "Wed, 20 Jan 2016 07:37:36 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Yang, Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Ferre, Nicolas" <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>>>>> "Yang," == Yang, Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> writes:

Hi,

>> > The MFD sub device is registered as a platform device, the existing  > act8865
 >> driver is registered as an i2c_driver. How do they match? :)
 >> 
 >> > Could you point out which exiting driver for me to reference.  Thank you!
 >> 
 >> What I'm saying is that it isn't nice that we end up with both act8865-regulator.c
 >> and act8954-regulator.c doing 95% the same. This can either be fixed by:
 >> 
 >> - Adding act8865 support to your mfd driver (but only registering the
 >> regulator subdev for act8865) and changing the existing
 >> act8865-regulator driver to work as a mfd subdev (platform device)
 >> 
 >> - Extending the act8865-regulator driver to register as a platform
 >> driver in ADDITION to a i2c driver so it can be used with mfd. The
 >> driver already uses regmap so it should only be a matter of adding the
 >> pdev probe/remove functions.

 > After think twice, I think this will complicates the act8865-regulator driver.

I don't think it will add a lot of complication (E.G. basically just the
platform probe/remove functions), but Ok - I'll wait and see your
simplified driver.

-- 
Venlig hilsen,
Peter Korsgaard 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
