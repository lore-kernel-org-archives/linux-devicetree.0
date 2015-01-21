From: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: at91: sama5d4: dts: change the nand compatible
 string
Date: Wed, 21 Jan 2015 11:55:59 +0800
Message-ID: <54BF234F.9060202@atmel.com>
References: <1421656387-12538-1-git-send-email-josh.wu@atmel.com> <1421656387-12538-2-git-send-email-josh.wu@atmel.com> <20150120204915.GS9759@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150120204915.GS9759@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi, Brain

On 1/21/2015 4:49 AM, Brian Norris wrote:
> On Mon, Jan 19, 2015 at 04:33:07PM +0800, Josh Wu wrote:
>> As we introduce a new "atmel,sama5d4-nand" compatible string for sama5d4,
>> so we need to apply it for sama5d4 chip.
>>
>> Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>> ---
>>
>>   arch/arm/boot/dts/sama5d4.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4.dtsi
>> index 1b0f30c..02d67c2 100644
>> --- a/arch/arm/boot/dts/sama5d4.dtsi
>> +++ b/arch/arm/boot/dts/sama5d4.dtsi
>> @@ -267,7 +267,7 @@
>>   		};
>>   
>>   		nand0: nand@80000000 {
>> -			compatible = "atmel,at91rm9200-nand";
>> +			compatible = "atmel,sama5d4-nand";
> Wouldn't it make sense to include both compatible strings, so that old
> kernels can still bind to it?
yes, that make sense. I'll add it.

> The newer IP only adds a new ECC feature,
> but the driver still can work fine without handling it, right?
so far it works fine without this new feature. But I am not 100% sure 
for this :-)

Best Regards,
Josh Wu

>
>>   			#address-cells = <1>;
>>   			#size-cells = <1>;
>>   			ranges;
> Brian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
