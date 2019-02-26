From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [RFC PATCH 3/5] mtd: Add support for Hyperbus memory devices
Date: Tue, 26 Feb 2019 14:08:35 +0300
Message-ID: <a208a121-53a7-7d9a-c2db-ba135e17d3a0@cogentembedded.com>
References: <20190219063607.29949-1-vigneshr@ti.com>
 <20190219063607.29949-4-vigneshr@ti.com>
 <42d0fd7b-42e0-605c-70ee-6e308908fc90@cogentembedded.com>
 <4910fda5-133d-7ebb-6ab3-49e0839ea920@ti.com>
 <95344724-214f-20b7-b629-149ddf396117@cogentembedded.com>
 <1137312b-c326-9e41-4667-e2126649f384@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1137312b-c326-9e41-4667-e2126649f384@ti.com>
Content-Language: en-MW
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Nori, Sekhar" <nsekhar@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 02/26/2019 01:26 PM, Vignesh R wrote:

>> [...]

>>>>> HyperBus specification can be found at[1]
>>>>> HyperFlash datasheet can be found at[2]
>>>>>
>>>>> [1] https://www.cypress.com/file/213356/download
>>>>> [2] https://www.cypress.com/file/213346/download
>>>>> [3] http://www.ti.com/lit/ug/spruid7b/spruid7b.pdf
>>>>>     Table 12-5741. HyperFlash Access Sequence
>>>>>
>>>>> Signed-off-by: Vignesh R <vigneshr@ti.com>
>> [...]
>>>>> diff --git a/drivers/mtd/hyperbus/core.c b/drivers/mtd/hyperbus/core.c
>>>>> new file mode 100644
>>>>> index 000000000000..d3d44aab7503
>>>>> --- /dev/null
>>>>> +++ b/drivers/mtd/hyperbus/core.c
>> [...]
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	dev = hbdev->dev;
>>>>> +	map = &hbdev->map;
>>>>> +	map->size = resource_size(&res);
>>>>> +	map->virt = devm_ioremap_resource(dev, &res);
>>>>> +	if (IS_ERR(map->virt))
>>>>> +		return PTR_ERR(map->virt);
>>>>> +
>>>>> +	map->name = dev_name(dev);
>>>>> +	map->bankwidth = 2;
>>>>> +
>>>>> +	simple_map_init(map);
>>>>
>>>>    It's not that simple, I'm afraid -- e.g. Renesas RPC-IF has read and write
>>>> mappings in the separate memory resources.
>>>>
>>>
>>> Hmm, could you point me to public datasheet of the controller?
>>
>>    See chapter 20 in [1]. Note that it's not the same SoC I'm developing for (R-Car
>> gen3 family, with NDA docs) but should be mostly the same RPC-IF core.
>>
>> [1] https://www.renesas.com/us/en/doc/products/mpumcu/doc/rz/r01uh0746ej0200-rza2m.pdf?key=74862185b5e22ad09e648d21a35de615
> 
> Thanks for the info!
> 
>>> simple_map_init() provides default implementation for map operations
>>> which is overridden, if hb_ops is populated.
>>> I think, Renesas RPC-IF can populate custom hb_ops struct and use
>>> appropriate MMIO base for read vs write, while still reusing the map
>>> framework. Wouldnt that work?
>>
>>    It probably would...
>
> Looking at above link, I see there are two HBMC controllers on Renesas
> SoC. One is a dedicated HBMC controller(chapter 21) very similar to that

   We don't have this one in the R-Car gen3 -- I wasn't even aware of it. :-)
RZ/A2 is newer than gen3 SoCs.

> on TI SoC and a SPI Multi I/O Bus Controller (chapter 20) that also
> supports Hyperbus protocol.

   That matches to the gen3 RPC-IF core.

> AFAICS, passing custom hb_ops is good enough to support both HW needs.
> Let me know if something is missing. I would greatly appreciate if you
> could test this series with your HW.

   Yes, I have stated the conversion from the simple mapping driver.

MBR, Sergei
