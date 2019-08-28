From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v6 0/6] Allwinner H6 Mali GPU support
Date: Wed, 28 Aug 2019 13:51:09 +0200
Message-ID: <e44e1160-619d-989d-fbe7-2552b1e3bf88@baylibre.com>
References: <20190521161102.29620-1-peron.clem@gmail.com>
 <CAAObsKD8bij1ANLqX6y11Y6mDEXiymNjrDkmHmvGWiFLKWu_FA@mail.gmail.com>
 <4ff02295-6c34-791b-49f4-6558a92ad7a3@arm.com>
 <CAAObsKBt1tPw9RKGi_Xey=1zy9Tu3N+A=1te2R8=NuJ5tDBqVg@mail.gmail.com>
 <dc3872a4-8cd9-462b-9f73-0d69a810d985@arm.com>
 <92e9b697-ea0d-9b13-5512-b0a16a39df20@baylibre.com>
 <8433455c-3b74-c176-49a1-388b3f085e9e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8433455c-3b74-c176-49a1-388b3f085e9e@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, Will Deacon <will.deacon@arm.com>, open list <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Steven Price <steven.price@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Linux IOMMU <iommu@lists.linux-foundation.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 28/08/2019 13:49, Robin Murphy wrote:
> Hi Neil,
> 
> On 28/08/2019 12:28, Neil Armstrong wrote:
>> Hi Robin,
>>

[...]
>>>
>>> OK - with the 32-bit hack pointed to up-thread, a quick kmscube test gave me the impression that T720 works fine, but on closer inspection some parts of glmark2 do seem to go a bit wonky (although I suspect at least some of it is just down to the FPGA setup being both very slow and lacking in memory bandwidth), and the "nv12-1img" mode of kmscube turns out to render in some delightfully wrong colours.
>>>
>>> I'll try to get a 'proper' version of the io-pgtable patch posted soon.
>>
>> I'm trying to collect all the fixes needed to make T820 work again, and
>> I was wondering if you finally have a proper patch for this and "cfg->ias > 48"
>> hack ? Or one I can test ?
> 
> I do have a handful of io-pgtable patches written up and ready to go, I'm just treading carefully and waiting for the internal approval box to be ticked before I share anything :(

Great !

No problem, it can totally wait until approval,

Thanks,
Neil

> 
> Robin.
> 
>>
>> Thanks,
>> Neil
>>
>>>
>>> Thanks,
>>> Robin.
>>>
>>>>
>>>> Cheers,
>>>>
>>>> Tomeu
>>>>
>>>>> Robin.
>>>>>
>>>>>
>>>>> ----->8-----
>>>>> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
>>>>> index 546968d8a349..f29da6e8dc08 100644
>>>>> --- a/drivers/iommu/io-pgtable-arm.c
>>>>> +++ b/drivers/iommu/io-pgtable-arm.c
>>>>> @@ -1023,12 +1023,14 @@ arm_mali_lpae_alloc_pgtable(struct
>>>>> io_pgtable_cfg *cfg, void *cookie)
>>>>>           iop = arm_64_lpae_alloc_pgtable_s1(cfg, cookie);
>>>>>           if (iop) {
>>>>>                   u64 mair, ttbr;
>>>>> +               struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(&iop->ops);
>>>>>
>>>>> +               data->levels = 4;
>>>>>                   /* Copy values as union fields overlap */
>>>>>                   mair = cfg->arm_lpae_s1_cfg.mair[0];
>>>>>                   ttbr = cfg->arm_lpae_s1_cfg.ttbr[0];
>>>>>
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel@lists.freedesktop.org
>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
