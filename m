From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 07/16] iio: adc: sun4i-gpadc-iio: rework: support nvmem
 calibration data
Date: Fri, 2 Feb 2018 16:24:49 +0100
Message-ID: <aacb720f-2337-a016-e4e2-d99bd8da420b@gmail.com>
References: <20180128232919.12639-1-embed3d@gmail.com>
 <20180128232919.12639-8-embed3d@gmail.com>
 <20180129094045.sagz2dnzvdadd4yx@flea.lan>
 <e319fde5-9ede-8be0-03ae-f0a22d50250c@gmail.com>
 <20180130083642.cdpd7jnthkdrrk5r@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180130083642.cdpd7jnthkdrrk5r-ZC1Zs529Oq4@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, edu.molinas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, singhalsimran0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


>>
>>>>    	/* prevents concurrent reads of temperature and ADC */
>>>>    	struct mutex			mutex;
>>>>    	struct thermal_zone_device	*tzd;
>>>> @@ -561,6 +569,9 @@ static int sun4i_gpadc_probe_dt(struct platform_device *pdev,
>>>>    	struct resource *mem;
>>>>    	void __iomem *base;
>>>>    	int ret;
>>>> +	struct nvmem_cell *cell;
>>>> +	ssize_t cell_size;
>>>> +	u64 *cell_data;
>>>>    	info->data = of_device_get_match_data(&pdev->dev);
>>>>    	if (!info->data)
>>>> @@ -575,6 +586,39 @@ static int sun4i_gpadc_probe_dt(struct platform_device *pdev,
>>>>    	if (IS_ERR(base))
>>>>    		return PTR_ERR(base);
>>>> +	info->has_calibration_data[0] = false;
>>>> +	info->has_calibration_data[1] = false;
>>>> +
>>>> +	if (!info->data->supports_nvmem)
>>>> +		goto no_nvmem;
>>>> +
>>>> +	cell = nvmem_cell_get(&pdev->dev, "calibration");
>>>> +	if (IS_ERR(cell)) {
>>>> +		if (PTR_ERR(cell) == -EPROBE_DEFER)
>>>> +			return PTR_ERR(cell);
>>>> +		goto no_nvmem;
>>>
>>> goto considered evil ? :)
>>
>> this was a suggestion from Jonatan in version one, to make the code better
>> readable.
> 
> Isn't
> 
> if (info->data->supports_nvmem && IS_ERR(cell = nvmem_cell_get()))
> 
> pretty much the same thing?
> 
> Maxime
> 
I would say :

if (info->data->supports_nvmem && !IS_ERR(cell = nvmem_cell_get())) is

the same.
This would require an else if statement like this:

else if (info->data->supports_nvmem && PTR_ERR(cell) == -EPROBE_DEFER)
		return PTR_ERR(cell);

to avoid errors if the thermal sensor is probed before the sid driver.

Philipp
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
