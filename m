From: "Yang, Wenyou" <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 1/2] mfd: act8945a: add Active-semi ACT8945A PMIC MFD
 driver
Date: Wed, 20 Jan 2016 15:50:29 +0800
Message-ID: <569F3C45.7090109@atmel.com>
References: <1452747845-2962-1-git-send-email-wenyou.yang@atmel.com>
 <1452747845-2962-2-git-send-email-wenyou.yang@atmel.com>
 <87pox41dy9.fsf@dell.be.48ers.dk>
 <B256D81BAE5131468A838E5D7A243641D63ECA51@penmbx01>
 <8737tzz33h.fsf@dell.be.48ers.dk>
 <B256D81BAE5131468A838E5D7A243641D63F61F4@penmbx01>
 <87d1swvgv8.fsf@dell.be.48ers.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87d1swvgv8.fsf-D6SC8u56vOOJDPpyT6T3/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Korsgaard <peter-+2lRwdCCLRT2eFz/2MeuCQ@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "Ferre, Nicolas" <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Peter,

On 2016/1/20 15:40, Peter Korsgaard wrote:
>>>>>> "Yang," == Yang, Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> writes:
> Hi,
>
>>> But the charger driver can just as well do:
>   >>
>   >> dev_get_regmap(dev->parent);
>   >>
>   >> instead of:
>   >>
>   >> dev_get_drvdata(pdev->dev.parent)->regmap.
>
>   > For regulator, it works use the core do dev_get_regmap(dev->parent),
>   > but for charger, it need to export *act8945a.
>
> Why?

There is a callback (*get_property)(...), who will read the charger 
register via regmap,

but it doesn't provide the argument for regmap.

include/linux/power_supply.h

struct power_supply_desc {
         [ ... ]
         int (*get_property)(struct power_supply *psy,
                              enum power_supply_property psp,
                              union power_supply_propval *val);
         [ ... ]

}

>
> Just like the regulator core does, your battery driver can do:
>
> dev_get_regmap(dev->parent);
>

Best Regards,
Wenyou Yang
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
