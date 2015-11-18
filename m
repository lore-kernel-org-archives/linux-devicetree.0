From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH 3/3] doc: dt: mtd: stop referring to driver code for
 spi-nor IDs
Date: Wed, 18 Nov 2015 17:23:31 -0300
Message-ID: <564CDE43.9020103@osg.samsung.com>
References: <1447713292-91525-1-git-send-email-computersforpeace@gmail.com>
 <1447713292-91525-4-git-send-email-computersforpeace@gmail.com>
 <564B3407.2020403@osg.samsung.com> <20151118194340.GF140057@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151118194340.GF140057-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Brian,

On 11/18/2015 04:43 PM, Brian Norris wrote:
> Hi,
> 
> On Tue, Nov 17, 2015 at 11:04:55AM -0300, Javier Martinez Canillas wrote:
>> On 11/16/2015 07:34 PM, Brian Norris wrote:
>>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>>> index 2bee68103b01..2c91c03e7eb0 100644
>>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>>> @@ -1,15 +1,61 @@
>>> -* MTD SPI driver for ST M25Pxx (and similar) serial flash chips
>>> +* SPI NOR flash: ST M25Pxx (and similar) serial flash chips
>>>  
>>>  Required properties:
>>>  - #address-cells, #size-cells : Must be present if the device has sub-nodes
>>>    representing partitions.
>>>  - compatible : May include a device-specific string consisting of the
>>> -               manufacturer and name of the chip. Bear in mind the DT binding
>>> -               is not Linux-only, but in case of Linux, see the "m25p_ids"
>>> -               table in drivers/mtd/devices/m25p80.c for the list of supported
>>> -               chips.
>>> +               manufacturer and name of the chip. A list of supported chip
>>> +               names follows.
>>
>> Here says that the compatible string consists of manufacturer and name...
>>
>>>                 Must also include "jedec,spi-nor" for any SPI NOR flash that can
>>>                 be identified by the JEDEC READ ID opcode (0x9F).
>>> +
>>> +               Supported chip names:
>>> +                 at25df321a
>>> +                 at25df641
> [...]
>> +
>>
>> ... but the entries in the list don't have a manufacturer. I know this is
>> due backward compatibility because as we discussed in the thread mentioned
>> in the cover letter, the SPI core didn't use the manufacturer and that
>> implementation detail leaked into the DTBs.
>>
>> But I think that either only the correct list with vendor should be added
>> to the DT binding docs (but make sure that backward compatibility in the
>> driver and SPI core is maintained) or both the wrong and correct list should
>> be documented and the former be marked as deprecated.
> 
> First, note that the list says "Supported chip *names*" (not "Supported
> compatible values"). It does not attempt to specify the full compatible
> value, and that's intentional.
> 

Right, sorry I missed that subtlety.

> Second, I believe it is hard to determine after-the-fact what all the
> reasonable pairings of vendors might be. For some of these parts,
> various companies have produced parts under the same chip ID -- usually
> because one company bought another. For most chips though, this probably
> isn't a problem, so I could probably pick reasonable vendor pairings.
>
> IOW, there isn't just "a wrong" and "a correct" list; there's a
> (probably?) correct list and an enormous space of "I don't know what
> people might have put here" list. It's nearly unbounded, but even a
> reasonable list might get pretty large. So in practice, we'd essentially
> be sacrificing completeness for...what reason?
>

I see.

>>> +               The following chip names have been used historically to
>>> +               designate quirky versions of flash chips that do not support the
>>> +               JEDEC READ ID opcode (0x9F):
>>> +                 m25p05-nonjedec
>>> +                 m25p10-nonjedec
>>> +                 m25p20-nonjedec
>>> +                 m25p40-nonjedec
>>> +                 m25p80-nonjedec
>>> +                 m25p16-nonjedec
>>> +                 m25p32-nonjedec
>>> +                 m25p64-nonjedec
>>> +                 m25p128-nonjedec
>>> +
>>
>> Same here, I would prefer if the DT binding make it clear that not having
>> a vendor is wrong and is only documented to maintain backward compatibility.
> 
> The doc never says anything about not including the vendor. It says
> 
>   "May include a device-specific string consisting of the manufacturer
>   and name of the chip"
> 
> and it lists the chip names. So if someone is actually following the
> documentation, they will include a vendor. The vendor names are not
> listed because they're really not relevant to the implementation. But I
> could try to include them.
>

My goal was to start forcing people to use a complete compatible string
to avoid the "garbage,chip-name" that you mentioned in the other thread.

The vendor are not relevant in the current implementation because how the
SPI core is implemented but I think that shouldn't affect the accuracy on
which hardware is described in the DT.
 
>>>  - reg : Chip-Select number
>>>  - spi-max-frequency : Maximum frequency of the SPI bus the chip can operate at
>>>  
>>>
> 
> So, what makes sense? I can make a separate list of vendors (my
> preference), or even try to pair up vendors with chip names (even if
> it's sometimes an N:1 relationship). But I don't see that really buying
> us much, since the implementation never has (and probably never will)
> enforce this. What do you think?
>

Yes, you are right that is hard to come with a reasonable list specially since
the vendor and chip relation could be N:1 as you said.

$SUBJECT is definitely an improvement over the current doc that mentions the
"m25p_ids" table in the driver though. So we can update later the DT binding
once / if the SPI core is modified to report proper OF modalias so OF-only
drivers can get rid of their SPI id table.

So for this patch:

Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
