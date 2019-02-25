From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [RFC PATCH 3/5] mtd: Add support for Hyperbus memory devices
Date: Mon, 25 Feb 2019 22:33:17 +0300
Message-ID: <95344724-214f-20b7-b629-149ddf396117@cogentembedded.com>
References: <20190219063607.29949-1-vigneshr@ti.com>
 <20190219063607.29949-4-vigneshr@ti.com>
 <42d0fd7b-42e0-605c-70ee-6e308908fc90@cogentembedded.com>
 <4910fda5-133d-7ebb-6ab3-49e0839ea920@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4910fda5-133d-7ebb-6ab3-49e0839ea920@ti.com>
Content-Language: en-MW
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Nori, Sekhar" <nsekhar@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 02/25/2019 09:21 PM, Vignesh R wrote:

[...]

>>> HyperBus specification can be found at[1]
>>> HyperFlash datasheet can be found at[2]
>>>
>>> [1] https://www.cypress.com/file/213356/download
>>> [2] https://www.cypress.com/file/213346/download
>>> [3] http://www.ti.com/lit/ug/spruid7b/spruid7b.pdf
>>>     Table 12-5741. HyperFlash Access Sequence
>>>
>>> Signed-off-by: Vignesh R <vigneshr@ti.com>
[...]
>>> diff --git a/drivers/mtd/hyperbus/core.c b/drivers/mtd/hyperbus/core.c
>>> new file mode 100644
>>> index 000000000000..d3d44aab7503
>>> --- /dev/null
>>> +++ b/drivers/mtd/hyperbus/core.c
[...]
>>> +int hb_register_device(struct hb_device *hbdev)
>>> +{
>>> +	struct resource res;
>>> +	struct device *dev;
>>> +	struct device_node *np;
>>> +	struct map_info *map;
>>> +	struct hb_ops *ops;
>>> +	int err;
>>> +
>>> +	if (!hbdev || !hbdev->dev || !hbdev->np) {
>>> +		pr_err("hyperbus: please fill all the necessary fields!\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	np = hbdev->np;
>>> +	if (!of_device_is_compatible(np, "cypress,hyperflash"))
>>> +		return -ENODEV;
>>> +
>>> +	hbdev->memtype = HYPERFLASH;
>>> +
>>> +	if (of_address_to_resource(np, 0, &res))
>>
>>     Isn't the direct mapping property of the HF controller, not of HyperFlash
>> itself?
>>
> 
> As I said in the cover letter, I could not find many examples of HF
> controllers, but couple of them that I studied provide MMIO access to
> flash. So, reg property of flash node would represent local address on
> the HyperBus and controller node would set up ranges properly to provide
> translation from CS to SoC address space.
> For example see patch 4/5 where reg property would indicate CS and Size
> of flash. This scheme is similar to whats described here [1]
> HBMC controllers usually have different MMIO regions to access flashes
> connected to different CS. So using ranges for address translation along
> with flash node describing local address works pretty well.
> 
> My understanding is that this part of code will be common for most MMIO
> based HB controllers and hence made part of core layer. But, if
> controllers uses different IO space for read vs write, then this needs a
> bit of thinking. In that case, mapping needs to be moved to controller
> drivers.
> 
> [1]https://elinux.org/Device_Tree_Usage#Ranges_.28Address_Translation.29
> 
>>> +		return -EINVAL;
>>> +
>>> +	dev = hbdev->dev;
>>> +	map = &hbdev->map;
>>> +	map->size = resource_size(&res);
>>> +	map->virt = devm_ioremap_resource(dev, &res);
>>> +	if (IS_ERR(map->virt))
>>> +		return PTR_ERR(map->virt);
>>> +
>>> +	map->name = dev_name(dev);
>>> +	map->bankwidth = 2;
>>> +
>>> +	simple_map_init(map);
>>
>>    It's not that simple, I'm afraid -- e.g. Renesas RPC-IF has read and write
>> mappings in the separate memory resources.
>>
> 
> Hmm, could you point me to public datasheet of the controller?

   See chapter 20 in [1]. Note that it's not the same SoC I'm developing for (R-Car
gen3 family, with NDA docs) but should be mostly the same RPC-IF core.

[1] https://www.renesas.com/us/en/doc/products/mpumcu/doc/rz/r01uh0746ej0200-rza2m.pdf?key=74862185b5e22ad09e648d21a35de615

> simple_map_init() provides default implementation for map operations
> which is overridden, if hb_ops is populated.
> I think, Renesas RPC-IF can populate custom hb_ops struct and use
> appropriate MMIO base for read vs write, while still reusing the map
> framework. Wouldnt that work?

   It probably would...

[...]

MBR, Sergei
