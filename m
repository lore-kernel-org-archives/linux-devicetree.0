From: Fugang Duan <fugang.duan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v3 2/3] iio:adc:imx: add Freescale Vybrid vf610 adc
 driver
Date: Wed, 27 Nov 2013 05:37:24 +0000
Message-ID: <9848F2DB572E5649BA045B288BE08FBE01898D02@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1385463394-11157-1-git-send-email-B38611@freescale.com>
 <1385463394-11157-3-git-send-email-B38611@freescale.com>
 <20131126142534.GB5402@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131126142534.GB5402-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Content-Language: en-US
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Data: Tuesday, November 26, 2013 10:26 PM

>To: Duan Fugang-B38611
>Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
>shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; Li Frank-B20596; linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>Subject: Re: [PATCH v3 2/3] iio:adc:imx: add Freescale Vybrid vf610 adc driver
>
>On Tue, Nov 26, 2013 at 10:56:33AM +0000, Fugang Duan wrote:
>> Add Freescale Vybrid vf610 adc driver. The driver only support ADC
>> software trigger.
>>
>> Signed-off-by: Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> ---
>>  drivers/iio/adc/Kconfig     |   11 +
>>  drivers/iio/adc/Makefile    |    1 +
>>  drivers/iio/adc/vf610_adc.c |  744
>> +++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 756 insertions(+), 0 deletions(-)
>
>[...]
>
>> +static void vf610_adc_cfg_of_init(struct vf610_adc *info) {
>> +       struct device_node *np = info->dev->of_node;
>> +
>> +       /*
>> +        * set default Configuration for ADC controller
>> +        * This config may upgrade to require from DT
>> +        */
>> +       info->adc_feature.clk_sel = ADCIOC_BUSCLK_SET;
>> +       info->adc_feature.vol_ref = VF610_ADCIOC_VR_VREF_SET;
>> +       info->adc_feature.calibration = true;
>> +       info->adc_feature.tri_hw = false;
>> +       info->adc_feature.dataov_en = true;
>> +       info->adc_feature.ac_clk_en = false;
>> +       info->adc_feature.dma_en = false;
>> +       info->adc_feature.cc_en = false;
>> +       info->adc_feature.cmp_func_en = false;
>> +       info->adc_feature.cmp_range_en = false;
>> +       info->adc_feature.cmp_greater_en = false;
>> +
>> +       if (of_property_read_u32(np, "fsl,adc-io-pinctl",
>> +                       &info->adc_feature.pctl)) {
>> +               info->adc_feature.pctl = VF610_ADC_IOPCTL5;
>> +               dev_info(info->dev,
>> +                       "Miss adc-io-pinctl in dt, enable pin SE5.\n");
>> +       }
>
>Could you elaborate on what this means? What is this doing when pinctrl is not
>specified in the DT?
>

As vf610 reference manually describe ADC pin control:

37.8.2 Input Select and Pin Control
The pin control registers (ADC_PC) disable the I/O port control of the pins used as
analog inputs. When a pin control register bit is set, the following conditions are forced
for the associated MCU pin:
* The output buffer is forced to its high impedance state.
* The input buffer is disabled. A read of the I/O port returns a zero for any pin with its
input buffer disabled.
* The pullup is disabled. 

So, when the relative ADC pin is used as Sliding rheostat test, disable the pin control.


>> +
>> +       if (info->vref)
>> +               info->vref_uv = regulator_get_voltage(info->vref);
>> +       else if (of_property_read_u32(np, "fsl,adc-vref", &info->vref_uv))
>> +               dev_err(info->dev,
>> +                       "Miss adc-vref property or vref regulator in
>> + the DT.\n");
>
>Query the regulator instead.

When the ADC reference voltage is not controlled by regulator, just by fixed voltage from MCU digital power,
We get the reference voltage from DT.
  
>
>> +
>> +       if (of_property_read_u32(np, "fsl,adc-clk-div",
>> +                       &info->adc_feature.clk_div_num)) {
>> +               info->adc_feature.clk_div_num = 2;
>> +               dev_info(info->dev,
>> +                       "Miss adc-clk-div in dt, set divider to 2.\n");
>> +       }
>
>Why do you need this?
>
>I'd expect the use to request a frequency they wanted to sample at, and the
>driver would try its best by fiddling with this and the clock input.
>
>> +
>> +       if (of_property_read_u32(np, "fsl,adc-res",
>> +                       &info->adc_feature.res_mode)) {
>> +               info->adc_feature.res_mode = 12;
>> +               dev_info(info->dev,
>> +                       "Miss adc-res property in dt, use 8bit
>> + mode.\n");
>
>This message does not seem to match the code above it.
>
>Is this a hardware limitation in some instances? Or is it always possible to
>select any of the resolutions?

No limitation, just mistake for it. I have tested 8-bit, 10-bit, 12-bit mode, all pass.
>
>> +
>> +       if (of_property_read_u32(np, "fsl,adc-sam-time",
>> +                       &info->adc_feature.sam_time)) {
>> +               info->adc_feature.sam_time = 4;
>> +               dev_info(info->dev,
>> +                       "Miss adc-sam-time property in dt, set to 4.\n");
>> +       }
>
>This looks like it should be handled at runtime.

Driver can get the ADC sample time duration fro DT.
fsl,adc-sam-time: ADC sample time duration, number of ADC clocks, such as 2, 4, 6, 8, 12, 16, 20, 24

How to handled at runtime ? 
Use ioctl ?


For the ADC, there have many setting, some of setting are defined statically,  some of them get from DT.
If let the setting handled at runtime, it need to introduce ioctl interface for the driver.

>
>> +
>> +       info->adc_feature.hw_average = of_property_read_bool(np,
>> +                                       "fsl,adc-hw-aver-en");
>
>Is hw average support not always present?

Vf610 RM describe:
37.8.5.7 Hardware Average Function
After the selected input is sampled and converted, the result is placed in an accumulator
from which an average is calculated once the selected number of conversions has been
completed. When hardware averaging is selected the completion of a single conversion
will not set the COCOn bit.

In general, hw average function is useful to reduce cpu loading.
The function is optional for user.

>
>> +       if (info->adc_feature.hw_average &&
>> +                of_property_read_u32(np, "fsl,adc-aver-sam-sel",
>> +                               &info->adc_feature.hw_sam)) {
>> +               info->adc_feature.hw_sam = 4;
>> +               dev_info(info->dev,
>> +                       "Miss adc-aver-sam-sel property in dt, set to 4.\n");
>> +       }
>
>Why not configure this at runtime instead?
>
As above said, if let the configuration set at runtime, we need to introduce ioctl interface for user.
How do you think ?


>> +
>> +       info->adc_feature.lpm = of_property_read_bool(np, "fsl,adc-low-power-
>mode");
>> +       info->adc_feature.hs_oper = of_property_read_bool(np,
>> + "fsl,adc-high-speed-conv");
>
>Please elaborate on what these mean, and why they need to be in the DT.
>
Yes, there have some configuration have been set in default,  some of them from DT.
I think the hw function/feature enable/disable are judged from DT.
Some general configurations are set in default.

Of course, let all of them are set at runtime is better. But need to introduce ioctl interface for user. 


Mark, 

Thanks for your review.
