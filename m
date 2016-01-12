From: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V10 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Date: Tue, 12 Jan 2016 10:11:02 +0530
Message-ID: <569483DE.4070901@ti.com>
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <1452486886-8049-2-git-send-email-marex@denx.de>
 <5693D3B4.2090304@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5693D3B4.2090304-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 01/11/2016 09:39 PM, Dinh Nguyen wrote:
> On 01/10/2016 10:34 PM, Marek Vasut wrote:
>> From: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>
>> Add support for the Cadence QSPI controller. This controller is
>> present in the Altera SoCFPGA SoCs and this driver has been tested
>> on the Cyclone V SoC.
>>

[...]

>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
>> index 43bafde..7e29050 100644
>> --- a/drivers/mtd/spi-nor/Kconfig
>> +++ b/drivers/mtd/spi-nor/Kconfig
>> @@ -50,4 +50,15 @@ config SPI_NXP_SPIFI
>>  	  Flash. Enable this option if you have a device with a SPIFI
>>  	  controller and want to access the Flash as a mtd device.
>>  
>> +config SPI_CADENCE_QUADSPI
>> +	tristate "Cadence Quad SPI controller"
>> +	depends on OF && (ARCH_SOCFPGA || COMPILE_TEST)
> 
> I think you can remove the ARCH_SOCFPGA dependency as this driver is
> used on a TI EVM as well.

I think above usage is correct. This will enable SPI_CADENCE_QUADSPI to
be selected when ARCH_SOCFPGA=y without having to enable COMPILE_TEST.
AFAIK, COMPILE_TEST is used usually to build test the driver w/o having
to enable ARCH specific configs (usually by maintainers).
For TI EVM, I would patch this file to add my architecture later(i.e
along with DT patch to my board).

-- 
Regards
Vignesh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
