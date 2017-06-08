From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v5 2/3] ARM: dts: imx7: add GPMI NAND and APBH DMA
Date: Thu, 08 Jun 2017 15:23:05 -0700
Message-ID: <956085c409415e76adcf4b429d8dc0b5@agner.ch>
References: <cover.b62c3a17bd60de48d8fb2ade6dde4f2bc60aaf3c.1496730576.git-series.stefan@agner.ch>
 <151ddece1e1427d0b69c4ff11b86a69b6a035d0d.1496730576.git-series.stefan@agner.ch>
 <9d66efda-d7c1-89a2-e163-c86056e08fb1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9d66efda-d7c1-89a2-e163-c86056e08fb1-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, "A.S. Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, "LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org" <LW-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-06-07 08:33, Han Xu wrote:
> On 06/06/2017 01:30 AM, Stefan Agner wrote:
>> Add i.MX 7 APBH DMA and GPMI NAND modules.
>>
>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/imx7s.dtsi | 32 ++++++++++++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
>> index c4f12fd..d71acd8 100644
>> --- a/arch/arm/boot/dts/imx7s.dtsi
>> +++ b/arch/arm/boot/dts/imx7s.dtsi
>> @@ -995,5 +995,37 @@
>>   				status = "disabled";
>>   			};
>>   		};
>> +
>> +		dma_apbh: dma-apbh@33000000 {
>> +			compatible = "fsl,imx7d-dma-apbh", "fsl,imx28-dma-apbh";
>> +			reg = <0x33000000 0x2000>;
>> +			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "gpmi0", "gpmi1", "gpmi2", "gpmi3";
>> +			#dma-cells = <1>;
>> +			dma-channels = <4>;
>> +			clocks = <&clks IMX7D_NAND_USDHC_BUS_RAWNAND_CLK>;
>> +			clock-names = "dma_apbh_bch", "dma_apbh_io";
> 
> please remove the clock names, I am good with all other changes.

Oh missed that, will do and send v6.

--
Stefan

>> +		};
>> +
>> +		gpmi: gpmi-nand@33002000{
>> +			compatible = "fsl,imx7d-gpmi-nand";
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			reg = <0x33002000 0x2000>, <0x33004000 0x4000>;
>> +			reg-names = "gpmi-nand", "bch";
>> +			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "bch";
>> +			clocks = <&clks IMX7D_NAND_RAWNAND_CLK>,
>> +				<&clks IMX7D_NAND_USDHC_BUS_RAWNAND_CLK>;
>> +			clock-names = "gpmi_io", "gpmi_bch_apb";
>> +			dmas = <&dma_apbh 0>;
>> +			dma-names = "rx-tx";
>> +			status = "disabled";
>> +			assigned-clocks = <&clks IMX7D_NAND_ROOT_SRC>;
>> +			assigned-clock-parents = <&clks IMX7D_PLL_ENET_MAIN_500M_CLK>;
>> +		};
>>   	};
>>   };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
