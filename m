From: Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCH v5 2/2] mtd: spi-nor: cadence-quadspi: Add support for
 Octal SPI controller
Date: Tue, 5 Feb 2019 11:43:46 +0530
Message-ID: <daa35c21-195e-eeb5-8aa2-cf42eff6a554@ti.com>
References: <20190128054935.4972-1-vigneshr@ti.com>
 <20190128054935.4972-3-vigneshr@ti.com>
 <2efbca08-c4ab-34ea-0e34-05aed7168df8@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2efbca08-c4ab-34ea-0e34-05aed7168df8@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Cc: "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 29/01/19 9:02 PM, Tudor.Ambarus@microchip.com wrote:
> 
> 
> On 01/28/2019 07:49 AM, Vignesh R wrote:
>> Cadence OSPI controller IP supports Octal IO (x8 IO lines),
>> It also has an integrated PHY. IP register layout is very
>> similar to existing QSPI IP except for additional bits to support Octal
>> and Octal DDR mode. Therefore, extend current driver to support Octal
>> mode. Only Octal SDR read (1-1-8)mode is supported for now.
>>
>> Tested with mt35xu512aba Octal flash on TI's AM654 EVM.
>>
>> Signed-off-by: Vignesh R <vigneshr@ti.com>
>> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>
>> v5:
>> s/cqsi_base_hwcaps_mask/CQSPI_BASE_HWCAPS_MASK/g
>> Add back cqspi_driver_platdata definition for base compatible.
>>
>> v4: Fix comments by Tudor on v3
>> v3: No changes
>> v2: Declare Octal mode capability based on compatible.
>>
>>  drivers/mtd/spi-nor/cadence-quadspi.c | 58 +++++++++++++++++++++------
>>  1 file changed, 46 insertions(+), 12 deletions(-)
[...]
>>  
>>  static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>>  {
>> -	const struct spi_nor_hwcaps hwcaps = {
>> -		.mask = SNOR_HWCAPS_READ |
>> -			SNOR_HWCAPS_READ_FAST |
>> -			SNOR_HWCAPS_READ_1_1_2 |
>> -			SNOR_HWCAPS_READ_1_1_4 |
>> -			SNOR_HWCAPS_PP,
>> -	};
>>  	struct platform_device *pdev = cqspi->pdev;
>>  	struct device *dev = &pdev->dev;
>> +	const struct cqspi_driver_platdata *ddata;
>> +	struct spi_nor_hwcaps hwcaps;
>>  	struct cqspi_flash_pdata *f_pdata;
>>  	struct spi_nor *nor;
>>  	struct mtd_info *mtd;
>>  	unsigned int cs;
>>  	int i, ret;
>>  
>> +	ddata = of_device_get_match_data(dev);
>> +	if (!ddata)
>> +		hwcaps.mask = CQSPI_BASE_HWCAPS_MASK;
> 
> Now that .data is set in all cqspi_dt_ids[], maybe it's better to print a
> message and return an error here. But I guess it's a matter of taste, so not a
> show stopper.

Since, driver data is kernel internal field, I guess there is little
help in printing out the error to the user when its missing. I prefer to
keep this as is, as basic Quad mode is supported by all versions of the IP.

Regards
Vignesh

> 
>> +	else
>> +		hwcaps.mask = ddata->hwcaps_mask;
>> +
>>  	/* Get flash device data */
>>  	for_each_available_child_of_node(dev->of_node, np) {
>>  		ret = of_property_read_u32(np, "reg", &cs);
>> @@ -1310,7 +1326,7 @@ static int cqspi_probe(struct platform_device *pdev)
>>  	struct cqspi_st *cqspi;
>>  	struct resource *res;
>>  	struct resource *res_ahb;
>> -	unsigned long data;
>> +	const struct cqspi_driver_platdata *ddata;
>>  	int ret;
>>  	int irq;
>>  
>> @@ -1377,8 +1393,8 @@ static int cqspi_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
>> -	data  = (unsigned long)of_device_get_match_data(dev);
>> -	if (data & CQSPI_NEEDS_WR_DELAY)
>> +	ddata  = of_device_get_match_data(dev);
>> +	if (ddata && (ddata->quirks & CQSPI_NEEDS_WR_DELAY))
>>  		cqspi->wr_delay = 5 * DIV_ROUND_UP(NSEC_PER_SEC,
>>  						   cqspi->master_ref_clk_hz);
>>  
>> @@ -1460,14 +1476,32 @@ static const struct dev_pm_ops cqspi__dev_pm_ops = {
>>  #define CQSPI_DEV_PM_OPS	NULL
>>  #endif
>>  
>> +static const struct cqspi_driver_platdata cdns_qspi = {
>> +	.hwcaps_mask = CQSPI_BASE_HWCAPS_MASK,
>> +};
>> +
>> +static const struct cqspi_driver_platdata k2g_qspi = {
>> +	.hwcaps_mask = CQSPI_BASE_HWCAPS_MASK,
>> +	.quirks = CQSPI_NEEDS_WR_DELAY,
>> +};
>> +
>> +static const struct cqspi_driver_platdata am654_ospi = {
>> +	.hwcaps_mask = CQSPI_BASE_HWCAPS_MASK | SNOR_HWCAPS_READ_1_1_8,
>> +	.quirks = CQSPI_NEEDS_WR_DELAY,
>> +};
>> +
>>  static const struct of_device_id cqspi_dt_ids[] = {
>>  	{
>>  		.compatible = "cdns,qspi-nor",
>> -		.data = (void *)0,
>> +		.data = &cdns_qspi,
>>  	},
>>  	{
>>  		.compatible = "ti,k2g-qspi",
>> -		.data = (void *)CQSPI_NEEDS_WR_DELAY,
>> +		.data = &k2g_qspi,
>> +	},
>> +	{
>> +		.compatible = "ti,am654-ospi",
>> +		.data = &am654_ospi,
>>  	},
>>  	{ /* end of table */ }
>>  };
>>

-- 
Regards
Vignesh
