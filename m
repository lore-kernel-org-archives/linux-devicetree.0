From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Subject: Re: [PATCH v3 1/5] mtd: spi-nor: add memory controllers for the
 Aspeed AST2500 SoC
Date: Mon, 12 Dec 2016 10:57:10 +0100
Message-ID: <4e6a5528-cd26-582c-3ddf-33db0194d024@kaod.org>
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
 <1481302167-28044-2-git-send-email-clg@kaod.org>
 <CACPK8XeTw4uNCjzp7qmbwkojrSAJw_U=7vXD-wTjDL2gb220qQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACPK8XeTw4uNCjzp7qmbwkojrSAJw_U=7vXD-wTjDL2gb220qQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/12/2016 06:02 AM, Joel Stanley wrote:
> On Sat, Dec 10, 2016 at 3:49 AM, Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote:
> 
>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
>> index 4a682ee0f632..5c0efbd9dd89 100644
>> --- a/drivers/mtd/spi-nor/Kconfig
>> +++ b/drivers/mtd/spi-nor/Kconfig
>> @@ -29,6 +29,16 @@ config MTD_SPI_NOR_USE_4K_SECTORS
>>           Please note that some tools/drivers/filesystems may not work with
>>           4096 B erase size (e.g. UBIFS requires 15 KiB as a minimum).
>>
>> +config SPI_ASPEED
>> +       tristate "Aspeed flash controllers in SPI mode"
>> +       depends on ARCH_ASPEED || COMPILE_TEST
>> +       depends on HAS_IOMEM && OF
>> +       help
>> +         This enables support for the Firmware Memory controller (FMC)
>> +         in the Aspeed AST2500 SoC when attached to SPI NOR chips,
>> +         and support for the SPI flash memory controller (SPI) for
>> +         the host firmware. The implementation only supports SPI NOR.
>> +
>>  config SPI_ATMEL_QUADSPI
>>         tristate "Atmel Quad SPI Controller"
>>         depends on ARCH_AT91 || (ARM && COMPILE_TEST)
>> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
>> index 121695e83542..d73d772c689c 100644
>> --- a/drivers/mtd/spi-nor/Makefile
>> +++ b/drivers/mtd/spi-nor/Makefile
>> @@ -1,4 +1,5 @@
>>  obj-$(CONFIG_MTD_SPI_NOR)      += spi-nor.o
>> +obj-$(CONFIG_SPI_ASPEED)       += aspeed-smc.o
> 
> Can we make the symbol CONFIG_SPI_ASPEED_SMC?

sure. I will change the config option name and leave room for a 
potential generic SPI driver.

Thanks,

C. 

> Brendan has proposed a generic SPI master driver for the Aspeed SoC
> that would allow the controller to be used for non-flash devices. The
> obvious symbol for that driver is CONFIG_SPI_ASPEED.
> 
> Cheers,
> 
> Joel
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
