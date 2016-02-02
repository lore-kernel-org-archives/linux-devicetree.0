From: Peter Korsgaard <peter-+2lRwdCCLRT2eFz/2MeuCQ@public.gmane.org>
Subject: Re: [PATCH v4 1/2] regulator: act8945a: add regulator driver for ACT8945A
Date: Tue, 02 Feb 2016 18:42:09 +0100
Message-ID: <87wpqn3t72.fsf@dell.be.48ers.dk>
References: <1453863463-30515-1-git-send-email-wenyou.yang@atmel.com>
	<1453863463-30515-2-git-send-email-wenyou.yang@atmel.com>
	<20160129001603.GM4130@sirena.org.uk>
	<B256D81BAE5131468A838E5D7A243641D63FBF8B@penmbx01>
	<20160129113518.GQ4130@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160129113518.GQ4130-GFdadSzt00ze9xe1eoZjHA@public.gmane.org> (Mark Brown's message of
	"Fri, 29 Jan 2016 12:35:18 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "Yang, Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Korsgaard <jacmet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Ferre, Nicolas" <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>>>>> "Mark" == Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

 > On Fri, Jan 29, 2016 at 01:20:08AM +0000, Yang, Wenyou wrote:
 >> > > +static const struct of_device_id act8945a_pmic_of_match[] = {
 >> > > +	{ .compatible = "active-semi,act8945a-regulator" },
 >> > > +	{ },
 >> > > +};
 >> > > +MODULE_DEVICE_TABLE(of, act8945a_pmic_of_match);

 >> > This seems mostly OK but why do we have a compatible string here - shouldn't
 >> > the MFD be able to instantiate the regulator function without needing this?

 >> Because I got feedback from Javier for the act8945a-charger patches of this MFD series,
 >> He said missing the OF match table will cause the module autoloading broken. 

 >> http://lists.infradead.org/pipermail/linux-arm-kernel/2016-January/398113.html

 >> What do you think about it?

 > If then device is not being loaded from the DT (and it shouldn't be, the
 > device looks like it should be instantiated directly by the MFD as it
 > can't exist separately to that MFD) an OF table will do nothing.  

To add to the confusion, the regulator part of the chip is actually
identical to act8865, so it could use the existing regulator driver /
compatible, except that it binds to the platform bus instead of i2c.

-- 
Bye, Peter Korsgaard
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
