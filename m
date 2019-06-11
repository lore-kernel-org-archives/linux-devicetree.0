From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCHv4 2/2] mtd: spi-nor: cadence-quadspi: add reset control
Date: Tue, 11 Jun 2019 16:35:05 -0500
Message-ID: <69a85f50-da43-f8f2-d959-6152fbcf95dc@kernel.org>
References: <20190508134338.20565-1-dinguyen@kernel.org>
 <20190508134338.20565-2-dinguyen@kernel.org>
 <73c8c69a-0756-811f-7a75-dd2255db7d7b@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <73c8c69a-0756-811f-7a75-dd2255db7d7b@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: marex@denx.de, dwmw2@infradead.org, computersforpeace@gmail.com, bbrezillon@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, tien.fong.chee@intel.com
List-Id: devicetree@vger.kernel.org



On 6/6/19 3:26 AM, Tudor.Ambarus@microchip.com wrote:
> 
> 
> On 05/08/2019 04:43 PM, Dinh Nguyen wrote:
>> Get the reset control properties for the QSPI controller and bring them
>> out of reset. Most will have just one reset bit, but there is an additional
>> OCP reset bit that is used ECC. The OCP reset bit will also need to get
>> de-asserted as well. [1]
>>
> 
> It's always good to say why the change is needed, e.g. reset the controller at
> init to have it in a clean state in case the bootloader messed with it.

Will update..

> 
>> [1] https://www.intel.com/content/www/us/en/programmable/hps/arria-10/hps.html#reg_soc_top/sfo1429890575955.html
>>
>> Suggested-by: Tien-Fong Chee <tien.fong.chee@intel.com>
>> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
>> ---
>> v4: fix compile error
>> v3: return full error by using PTR_ERR(rtsc)
>>     move reset control calls until after the clock enables
>>     use udelay(2) to be safe
>>     Add optional OCP(Open Core Protocol) reset signal
>> v2: use devm_reset_control_get_optional_exclusive
>>     print an error message
>>     return -EPROBE_DEFER
>> ---
>>  drivers/mtd/spi-nor/cadence-quadspi.c | 30 +++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
>> index 792628750eec..d3906e5a1d44 100644
>> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
>> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
>> @@ -34,6 +34,7 @@
>>  #include <linux/of.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_runtime.h>
>> +#include <linux/reset.h>
>>  #include <linux/sched.h>
>>  #include <linux/spi/spi.h>
>>  #include <linux/timer.h>
>> @@ -1336,6 +1337,8 @@ static int cqspi_probe(struct platform_device *pdev)
>>  	struct cqspi_st *cqspi;
>>  	struct resource *res;
>>  	struct resource *res_ahb;
>> +	struct reset_control *rstc;
>> +	struct reset_control *rstc_ocp;
>>  	const struct cqspi_driver_platdata *ddata;
>>  	int ret;
>>  	int irq;
>> @@ -1402,6 +1405,33 @@ static int cqspi_probe(struct platform_device *pdev)
>>  		goto probe_clk_failed;
>>  	}
>>  
>> +	/* Obtain QSPI reset control */
>> +	rstc = devm_reset_control_get_optional_exclusive(dev, "qspi");
>> +	if (IS_ERR(rstc)) {
>> +		dev_err(dev, "Cannot get QSPI reset.\n");
>> +		if (PTR_ERR(rstc) == -EPROBE_DEFER)
> 
> what I meant was to get rid of this if and return PTR_ERR(rstc) directly.
> 

Okay..

>> +			return PTR_ERR(rstc);
>> +	}
>> +
>> +	rstc_ocp = devm_reset_control_get_optional_exclusive(dev, "qspi-ocp");
>> +	if (IS_ERR(rstc_ocp)) {
>> +		dev_err(dev, "Cannot get QSPI OCP reset.\n");
>> +		if (PTR_ERR(rstc_ocp) == -EPROBE_DEFER)
>> +			return PTR_ERR(rstc_ocp);
>> +	}
>> +
>> +	if (rstc) {> +		reset_control_assert(rstc);
>> +		udelay(2);
> 
> why 2us? what's the appropriate length of time that we should wait between
> assert and deassert?
> 

This length hasn't been documented anywhere. I've tested with both 2us
and none, and both cases seem to be working fine. 2us was something I
saw in the STM32 driver. I'll remove it.

>> +		reset_control_deassert(rstc);
>> +	}
>> +
>> +	if (rstc_ocp) {
>> +		reset_control_assert(rstc_ocp);
> 
> Does it mater the order in which you assert these signals? can we group these
> module resets asserts, i.e. first do the assert for both rstc and rstcp and then
> the deassert?
> 
>> +		udelay(2);
>> +		reset_control_deassert(rstc_ocp);
> Is software deassert needed? I'm looking at [2], Table 46. PER1 Group, Generated
> Module Resets, and it seems that software deassert is not an option for
> qspi_flash_ecc_rst_n
> 
> [2]https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/hb/arria-10/a10_5v4.pdf
>

I believe this is a mistake. QSPI is not working for me if I don't do a
software reset deassert on the ocp bit.

Dinh
