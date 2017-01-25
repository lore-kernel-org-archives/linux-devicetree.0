From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Subject: Re: [PATCH 1/3] mtd: name the mtd device with an optional label
 property
Date: Wed, 25 Jan 2017 17:53:22 +0100
Message-ID: <a20ac5a9-2097-c241-e280-9147926e70b6@kaod.org>
References: <1484573225-19095-1-git-send-email-clg@kaod.org>
 <1484573225-19095-2-git-send-email-clg@kaod.org>
 <20170124151353.5bbffae0@bbrezillon>
 <7bdf47c3-d3b7-92a2-47c1-99e4bd6b4f44@kaod.org>
 <20170125175105.67c335e7@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170125175105.67c335e7@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/25/2017 05:51 PM, Boris Brezillon wrote:
> On Wed, 25 Jan 2017 17:47:13 +0100
> Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote:
> 
>> On 01/24/2017 03:13 PM, Boris Brezillon wrote:
>>> Hi Cédric,
>>>
>>> On Mon, 16 Jan 2017 14:27:03 +0100
>>> Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote:
>>>   
>>>> This can be used to easily identify a specific chip on a system with
>>>> multiple chips.
>>>>
>>>> Suggested-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>>> Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
>>>> ---
>>>>  drivers/mtd/mtdcore.c | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>>>> index 052772f7caef..bf61557b599d 100644
>>>> --- a/drivers/mtd/mtdcore.c
>>>> +++ b/drivers/mtd/mtdcore.c
>>>> @@ -654,6 +654,13 @@ static int mtd_add_device_partitions(struct mtd_info *mtd,
>>>>   */
>>>>  static void mtd_set_dev_defaults(struct mtd_info *mtd)
>>>>  {
>>>> +	/*
>>>> +	 * If DT support is enabled and we have a valid of_node pointer, try to
>>>> +	 * extract the MTD name from the label property.
>>>> +	 */
>>>> +	if (IS_ENABLED(CONFIG_OF) && mtd->dev.of_node)
>>>> +		of_property_read_string(mtd->dev.of_node, "label", &mtd->name);
>>>> +  
>>>
>>> I realize this kind of thing would be better placed in mtd_set_of_node()
>>> (see the patch below). Modifying the mtd->name pointer in the back of
>>> MTD drivers is not such a good idea (suppose the driver allocated the
>>> memory with a regular kmalloc() and tries to free mtd->name in the remove
>>> path).
>>>
>>> If we move that to mtd_set_of_node(), drivers that wants to support this
>>> label property just have to check if mtd->name is NULL (after calling
>>> mtd_set_of_node() or nand_set_flash_node()) before assigning a default
>>> name.
>>> For unmodified drivers we keep the existing behavior: they'll just
>>> unconditionally override mtd->name with their own value (which might or
>>> might not be dynamically allocated).  
>>
>> ok. So the expected behavior looks correct to me, but adding a call to 
>> of_property_read_string() in the inline below feels a little hacky. 
>> Doesn't it ? 
>>
>> May be we need an extra check on IS_ENABLED(CONFIG_OF) also ? 
> 
> This is all safe, because the of.h header defines stubs if CONFIG_OF is
> not set. That just means the name will be unchanged, but you shouldn't
> have any problem (neither as compilation time nor at runtime).
> 

ok. I will cook a v2 with your proposal then.

Thanks,

C.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
