From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Subject: Re: [PATCH 2/3] dt-bindings: mtd: add a common label property to all
 mtd devices
Date: Mon, 16 Jan 2017 15:39:23 +0100
Message-ID: <ab3d2687-c356-7e79-3a26-706181bdc9f5@kaod.org>
References: <1484573225-19095-1-git-send-email-clg@kaod.org>
 <1484573225-19095-3-git-send-email-clg@kaod.org>
 <20170116145258.17707912@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170116145258.17707912@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/16/2017 02:52 PM, Boris Brezillon wrote:
> On Mon, 16 Jan 2017 14:27:04 +0100
> Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote:
> 
>> This can be used to easily identify a specific chip on a system with
>> multiple chips.
>>
>> Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/mtd/common.txt | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/common.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/common.txt b/Documentation/devicetree/bindings/mtd/common.txt
>> new file mode 100644
>> index 000000000000..a781641a3b00
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/common.txt
>> @@ -0,0 +1,12 @@
>> +* Common properties of all MTD devices
>> +
>> +Optional properties:
>> +- label : name to assign to mtd. If omitted, the label is the MTD device name.
> 
> Hm, the description is not really clear. How about:
> 
> "
> - label: user-defined MTD device name. Can be used to assign user
>   friendly names to MTD devices (instead of the flash model or flash
>   controller based name) in order to ease flash device identification
>   and/or describe what they are used for.
> "

yes. I will use that in a v2.
 
Thanks,

C. 

> Otherwise,
> 
> Acked-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> 
> Thanks,
> 
> Boris
> 
>> +
>> +Example:
>> +
>> +	flash@0 {
>> +		label = "System-firmware";
>> +
>> +		/* flash type specific properties */
>> +	};
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
