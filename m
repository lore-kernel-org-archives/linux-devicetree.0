From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 2/5] mtd: nand: gpmi: add i.MX 7 SoC support
Date: Thu, 20 Apr 2017 20:15:43 -0700
Message-ID: <5cf26d2b020392c875464c7504a9fb5b@agner.ch>
References: <20170421010755.18025-1-stefan@agner.ch>
 <20170421010755.18025-3-stefan@agner.ch>
 <af3fe671-c5fb-d3cf-c891-e6b7c973baa1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <af3fe671-c5fb-d3cf-c891-e6b7c973baa1@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, richard@nod.at, cyrille.pitchen@atmel.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, kernel@pengutronix.de, han.xu@nxp.com, fabio.estevam@freescale.com, LW@karo-electronics.de, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2017-04-20 19:03, Marek Vasut wrote:
> On 04/21/2017 03:07 AM, Stefan Agner wrote:
>> Add support for i.MX 7 SoC. The i.MX 7 has a slightly different
>> clock architecture requiring only two clocks to be referenced.
>> The IP is slightly different compared to i.MX 6SoloX, but currently
>> none of this differences are in use so there is no detection needed
>> and the driver can reuse IS_MX6SX.
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> index c8bbf5da2ab8..4a45d37ddc80 100644
>> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> @@ -127,6 +127,18 @@ static const struct gpmi_devdata gpmi_devdata_imx6sx = {
>>  	.clks_count = ARRAY_SIZE(gpmi_clks_for_mx6),
>>  };
>>
>> +static const char * const gpmi_clks_for_mx7d[] = {
>> +	"gpmi_io", "gpmi_bch_apb",
>> +};
>> +
>> +static const struct gpmi_devdata gpmi_devdata_imx7d = {
>> +	.type = IS_MX6SX,
> 
> Would it make sense to use IS_MX7 here already to prevent future surprises ?
> 

Yeah I was thinking we can do it once we have an actual reason to
distinguish.

But then, adding the type would only require 2-3 lines of change if I
add it to the GPMI_IS_MX6 macro...

--
Stefan

>> +	.bch_max_ecc_strength = 62,
>> +	.max_chain_delay = 12,
>> +	.clks = gpmi_clks_for_mx7d,
>> +	.clks_count = ARRAY_SIZE(gpmi_clks_for_mx7d),
>> +};
>> +
>>  static irqreturn_t bch_irq(int irq, void *cookie)
>>  {
>>  	struct gpmi_nand_data *this = cookie;
>> @@ -2071,6 +2083,9 @@ static const struct of_device_id gpmi_nand_id_table[] = {
>>  	}, {
>>  		.compatible = "fsl,imx6sx-gpmi-nand",
>>  		.data = &gpmi_devdata_imx6sx,
>> +	}, {
>> +		.compatible = "fsl,imx7d-gpmi-nand",
>> +		.data = &gpmi_devdata_imx7d,
>>  	}, {}
>>  };
>>  MODULE_DEVICE_TABLE(of, gpmi_nand_id_table);
>>
