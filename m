From: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 01/10] of: Add vendor prefix for Advantech Corporation
Date: Tue, 10 Nov 2015 13:11:36 -0500
Message-ID: <56423358.7070908@timesys.com>
References: <1446747224-32514-1-git-send-email-akshay.bhat@timesys.com>
 <1446747224-32514-2-git-send-email-akshay.bhat@timesys.com>
 <20151105202213.GA7468@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151105202213.GA7468@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, justin.waters-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org, martin.donnelly-JJi787mZWgc@public.gmane.org, peter.stretz-ELdSlb/RfAS1Z/+hSey0Gg@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 11/05/2015 03:22 PM, Rob Herring wrote:
> On Thu, Nov 05, 2015 at 01:13:35PM -0500, Akshay Bhat wrote:
>> This patch adds vendor prefix for Advantech Corporation.
>>
>> Website: http://www.advantech.com/
>> Signed-off-by: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
>> ---
>>   Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> index 55df1d4..2b3c5ac 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> @@ -10,6 +10,7 @@ ad	Avionic Design GmbH
>>   adapteva	Adapteva, Inc.
>>   adh	AD Holdings Plc.
>>   adi	Analog Devices, Inc.
>> +adv	Advantech Corporation
>
> adv is a bit short. I think it would be better to go with "advantech".
>
> Rob
>

Fixed in v3.

http://lists.infradead.org/pipermail/linux-arm-kernel/2015-November/384203.html

>>   aeroflexgaisler	Aeroflex Gaisler AB
>>   al	Annapurna Labs
>>   allwinner	Allwinner Technology Co., Ltd.
>> --
>> 2.6.2
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
