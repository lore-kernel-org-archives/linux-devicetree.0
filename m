From: Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: cadence-quadspi: Add support for
 Octal SPI controller
Date: Mon, 21 Jan 2019 11:28:30 +0530
Message-ID: <1fc56694-fdac-ea99-79d3-cd0fad196c3c@ti.com>
References: <20190116103027.22657-1-vigneshr@ti.com>
 <20190116103027.22657-3-vigneshr@ti.com>
 <6e6f7c3a-4772-1a17-0f5f-547ea9809283@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <6e6f7c3a-4772-1a17-0f5f-547ea9809283@microchip.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Cc: "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi, Tudor,

On 20/01/19 8:26 PM, Tudor.Ambarus@microchip.com wrote:
> Hi, Vignesh,
> 
> On 01/16/2019 12:30 PM, Vignesh R wrote:
>> Cadence OSPI controller IP supports Octal IO (x8 IO lines),
>> It also has an integrated PHY. IP register layout is very
>> similar to existing QSPI IP except for additional bits to support Octal
>> and Octal DDR mode. Therefore, extend current driver to support Octal
>> mode.
>>
>> Signed-off-by: Vignesh R <vigneshr@ti.com>
>> ---
>> v3: No changes
>>
>> v2:
>> Declare Octal mode capability based on compatible.
>>
>>  drivers/mtd/spi-nor/cadence-quadspi.c | 54 +++++++++++++++++++++------
>>  1 file changed, 42 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
>> index 04cedd3a2bf6..31ed50f78972 100644
>> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
>> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
>> @@ -93,6 +93,11 @@ struct cqspi_st {
>>  	struct cqspi_flash_pdata f_pdata[CQSPI_MAX_CHIPSELECT];
>>  };
>>  
>> +struct cqspi_driver_platdata {
>> +	u32 hwcaps_mask;
>> +	u8 quirks;
>> +};
>> +
>>  /* Operation timeout value */
>>  #define CQSPI_TIMEOUT_MS			500
>>  #define CQSPI_READ_TIMEOUT_MS			10
>> @@ -101,6 +106,7 @@ struct cqspi_st {
>>  #define CQSPI_INST_TYPE_SINGLE			0
>>  #define CQSPI_INST_TYPE_DUAL			1
>>  #define CQSPI_INST_TYPE_QUAD			2
>> +#define CQSPI_INST_TYPE_OCTAL			3
>>  
>>  #define CQSPI_DUMMY_CLKS_PER_BYTE		8
>>  #define CQSPI_DUMMY_BYTES_MAX			4
>> @@ -911,6 +917,9 @@ static int cqspi_set_protocol(struct spi_nor *nor, const int read)
>>  		case SNOR_PROTO_1_1_4:
>>  			f_pdata->data_width = CQSPI_INST_TYPE_QUAD;
>>  			break;
>> +		case SNOR_PROTO_1_1_8:
>> +			f_pdata->data_width = CQSPI_INST_TYPE_OCTAL;
>> +			break;
>>  		default:
>>  			return -EINVAL;
>>  		}
>> @@ -1213,21 +1222,19 @@ static void cqspi_request_mmap_dma(struct cqspi_st *cqspi)
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
>> +	struct cqspi_driver_platdata *ddata;
> 
> const struct cqspi_driver_platdata *ddata;
> 
>> +	struct spi_nor_hwcaps hwcaps;
>>  	struct cqspi_flash_pdata *f_pdata;
>>  	struct spi_nor *nor;
>>  	struct mtd_info *mtd;
>>  	unsigned int cs;
>>  	int i, ret;
>>  
>> +	ddata = (struct cqspi_driver_platdata *)of_device_get_match_data(dev);
> 
> You forgot to check for NULL. Also, I would expect an implicit type cast, you
> can drop the explicit cast.
> 
>> +	hwcaps.mask = ddata->hwcaps_mask;
>> +
>>  	/* Get flash device data */
>>  	for_each_available_child_of_node(dev->of_node, np) {
>>  		ret = of_property_read_u32(np, "reg", &cs);
>> @@ -1310,7 +1317,7 @@ static int cqspi_probe(struct platform_device *pdev)
>>  	struct cqspi_st *cqspi;
>>  	struct resource *res;
>>  	struct resource *res_ahb;
>> -	unsigned long data;
>> +	struct cqspi_driver_platdata *ddata;
> 
> const struct cqspi_driver_platdata *ddata;
> 
>>  	int ret;
>>  	int irq;
>>  
>> @@ -1377,8 +1384,8 @@ static int cqspi_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
>> -	data  = (unsigned long)of_device_get_match_data(dev);
>> -	if (data & CQSPI_NEEDS_WR_DELAY)
>> +	ddata  = (struct cqspi_driver_platdata *)of_device_get_match_data(dev);
> 
> I would expect an implicit type cast, you can drop the explicit cast.
> 
>> +	if (ddata && (ddata->quirks & CQSPI_NEEDS_WR_DELAY))
>>  		cqspi->wr_delay = 5 * DIV_ROUND_UP(NSEC_PER_SEC,
>>  						   cqspi->master_ref_clk_hz);
>>  
>> @@ -1460,14 +1467,37 @@ static const struct dev_pm_ops cqspi__dev_pm_ops = {
>>  #define CQSPI_DEV_PM_OPS	NULL
>>  #endif
>>  
>> +#define cqspi_base_hwcaps_mask					\
>> +	(SNOR_HWCAPS_READ | SNOR_HWCAPS_READ_FAST |		\
>> +	SNOR_HWCAPS_READ_1_1_2 | SNOR_HWCAPS_READ_1_1_4 |	\
>> +	SNOR_HWCAPS_PP)
>> +
>> +static const struct cqspi_driver_platdata cdns_qspi = {
>> +	.hwcaps_mask = cqspi_base_hwcaps_mask,
>> +};
>> +
>> +static const struct cqspi_driver_platdata k2g_qspi = {
>> +	.hwcaps_mask = cqspi_base_hwcaps_mask,
>> +	.quirks = CQSPI_NEEDS_WR_DELAY,
>> +};
>> +
>> +static const struct cqspi_driver_platdata am654_ospi = {
>> +	.hwcaps_mask = cqspi_base_hwcaps_mask | SNOR_HWCAPS_READ_1_1_8,
>> +	.quirks = CQSPI_NEEDS_WR_DELAY,
>> +};
>> +
>>  static const struct of_device_id cqspi_dt_ids[] = {
>>  	{
>>  		.compatible = "cdns,qspi-nor",
>> -		.data = (void *)0,
>> +		.data = (void *)&cdns_qspi,
> 
> You can drop the (void *) cast.
> 
> Looks good. Did you test the octal mode with mt35xu512aba? If yes, it would be
> nice to specify this in the commit message.
> 

Yes, octal mode was tested with mt35xu512aba flash. I will address all
the comments in v4. Thanks for the review!


-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
