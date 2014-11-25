From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH v2] mtd: fsl_upm: Support NAND ECC DTS properties
Date: Tue, 25 Nov 2014 17:08:59 -0300
Message-ID: <5474E1DB.1090207@vanguardiasur.com.ar>
References: <1854666513.5578.1415473916534.JavaMail.zimbra@xes-inc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1854666513.5578.1415473916534.JavaMail.zimbra-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aaron Sierra <asierra-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Jordan Friendshuh <jfriendshuh-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/08/2014 04:11 PM, Aaron Sierra wrote:
[..]
> +
> +	/* We know mode is either NAND_ECC_SOFT or NAND_ECC_SOFT_BCH */
> +	if (strength < 0 && mode == NAND_ECC_SOFT_BCH) {
> +		dev_err(fun->dev,
> +			"ECC BCH mode requires nand-ecc-strength property");
> +		ret = -EINVAL;
> +		goto err;
> +	} else if (strength == 0) {
> +		dev_err(fun->dev, "ECC strength of 0 bits is unsupported");
> +		ret = -EINVAL;
> +		goto err;
> +	} else if (strength == 1 && mode == NAND_ECC_SOFT_BCH) {
> +		dev_err(fun->dev, "ECC BCH mode requires > 1-bit strength");
> +		ret = -EINVAL;
> +		goto err;
> +	} else if (strength > 1 && mode == NAND_ECC_SOFT) {
> +		dev_warn(fun->dev,
> +			"Forcing ECC BCH due to %d-bit strength\n", strength);
> +		mode = NAND_ECC_SOFT_BCH;
> +	}
> +	fun->chip.ecc.mode = mode;
> +	fun->chip.ecc.strength = strength;
> +

Aside from my comment about the lack of ECC specification in the
binding, I think the above is wrong.

You don't have hardware ECC, but software ECC (either hamming or BCH).
So, you don't need to specify any nand_ecc_ctrl.strength (i.e.
ecc.strength above).

It'll be set by the NAND core and override any value you set
See nand_scan_tail.

So, I'd say you just need to specify the nand-ecc-mode in the devicetree
binding.

The nand-ecc-strength and nand-ecc-step-size are meant for controllers
with hardware ECC support.
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
