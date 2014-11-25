From: Aaron Sierra <asierra-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2] mtd: fsl_upm: Support NAND ECC DTS properties
Date: Tue, 25 Nov 2014 17:23:01 -0600 (CST)
Message-ID: <1919968390.242626.1416957781902.JavaMail.zimbra@xes-inc.com>
References: <1854666513.5578.1415473916534.JavaMail.zimbra@xes-inc.com> <5474E1DB.1090207@vanguardiasur.com.ar> <412246484.206926.1416953948359.JavaMail.zimbra@xes-inc.com> <547505E7.7000502@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <547505E7.7000502-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Jordan Friendshuh <jfriendshuh-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

----- Original Message -----
> From: "Ezequiel Garcia" <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
> Sent: Tuesday, November 25, 2014 4:42:47 PM
> 
> On 11/25/2014 07:19 PM, Aaron Sierra wrote:
> >> From: "Ezequiel Garcia" <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
> >> Sent: Tuesday, November 25, 2014 2:08:59 PM
> >>
> >> On 11/08/2014 04:11 PM, Aaron Sierra wrote:
> >> [..]
> >>> +
> >>> +	/* We know mode is either NAND_ECC_SOFT or NAND_ECC_SOFT_BCH */
> >>> +	if (strength < 0 && mode == NAND_ECC_SOFT_BCH) {
> >>> +		dev_err(fun->dev,
> >>> +			"ECC BCH mode requires nand-ecc-strength property");
> >>> +		ret = -EINVAL;
> >>> +		goto err;
> >>> +	} else if (strength == 0) {
> >>> +		dev_err(fun->dev, "ECC strength of 0 bits is unsupported");
> >>> +		ret = -EINVAL;
> >>> +		goto err;
> >>> +	} else if (strength == 1 && mode == NAND_ECC_SOFT_BCH) {
> >>> +		dev_err(fun->dev, "ECC BCH mode requires > 1-bit strength");
> >>> +		ret = -EINVAL;
> >>> +		goto err;
> >>> +	} else if (strength > 1 && mode == NAND_ECC_SOFT) {
> >>> +		dev_warn(fun->dev,
> >>> +			"Forcing ECC BCH due to %d-bit strength\n", strength);
> >>> +		mode = NAND_ECC_SOFT_BCH;
> >>> +	}
> >>> +	fun->chip.ecc.mode = mode;
> >>> +	fun->chip.ecc.strength = strength;
> >>> +
> >>
> 

[ snip ]

> I'd say you should require an ECC step size in your binding, instead of
> assuming the 512-byte that gets set if the ecc.size is 0.

Yes, I agree that the fsl_upm driver should require that nand-ecc-step-size
and nand-ecc-strength both be defined with "soft_bch".

> BTW, how does this patch deal with old devicetree files?

The fsl_upm driver previously only supported 1-bit "soft" ECC, so _this_
patch expects that existing device trees don't define nand-ecc-strength
or nand-ecc-mode. In that case "soft" ECC will be detected and used.

However, if for some reason an existing device tree defines
nand-ecc-strength, then the snippet that you provided above shows that
the ECC mode would be overridden (forcing "soft_bch" for ECC strength
values greater than 1).

-Aaron
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
