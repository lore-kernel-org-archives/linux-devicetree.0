Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-ve0-f177.google.com ([209.85.128.177]:33364 "EHLO
	mail-ve0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752163Ab3GXGwi (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 24 Jul 2013 02:52:38 -0400
Received: by mail-ve0-f177.google.com with SMTP id cz10so6730099veb.36
        for <devicetree@vger.kernel.org>; Tue, 23 Jul 2013 23:52:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE8_K3rT5gLFBGOnghK-ajFcjQK22mm0qYmF+hSvkT27aA@mail.gmail.com>
References: <1374582499-31823-1-git-send-email-shc_work@mail.ru>
	<CAN8TOE8_K3rT5gLFBGOnghK-ajFcjQK22mm0qYmF+hSvkT27aA@mail.gmail.com>
Date: Tue, 23 Jul 2013 23:52:37 -0700
Message-ID: <CAN8TOE99_FszeOo_sJMf-SXAjKkhjQzxfthjC+grZjbSMttiAQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] mtd: nand: gpio: Determine bus width automatically
From: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Resending to the new DT mailing list. (Guys, this isn't advertised
very well, and your MAINTAINERS patch hasn't been applied to Linus'
tree yet. Why the rapid transition?)

On Tue, Jul 23, 2013 at 11:42 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Tue, Jul 23, 2013 at 5:28 AM, Alexander Shiyan <shc_work@mail.ru> wrote:
>> This patch provide automatically determine of bus width. If resource size,
>> supplied to the driver more than 1 byte, the NAND_BUSWIDTH_AUTO option
>> will be used in the MTD core.
>
> I presume this depends on the bugfix I sent for NAND_BUSWIDTH_AUTO /
> nand_set_defaults()? That's worth noting (as I am right now), for
> whenever someone gets around to merging this.
>
>> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
>> ---
>>  .../devicetree/bindings/mtd/gpio-control-nand.txt  |  5 ++---
>
> Considering the changes in device-tree bindings, it's good to CC the
> device-tree list, I believe.
>
>>  drivers/mtd/nand/gpio.c                            | 23 +++++++++++-----------
>>  2 files changed, 13 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
>> index 36ef07d..287b8b8 100644
>> --- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
>> +++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
>> @@ -8,15 +8,14 @@ Required properties:
>>  - compatible : "gpio-control-nand"
>>  - reg : should specify localbus chip select and size used for the chip.  The
>>    resource describes the data bus connected to the NAND flash and all accesses
>> -  are made in native endianness.
>> +  are made in native endianness. Bus width of the device is determined
>> +  automatically if size > 1. If size = 1, 8 bit bus width will be used.
>>  - #address-cells, #size-cells : Must be present if the device has sub-nodes
>>    representing partitions.
>>  - gpios : specifies the gpio pins to control the NAND device.  nwp is an
>>    optional gpio and may be set to 0 if not present.
>>
>>  Optional properties:
>> -- bank-width : Width (in bytes) of the device.  If not present, the width
>> -  defaults to 1 byte.
>
> Do you really want to remove this property entirely? I'm not sure what
> the policy is on this. And it may still be useful to leave in the
> documentation, since older drivers (and potentially non-Linux OS?) may
> still need the property. Maybe you can mark it as optional, and that
> it may be ignored entirely.
>
>>  - chip-delay : chip dependent delay for transferring data from array to
>>    read registers (tR).  If not present then a default of 20us is used.
>>  - gpio-control-nand,io-sync-reg : A 64-bit physical address for a read
>> diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
>> index 800a1cc..f144b80 100644
>> --- a/drivers/mtd/nand/gpio.c
>> +++ b/drivers/mtd/nand/gpio.c
>> @@ -109,14 +109,9 @@ static int gpio_nand_get_config_of(const struct device *dev,
>>         if (!dev->of_node)
>>                 return -ENODEV;
>>
>> -       if (!of_property_read_u32(dev->of_node, "bank-width", &val)) {
>> -               if (val == 2) {
>> -                       plat->options |= NAND_BUSWIDTH_16;
>> -               } else if (val != 1) {
>> -                       dev_err(dev, "invalid bank-width %u\n", val);
>> -                       return -EINVAL;
>> -               }
>> -       }
>> +       /* Deprecated since 3.11-rc2 */
>
> I doubt this patch will be included in 3.11-rc2 :) This is material
> for the next merge window.
>
>> +       if (of_find_property(dev->of_node, "bank-width", NULL))
>> +               dev_notice(dev, "Property \"bank-width\" is deprecated");
>
> If you don't totally kill this property (per my comments above), then
> you probably don't want this message either. It's probably safe to
> just ignore the property, if we can reliably auto-detect it instead.
>
>>         plat->gpio_rdy = of_get_gpio(dev->of_node, 0);
>>         plat->gpio_nce = of_get_gpio(dev->of_node, 1);
>> @@ -223,6 +218,14 @@ static int gpio_nand_probe(struct platform_device *pdev)
>>         if (IS_ERR(chip->IO_ADDR_R))
>>                 return PTR_ERR(chip->IO_ADDR_R);
>>
>> +       ret = gpio_nand_get_config(&pdev->dev, &gpiomtd->plat);
>> +       if (ret)
>> +               return ret;
>> +
>> +       gpiomtd->plat.options &= ~(NAND_BUSWIDTH_16 | NAND_BUSWIDTH_AUTO);
>> +       if (resource_size(res) > 1)
>> +               gpiomtd->plat.options |= NAND_BUSWIDTH_AUTO;
>> +
>>         res = gpio_nand_get_io_sync(pdev);
>>         if (res) {
>>                 gpiomtd->io_sync = devm_ioremap_resource(&pdev->dev, res);
>> @@ -230,10 +233,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
>>                         return PTR_ERR(gpiomtd->io_sync);
>>         }
>>
>> -       ret = gpio_nand_get_config(&pdev->dev, &gpiomtd->plat);
>> -       if (ret)
>> -               return ret;
>> -
>>         ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nce, "NAND NCE");
>>         if (ret)
>>                 return ret;
>
> Brian
