From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] Documentation: add the binding file for Freescale
 imx7d ADC driver
Date: Sun, 11 Oct 2015 14:34:45 +0100
Message-ID: <561A6575.5020905@kernel.org>
References: <1444301948-21721-1-git-send-email-haibo.chen@freescale.com>
 <1444301948-21721-2-git-send-email-haibo.chen@freescale.com>
 <561A64B7.6000006@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <561A64B7.6000006-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haibo Chen <haibo.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/10/15 14:31, Jonathan Cameron wrote:
> On 08/10/15 11:59, Haibo Chen wrote:
>> The patch adds the binding file for Freescale imx7d ADC driver.
>>
>> Signed-off-by: Haibo Chen <haibo.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Couple of trivial typos..  otherwise fine.
>> ---
>>  .../devicetree/bindings/iio/adc/imx7d-adc.txt      | 26 ++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt b/Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt
>> new file mode 100644
>> index 0000000..6b21fd27
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/imx7d-adc.txt
>> @@ -0,0 +1,26 @@
>> +Freescale imx7d ADC bindings
>> +
>> +The devicetree bingdings are for the nwe ADC driver written for
>> +imx7d SoC.
> bindings and new
Actually I'd drop the new.  Makes sense in a patch comment, but
in the docs it'll rapidly stop being new.

>> +
>> +Required properties:
>> +- compatible: Should be "fsl,imx7d-adc"
>> +- reg: Offset and length of the register set for the ADC device
>> +- interrupts: The interrupt number for the ADC device
>> +- clocks: The root clock of the ADC controller
>> +- clock-names: Must contain "adc", matching entry in the clocks property
>> +- vref-supply: The regulator supply ADC reference voltage
>> +
>> +Optional properties:
>> +- num-channels: the number of channels used
>> +
>> +Example:
>> +adc1: adc@30610000 {
>> +	compatible = "fsl,imx7d-adc";
>> +	reg = <0x30610000 0x10000>;
>> +	interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
>> +	clocks = <&clks IMX7D_ADC_ROOT_CLK>;
>> +	clock-names = "adc";
>> +	num-channels = <4>;
>> +	vref-supply = <&reg_vcc_3v3_mcu>;
>> +};
>>
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
