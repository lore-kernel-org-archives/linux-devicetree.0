From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 1/2] mtd: arasan: Add device tree binding documentation
Date: Mon, 5 Dec 2016 17:11:36 +0100
Message-ID: <59e420fd-afb1-ab4c-44bd-ead160496bfd@gmail.com>
References: <1480911066-26157-1-git-send-email-punnaia@xilinx.com>
 <74842d92-840d-a7c2-fb1b-ddab1ac2cf42@gmail.com>
 <20161205093630.650451d7@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161205093630.650451d7@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, kalluripunnaiahchoudary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/05/2016 09:36 AM, Boris Brezillon wrote:
> On Mon, 5 Dec 2016 05:25:54 +0100
> Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>> On 12/05/2016 05:11 AM, Punnaiah Choudary Kalluri wrote:
>>> This patch adds the dts binding document for arasan nand flash
>>> controller.
>>>
>>> Signed-off-by: Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> ---
>>> changes in v6:
>>> - Removed num-cs property
>>> - Separated nandchip from nand controller
>>> changes in v5:
>>> - None
>>> Changes in v4:
>>> - Added num-cs property
>>> - Added clock support
>>> Changes in v3:
>>> - None
>>> Changes in v2:
>>> - None
>>> ---
>>>  .../devicetree/bindings/mtd/arasan_nfc.txt         | 38 ++++++++++++++++++++++
>>>  1 file changed, 38 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/mtd/arasan_nfc.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/arasan_nfc.txt b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
>>> new file mode 100644
>>> index 0000000..dcbe7ad
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
>>> @@ -0,0 +1,38 @@
>>> +Arasan Nand Flash Controller with ONFI 3.1 support  
>>
>> Arasan NAND Flash ...
>>
>>> +Required properties:
>>> +- compatible: Should be "arasan,nfc-v3p10"  
>>
>> This v3p10 looks like version 3 patchlevel 10, but shouldn't we have
>> some fallback option which doesn't encode IP version in the compat
>> string ?
> 
> Not necessarily. Usually you define a generic compatible when you have
> other reliable means to detect the IP version (a version register for
> example).
> If you can't detect that at runtime, then providing only specific
> compatible strings is a good solution to avoid breaking the DT ABI.

Can we detect it at runtime with this hardware ?

>>
>> Also, shouldn't quirks be handled by DT props instead of effectively
>> encoding them into the compatible string ?
> 
> Well, from my experience, it's better to hide as much as possible
> behind the compatible. This way, if new quirks are needed for a
> specific revision, you can update the driver without having to change
> the DT.

That's a good point, yes.

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
