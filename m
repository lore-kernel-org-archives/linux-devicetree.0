From: Fugang Duan <fugang.duan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v2 3/3] Documentation: add the binding file for
 Freescale vf610 ADC driver
Date: Tue, 26 Nov 2013 05:46:32 +0000
Message-ID: <9848F2DB572E5649BA045B288BE08FBE01895845@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1385430172-16642-1-git-send-email-B38611@freescale.com>
 <1385430172-16642-4-git-send-email-B38611@freescale.com>
 <20131126050805.GL30476@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131126050805.GL30476-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Content-Language: en-US
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Shawn Guo [mailto:shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org]
Sent: Tuesday, November 26, 2013 1:08 PM

>To: Duan Fugang-B38611
>Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; Li Frank-B20596; linux-
>iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>Subject: Re: [PATCH v2 3/3] Documentation: add the binding file for Freescale
>vf610 ADC driver
>
>On Tue, Nov 26, 2013 at 09:42:52AM +0800, Fugang Duan wrote:
>> The patch adds the binding file for Freescale vf610 ADC driver.
>>
>> Signed-off-by: Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> ---
>>  .../devicetree/bindings/iio/adc/vf610-adc.txt      |   57
>++++++++++++++++++++
>>  1 files changed, 57 insertions(+), 0 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/vf610-adc.txt
>> b/Documentation/devicetree/bindings/iio/adc/vf610-adc.txt
>> new file mode 100644
>> index 0000000..df370c5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/vf610-adc.txt
>> @@ -0,0 +1,57 @@
>> +Freescale vf610 Analog to Digital Converter bindings
>> +
>> +The devicetree bindings are for the new ADC driver written for
>> +vf610/i.MX6slx and upward SoCs from Freescale.
>> +
>> +Required properties:
>> +- compatible: Should be "fsl,vf610-adc"
>> +  (* the future compatible expander for i.MX6slx, i.MX7 will be
>> +"fsl,imx-adc")
>
>Drop this line.  You can extend the bindings when new compatible is needed.

I will drop it in next version of the patch set.
Thanks.

>
>> +- reg: Offset and length of the register set for the device
>> +- interrupts: Should contain the interrupt for the device
>> +- clocks: The clocks needed by the ADC controller
>> +- clock-names: the name of the clocks
>> +
>> +Optional properties:
>> +- vf610,adc-io-pinctl: Enable field for the I/O port control of MCU pins
>used as analog inputs.
>
>Use prefix "fsl," instead of "vf610,".
>
>Shawn
>

Agree. I will replace all the prefix "vf610," with "fsl," in next version of this patch set.

Thanks.

>> +- vf610,adc-vref: ADC refrence voltage value, unit is uV.
>> +- vf610,adc-clk-div: Current clock divider value, such as 1,2,4,8,16 and so
>on.
>> +- vf610,adc-res: ADC conversion mode selection, such as 8 for 8-bit, 10 for
>10-bit, 12 for 12-bit mode.
>> +- vf610,adc-sam-time: ADC sample time duration, number of ADC clocks,
>> +such as 2, 4, 6, 8, 12, 16, 20, 24
>> +- vf610,adc-aver-sam-sel: Determines how many ADC conversions will be
>averaged to create the ADC average result.
>> +			The Optional value is 4, 8, 16, 32.
>> +- vf610,adc-hw-aver-en: Bool type to decide enable hardware average function.
>> +- vf610,adc-low-power-mode: Bool type to decide enable ADC low power mode.
>> +- vf610,adc-high-speed-conv: Bool type to decide enable ADC high speed mode.
>> +
>> +Example:
>> +adc0: adc@4003b000 {
>> +	compatible = "fsl,vf610-adc";
>> +	reg = <0x4003b000 0x1000>;
>> +	interrupts = <0 53 0x04>;
>> +	clocks = <&clks VF610_CLK_ADC0>;
>> +	clock-names = "adc";
>> +	status = "disabled";
>> +};
>> +
>> +adc1: adc@400bb000 {
>> +	compatible = "fsl,vf610-adc";
>> +	reg = <0x400bb000 0x1000>;
>> +	interrupts = <0 54 0x04>;
>> +	clocks = <&clks VF610_CLK_ADC1>;
>> +	clock-names = "adc";
>> +	status = "disabled";
>> +};
>> +
>> +&adc0 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_adc0_ad5>;
>> +	vf610,adc-io-pinctl = <0x20>;
>> +	vf610,adc-vref = <3300000>;
>> +	vf610,adc-clk-div = <2>;
>> +	vf610,adc-res = <12>;
>> +	vf610,adc-sam-time = <4>;
>> +	vf610,adc-aver-sam-sel = <4>;
>> +	vf610,adc-hw-aver-en;
>> +	vf610,adc-low-power-mode;
>> +	status = "okay";
>> +};
>> --
>> 1.7.2.rc3
>>
>>
