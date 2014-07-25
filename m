From: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] mtd: add driver for the flash in Lattice machxo2 FPGAs
Date: Fri, 25 Jul 2014 10:03:29 +0200
Message-ID: <53D20F51.2090705@parkeon.com>
References: <20140724162225.22308.66538.stgit@localhost> <53D1D8ED.4010209@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53D1D8ED.4010209-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi and thank you for your review.

On 25/07/14 06:11, Varka Bhadram wrote:
> On 07/24/2014 09:52 PM, Martin Fuzzey wrote:
>> This driver provides two MTD devices, one for the configuration data
>> (FPGA bitstream) and another for the general purpose user flash.
>>
>> Both behave as normal MTD devices bit the configuration one has
>> some extra sysfs entries to synchronize updating.
>>
>> Signed-off-by: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>
>> +#include <linux/delay.h>
>> +#include <linux/slab.h>
>> +#include <linux/module.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>
> Includes in alphabetical order...
>
Ok done for V2
>> +
>> +static void machxo2_lock(struct machxo2 *machxo2)
>> +{
>> +    if (!mutex_trylock(&machxo2->lock)) {
>> +        dev_dbg(machxo2->dev, "wait for %s from %pf\n",
>> +                __func__, __builtin_return_address(0));
>> +
>
> dev_dbg(machxo2->dev, "wait for %s from %pf\n",
>     __func__, __builtin_return_address(0));
>

Sorry, not understanding here.
You want the second line to be LESS intented??

Coding style (chapter 2) says:
     Descendants are always substantially shorter than the parent and
     are placed substantially to the right

Idem for the others

> +static int machxo2_transceive(
>> +            struct machxo2 *machxo2,
>> +            const void *send_buf, unsigned send_len,
>> +            void *recv_buf, unsigned recv_len)
>
> static int machxo2_transceive(struct machxo2 *machxo2,
>                   const void *send_buf, unsigned send_len,
>                   void *recv_buf, unsigned recv_len)
>
Ok done for V2

>
>> +static const struct spi_device_id machxo2_spi_device_id[] = {
>> +    {
>> +        .name = "machxo2",
>> +    }, {
>> +        /* sentinel */
>> +    }
>> +};
>> +MODULE_DEVICE_TABLE(spi, machxo2_spi_device_id);
>> +
>> +static const struct of_device_id machxo2_dt_ids[] = {
>> +    { .compatible = "lattice,machxo2"},
>> +    { /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, machxo2_dt_ids);
>> +
>
> move the device ids after probe()/remove()...
>
Ok done for V2

>> +
>> +static int  machxo2_spi_transceive(
>> +            struct device *dev,
>> +            const void *send_buf, unsigned send_len,
>> +            void *recv_buf, unsigned recv_len)
>
> proper alignment...
>
> static int  machxo2_spi_transceive(struct device *dev,
>                    const void *send_buf, unsigned send_len,
>                    void *recv_buf, unsigned recv_len)
>
Ok done for V2

>
>> +static struct spi_driver machxo2_spi_driver = {
>> +    .id_table = machxo2_spi_device_id,
>> +    .driver = {
>> +        .name    = "machxo2",
>> +        .owner    = THIS_MODULE,
>
> we can drop owner field...
>
Ok done for V2

>> +        .of_match_table = machxo2_dt_ids,
>> +    },
>> +    .probe        = machxo2_spi_probe,
>> +    .remove        = machxo2_spi_remove,
>> +};
>> +
>> +
>> +static int __init machxo2_init(void)
>> +{
>> +    return spi_register_driver(&machxo2_spi_driver);
>> +}
>> +subsys_initcall(machxo2_init);
>> +
>> +static void __exit machxo2_exit(void)
>> +{
>> +    spi_unregister_driver(&machxo2_spi_driver);
>> +}
>> +module_exit(machxo2_exit);
>> +
>
> module_spi_driver()...?
>
Yes, done for V2

>> +struct machxo2;
>> +struct machxo2_busops {
>> +    int (*transceive)(
>> +            struct device *dev,
>> +            const void *send_buf, unsigned send_len,
>> +            void *recv_buf, unsigned recv_len);
>> +};
>> +
>
> proper indentation...
>
> int (*transceive)(struct device *dev,
>           const void *send_buf, unsigned send_len,
>           void *recv_buf, unsigned recv_len);
>
Ok, done for V2

>> +struct machxo2 *machxo2_create(struct device *dev,
>> +            struct machxo2_busops *busops);
>> +
>
> struct machxo2 *machxo2_create(struct device *dev,
>                    struct machxo2_busops *busops);
>
>
Same again - is it just too much indenting?
I don't see anything wrong here

>
> This patch has coding style problems.. run checkpatch on this patch..
>
I did, before submission (with the 3.6.16-rc6 checkpatch).
The only thing it complained about was one Kconfig which I couldn't see 
a way to improve

WARNING: please write a paragraph that describes the config symbol fully
#202: FILE: drivers/mtd/devices/Kconfig:148:
+config MTD_MACHXO2_SPI

total: 0 errors, 1 warnings, 1248 lines checked

/tmp/fpga-machxo2 has style problems, please review.

If any of these errors are false positives, please report
them to the maintainer, see CHECKPATCH in MAINTAINERS.


Regards,

Martin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
