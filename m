From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH v2] mtd: fsl_upm: Support NAND ECC DTS properties
Date: Tue, 25 Nov 2014 19:42:47 -0300
Message-ID: <547505E7.7000502@vanguardiasur.com.ar>
References: <1854666513.5578.1415473916534.JavaMail.zimbra@xes-inc.com> <5474E1DB.1090207@vanguardiasur.com.ar> <412246484.206926.1416953948359.JavaMail.zimbra@xes-inc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <412246484.206926.1416953948359.JavaMail.zimbra-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aaron Sierra <asierra-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Jordan Friendshuh <jfriendshuh-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 11/25/2014 07:19 PM, Aaron Sierra wrote:
>> From: "Ezequiel Garcia" <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
>> Sent: Tuesday, November 25, 2014 2:08:59 PM
>>
>> On 11/08/2014 04:11 PM, Aaron Sierra wrote:
>> [..]
>>> +
>>> +	/* We know mode is either NAND_ECC_SOFT or NAND_ECC_SOFT_BCH */
>>> +	if (strength < 0 && mode == NAND_ECC_SOFT_BCH) {
>>> +		dev_err(fun->dev,
>>> +			"ECC BCH mode requires nand-ecc-strength property");
>>> +		ret = -EINVAL;
>>> +		goto err;
>>> +	} else if (strength == 0) {
>>> +		dev_err(fun->dev, "ECC strength of 0 bits is unsupported");
>>> +		ret = -EINVAL;
>>> +		goto err;
>>> +	} else if (strength == 1 && mode == NAND_ECC_SOFT_BCH) {
>>> +		dev_err(fun->dev, "ECC BCH mode requires > 1-bit strength");
>>> +		ret = -EINVAL;
>>> +		goto err;
>>> +	} else if (strength > 1 && mode == NAND_ECC_SOFT) {
>>> +		dev_warn(fun->dev,
>>> +			"Forcing ECC BCH due to %d-bit strength\n", strength);
>>> +		mode = NAND_ECC_SOFT_BCH;
>>> +	}
>>> +	fun->chip.ecc.mode = mode;
>>> +	fun->chip.ecc.strength = strength;
>>> +
>>
>> Aside from my comment about the lack of ECC specification in the
>> binding, I think the above is wrong.
>>
>> You don't have hardware ECC, but software ECC (either hamming or BCH).
>> So, you don't need to specify any nand_ecc_ctrl.strength (i.e.
>> ecc.strength above).
>>
>> It'll be set by the NAND core and override any value you set
>> See nand_scan_tail.
> 
> Ezequiel,
> This patch was originally the second of two patches. The first was applied
> to l2-mtd.git on 11/5/2014:
> 
>     mtd: nand: Base BCH ECC bytes on required strength
> 
> It affects the code in nand_scan_tail that you're referring to so that it
> looks like this:
> 
> 		/*
> 		 * Board driver should supply ecc.size and ecc.bytes values to
> 		 * select how many bits are correctable; see nand_bch_init()
> 		 * for details. Otherwise, default to 4 bits for large page
> 		 * devices.
> 		 */
> 		if (!ecc->size && (mtd->oobsize >= 64)) {
> 			ecc->size = 512;
> 			ecc->bytes = DIV_ROUND_UP(13 * ecc->strength, 8);
> 		}
> 		ecc->priv = nand_bch_init(mtd, ecc->size, ecc->bytes,
> 					       &ecc->layout);
> 		if (!ecc->priv) {
> 			pr_warn("BCH ECC initialization failed!\n");
> 			BUG();
> 		}
> 		ecc->strength = ecc->bytes * 8 / fls(8 * ecc->size);
> 
> In this case ecc->strength is unnecessarily recalculated at the end and
> ecc->strength isn't checked for zero in the initial calculation. Perhaps
> this block in nand_scan_tail should be patched again to preserve the
> original behaviour if ecc->strength or ecc->size are zero.
> 

Exactly, I was talking about that snippet. I missed the fact that
ecc.strength is used to get bytes, and then re-calculated. Some comments
are definitely needed there.

> The only other in-kernel user of SOFT_BCH is sunxi_nand.c and it calculates
> ecc->bytes from ecc->size and ecc->strength itself, so it has defined all
> three values by this point.
> 
>> So, I'd say you just need to specify the nand-ecc-mode in the devicetree
>> binding.
>>
>> The nand-ecc-strength and nand-ecc-step-size are meant for controllers
>> with hardware ECC support.
> 
> Software BCH allows controllers without hardware support for multiple
> bit correction to be used with NAND devices that require multiple bit
> correction, so like a hardware controller it needs to know how many
> bits to correct.
> 

Right, right.

I'd say you should require an ECC step size in your binding, instead of
assuming the 512-byte that gets set if the ecc.size is 0.

BTW, how does this patch deal with old devicetree files?
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
