From: "ivan.khoronzhuk" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 7/9] mtd: nand: davinci: adjust DT properties to MTD
 generic
Date: Tue, 17 Dec 2013 14:19:12 +0200
Message-ID: <52B04140.1060709@ti.com>
References: <1386264358-9738-1-git-send-email-ivan.khoronzhuk@ti.com> <1386264358-9738-8-git-send-email-ivan.khoronzhuk@ti.com> <20131217085027.GK12034@norris-Latitude-E6410>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131217085027.GK12034@norris-Latitude-E6410>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/17/2013 10:50 AM, Brian Norris wrote:
> On Thu, Dec 05, 2013 at 07:25:55PM +0200, Ivan Khoronzhuk wrote:
>> --- a/drivers/mtd/nand/davinci_nand.c
>> +++ b/drivers/mtd/nand/davinci_nand.c
>> @@ -558,6 +557,8 @@ static struct davinci_nand_pdata
>>   			"ti,davinci-mask-chipsel", &prop))
>>   			pdata->mask_chipsel = prop;
>>   		if (!of_property_read_string(pdev->dev.of_node,
>> +			"nand-ecc-mode", &mode) ||
> 
> Is it possible to use the of_get_nand_ecc_mode() helper? It's
> unfortunate that davinci_nand had to use custom bindings in the first
> place, making this more difficult... So I can take this patch as-is.
> 

Yes, I will do nothing for that

>> +		    !of_property_read_string(pdev->dev.of_node,
>>   			"ti,davinci-ecc-mode", &mode)) {
>>   			if (!strncmp("none", mode, 4))
>>   				pdata->ecc_mode = NAND_ECC_NONE;
>> @@ -570,11 +571,15 @@ static struct davinci_nand_pdata
>>   			"ti,davinci-ecc-bits", &prop))
>>   			pdata->ecc_bits = prop;
>>   		if (!of_property_read_u32(pdev->dev.of_node,
>> +			"nand-bus-width", &prop) ||
> 
> Similar story here, with of_get_nand_bus_width().
> 

It seems for bus width I can replace it on:

prop = of_get_nand_bus_width(pdev->dev.of_node);
if ( 0 < prop || !of_property_read_u32(pdev->dev.of_node,
	     "ti,davinci-nand-buswidth", &prop))
     if (prop == 16)
	     pdata->options |= NAND_BUSWIDTH_16;


>> +		    !of_property_read_u32(pdev->dev.of_node,
>>   			"ti,davinci-nand-buswidth", &prop))
>>   			if (prop == 16)
>>   				pdata->options |= NAND_BUSWIDTH_16;
>> -		if (of_find_property(pdev->dev.of_node,
>> -			"ti,davinci-nand-use-bbt", &len))
>> +		if (of_property_read_bool(pdev->dev.of_node,
>> +			"nand-on-flash-bbt") ||
>> +		    of_property_read_bool(pdev->dev.of_node,
>> +			"ti,davinci-nand-use-bbt"))
>>   			pdata->bbt_options = NAND_BBT_USE_FLASH;
>>   	}
>>   
> 
> Brian
> 


-- 
Regards,
Ivan Khoronzhuk
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
