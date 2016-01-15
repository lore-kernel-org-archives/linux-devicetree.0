From: Peter Korsgaard <peter-+2lRwdCCLRT2eFz/2MeuCQ@public.gmane.org>
Subject: Re: [PATCH v5 1/2] mfd: act8945a: add Active-semi ACT8945A PMIC MFD driver
Date: Fri, 15 Jan 2016 08:58:10 +0100
Message-ID: <8737tzz33h.fsf@dell.be.48ers.dk>
References: <1452747845-2962-1-git-send-email-wenyou.yang@atmel.com>
	<1452747845-2962-2-git-send-email-wenyou.yang@atmel.com>
	<87pox41dy9.fsf@dell.be.48ers.dk>
	<B256D81BAE5131468A838E5D7A243641D63ECA51@penmbx01>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <B256D81BAE5131468A838E5D7A243641D63ECA51@penmbx01> (Wenyou
	Yang's message of "Fri, 15 Jan 2016 01:16:11 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Yang, Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "Ferre, Nicolas" <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>>>>> "Yang," == Yang, Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> writes:

Hi,

 >> Why not make it a tristate instead? Having regulators as modules is perhaps not a
 >> very wise thing to do, but conceptually I don't see why this code couldn't be a
 >> module.

 > Yes, you are right. it can be use a tristate.

Ok, good.

>> > +	act8945a = devm_kzalloc(&i2c->dev, sizeof(*act8945a), GFP_KERNEL);
 >> > +	if (!act8945a)
 >> > +		return -ENOMEM;
 >> > +
 >> 
 >> What is the point of this structure (and the header file)? Can't the subdevices just
 >> do dev_get_regmap(dev->parent)? regulator_register() afaik already does this by
 >> default.

 > Yes, I re-read regulator_register() code. It did do dev_get_regmap(dev->parent).

 > I think this structure should be pointed by dev->parent, this structure is necessary.

 > Yes regulator driver should be simpler.

 > Moreover, it is used by another sub device, charger. Which don't such code.

But the charger driver can just as well do:

dev_get_regmap(dev->parent);

instead of:

dev_get_drvdata(pdev->dev.parent)->regmap.

-- 
Venlig hilsen,
Peter Korsgaard 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
