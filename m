From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: mtd: document linux,part-probe property
Date: Fri, 31 Mar 2017 07:03:28 +0200
Message-ID: <fb06a470-4d4d-e6b2-7ebf-1c4219665e78@gmail.com>
References: <20170330215332.32699-1-zajec5@gmail.com>
 <20170330215332.32699-2-zajec5@gmail.com>
 <74e3a663-2431-9b86-9d90-7f2fe6ce900f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74e3a663-2431-9b86-9d90-7f2fe6ce900f-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/31/2017 01:26 AM, Marek Vasut wrote:
> On 03/30/2017 11:53 PM, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>
>> Support for this property has been introduced in 2010 with commit
>> 9d5da3a9b849 ("mtd: extend physmap_of to let the device tree specify the
>> parition probe") but it was never documented. Fix this by adding a
>> proper description and example.
>>
>> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/mtd/common.txt | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/common.txt b/Documentation/devicetree/bindings/mtd/common.txt
>> index fc068b923d7a..1ada70e718b2 100644
>> --- a/Documentation/devicetree/bindings/mtd/common.txt
>> +++ b/Documentation/devicetree/bindings/mtd/common.txt
>> @@ -6,10 +6,17 @@ Optional properties:
>>    controller based name) in order to ease flash device identification
>>    and/or describe what they are used for.
>>
>> +- linux,part-probe: if present, this property should contain a list of strings
>> +  with partition probes to be used for the flash device. A role of partition
>> +  probe (parser) is to read/construct partition table and register found
>> +  partitions. Getting partition table may be platform or device specific so
>> +  various devices may use various Linux drivers for this purpose.
>
> Why don't you just have partition not within partition node ? Then you
> won't need this nonsense ...

Can you stop this negative approach ("nonsense") for every single f* thing I
submit? It doesn't help and makes people not want to work with upstream mtd.

The only partitioner with support for partitions node is "fixed-partitions".
Take a look at original linux,part-probe usage:
arch/arm64/boot/dts/arm/juno-motherboard.dtsi
It's used to specify "afs" partitioner. It's dynamic. You can't replace it with
fixed partitions.

So this property is needed to specify platform/device specific partitioner that
should be used with some standard flash driver (like physmap_of or m25p80).

I was hoping following part of documentation makes is clear:
 > Getting partition table may be platform or device specific so
 > various devices may use various Linux drivers for this purpose.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
