From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/2] iio: vadc: Qualcomm SPMI PMIC voltage ADC driver
Date: Wed, 05 Nov 2014 14:06:19 +0000
Message-ID: <545A2EDB.5040801@kernel.org>
References: <1415028270-25860-1-git-send-email-iivanov@mm-sol.com>	 <1415028270-25860-3-git-send-email-iivanov@mm-sol.com>	 <545A218F.5060301@kernel.org> <1415195855.3660.4.camel@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415195855.3660.4.camel-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/11/14 13:57, Ivan T. Ivanov wrote:
> 
> On Wed, 2014-11-05 at 13:09 +0000, Jonathan Cameron wrote:
>> On 03/11/14 15:24, Ivan T. Ivanov wrote:
>>> From: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
>>>
>>> The voltage ADC is peripheral of Qualcomm SPMI PMIC chips. It has
>>> 15 bits resolution and register space inside PMIC accessible across
>>> SPMI bus.
>>>
>>> The vadc driver registers itself through IIO interface.
>>>
>>> Signed-off-by: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
>>> Signed-off-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
>> Hi Ivan,
>>
>> Couple of utterly tiny bits inline.  The biggest one is that
>> you store some info about the calibration that you never actually
>> use... Left over from some debugging perhaps?
>>
>> Jonathan
> 
> <snip>
> 
>>> +
>>> +/*
>>> + * VADC_CALIB_ABSOLUTE: uses the 625mV and 1.25V as reference channels.
>>> + * VADC_CALIB_RATIOMETRIC: uses the reference voltage (1.8V) and GND for
>>> + * calibration.
>>> + */
>>> +enum vadc_calibration {
>>> +       VADC_CALIB_ABSOLUTE = 0,
>>> +       VADC_CALIB_RATIOMETRIC
>>> +};
>>> +
>>> +/**
>>> + * struct vadc_linear_graph - Represent ADC characteristics.
>>> + * @dy: numerator slope to calculate the gain.
>> As dy is always equal to vref-gnd you could drop it and use those
>> directly...
>>
>> Conversly you store vref or grnd and never use them...
> 
> I am not sure I am following you. Please take a look in 
> vadc_measure_ref_points() and vadc_calibrate().
Good point on grnd, but vref is set but never read anywhere that I can find..

> 
>>
>>> + * @dx: denominator slope to calculate the gain.
>>> + * @vref: A/D word of the voltage reference used for the channel.
>>> + * @gnd: A/D word of the ground reference used for the channel.
>>> + *
>>> + * Each ADC device has different offset and gain parameters which are
>>> + * computed to calibrate the device.
>>> + */
>>> +struct vadc_linear_graph {
>>> +       s32 dy;
>>> +       s32 dx;
>>> +       s32 vref;
>>> +       s32 gnd;
>>> +};
>>> +
>>>
> 
> Will address blank line comment.
> 
> Regards,
> Ivan
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
