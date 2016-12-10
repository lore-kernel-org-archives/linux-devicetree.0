From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/5] mtd: aspeed: add memory controllers for the Aspeed
 AST2400 SoC
Date: Sat, 10 Dec 2016 18:30:28 +0100
Message-ID: <65abc62b-6add-ff21-efc5-01075bfa0c63@gmail.com>
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
 <1481302167-28044-3-git-send-email-clg@kaod.org>
 <076683ea-fa94-2284-f269-2fcebd793940@gmail.com>
 <30a50d6d-07c5-0ca6-2d1b-3ba46c10da49@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <30a50d6d-07c5-0ca6-2d1b-3ba46c10da49-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/10/2016 06:18 PM, Cédric Le Goater wrote:
> On 12/10/2016 05:03 AM, Marek Vasut wrote:
>>> +/*
>>> + * The AST2400 SPI flash controller does not have a CE Control
>>> + * register. It uses the CE0 control register to set 4Byte mode at the
>>> + * controller level.
>>> + */
>>> +static void aspeed_smc_chip_set_4b_spi_2400(struct aspeed_smc_chip *chip)
>>> +{
>>> +	chip->ctl_val[smc_base] |= CONTROL_IO_ADDRESS_4B;
>>> +	chip->ctl_val[smc_read] |= CONTROL_IO_ADDRESS_4B;
>> How do you know the SPI NOR is in 4B mode ?
> 
> in aspeed_smc_chip_setup_finish() :
> 
> 	if (chip->nor.addr_width == 4 && info->set_4b)
> 		info->set_4b(chip);
> 

Ahhh, great :)

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
