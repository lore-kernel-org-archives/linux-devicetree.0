From: Fugang Duan <fugang.duan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v3 2/3] iio:adc:imx: add Freescale Vybrid vf610 adc
 driver
Date: Wed, 27 Nov 2013 08:31:15 +0000
Message-ID: <9848F2DB572E5649BA045B288BE08FBE018990B8@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1385463394-11157-1-git-send-email-B38611@freescale.com>
 <1385463394-11157-3-git-send-email-B38611@freescale.com>
 <52948B45.7030505@metafoo.de>
 <9848F2DB572E5649BA045B288BE08FBE01898C41@039-SN2MPN1-023.039d.mgd.msft.net>
 <5295AB51.4050804@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5295AB51.4050804-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Content-Language: en-US
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Lars-Peter Clausen [mailto:lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org]
Data: Wednesday, November 27, 2013 4:21 PM

>To: Duan Fugang-B38611
>Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
>shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; Li Frank-B20596; linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>Subject: Re: [PATCH v3 2/3] iio:adc:imx: add Freescale Vybrid vf610 adc driver
>
>On 11/27/2013 05:44 AM, Fugang Duan wrote:
>[...]
>>>> +	if (info->vref)
>>>> +		info->vref_uv = regulator_get_voltage(info->vref);
>>>> +	else if (of_property_read_u32(np, "fsl,adc-vref", &info->vref_uv))
>>>> +		dev_err(info->dev,
>>>> +			"Miss adc-vref property or vref regulator in the DT.\n");
>>>
>>> If you have a fixed reference voltage use the fixed voltage
>>> regulator. Don't invent custom ways of specifying this.
>>>
>> Different boards design may use different method to supply the reference
>voltage.
>> There maybe fixed voltage regulator, maybe no regulator just use fixed
>voltage.
>
>Well the voltage has to come from somewhere and that source should be described
>in the DT with a fixed regulator.
>

Good suggestion. Thanks.

>>
>>>> +
>>>> +	if (of_property_read_u32(np, "fsl,adc-clk-div",
>>>> +			&info->adc_feature.clk_div_num)) {
>>>> +		info->adc_feature.clk_div_num = 2;
>>>> +		dev_info(info->dev,
>>>> +			"Miss adc-clk-div in dt, set divider to 2.\n");
>>>> +	}
>>>> +
>>>> +	if (of_property_read_u32(np, "fsl,adc-res",
>>>> +			&info->adc_feature.res_mode)) {
>>>> +		info->adc_feature.res_mode = 12;
>>>> +		dev_info(info->dev,
>>>> +			"Miss adc-res property in dt, use 8bit mode.\n");
>>>> +	}
>>>> +
>>>> +	if (of_property_read_u32(np, "fsl,adc-sam-time",
>>>> +			&info->adc_feature.sam_time)) {
>>>> +		info->adc_feature.sam_time = 4;
>>>> +		dev_info(info->dev,
>>>> +			"Miss adc-sam-time property in dt, set to 4.\n");
>>>> +	}
>>>> +
>>>> +	info->adc_feature.hw_average = of_property_read_bool(np,
>>>> +					"fsl,adc-hw-aver-en");
>>>> +	if (info->adc_feature.hw_average &&
>>>> +		 of_property_read_u32(np, "fsl,adc-aver-sam-sel",
>>>> +				&info->adc_feature.hw_sam)) {
>>>> +		info->adc_feature.hw_sam = 4;
>>>> +		dev_info(info->dev,
>>>> +			"Miss adc-aver-sam-sel property in dt, set to 4.\n");
>>>> +	}
>>>> +
>>>> +	info->adc_feature.lpm = of_property_read_bool(np,
>>>> +"fsl,adc-low-power-
>>> mode");
>>>> +	info->adc_feature.hs_oper = of_property_read_bool(np,
>>>> +"fsl,adc-high-speed-conv");
>>>
>>> Some of the properties look like they should be runtime configurable
>>> rather then board specific settings. E.g. the resolution or the
>>> sampling frequency, or whether averaging is enabled.
>>>
>>>
>> So, I have question:
>> Since the ADC have many user configurable setting, I have import some of them
>from DT, and some of them use static define.
>> How to set/change them in runtime for user configuration ?
>> Introduce ioctl ?
>
>I think a lot of them already map to standard iio properties. E.g. the
>samplerate. So you'd expose them as sysfs attributes. But please use standard
>attributes here instead of inventing your own with cryptic names.
>
>- Lars

Good suggestion, I will use the standard IIO interface for the ADC configuration.

Thanks,
Andy
