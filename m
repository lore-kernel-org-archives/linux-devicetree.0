From: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>
Subject: Re: [PATCH v3 4/5] iio: mxs-lradc: add scale_available file to channels
Date: Tue, 23 Jul 2013 09:00:13 +0200
Message-ID: <51EE29FD.5070901@digi.com>
References: <1374501843-19651-1-git-send-email-hector.palacios@digi.com> <1374501843-19651-5-git-send-email-hector.palacios@digi.com> <201307230036.42046.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201307230036.42046.marex-ynQEQJNshbs@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org" <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Marek,

On 07/23/2013 12:36 AM, Marek Vasut wrote:
> Dear Hector Palacios,
>
>> Adds in_voltageX_scale_available file for every channel to read
>> the different available scales.
>> There are two scales per channel:
>>   [0] = divider_by_two disabled (default)
>>   [1] = divider_by_two enabled
>> The scale is a struct made of integer and nano parts to build
>> a long decimal number.
>>
>> Signed-off-by: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>
>> ---
>
> [...]
>
>> @@ -1008,6 +1098,26 @@ static int mxs_lradc_probe(struct platform_device
>> *pdev) if (ret)
>>   		goto err_trig;
>>
>> +	/* Populate available ADC input ranges */
>> +	for (i = 0; i < LRADC_MAX_TOTAL_CHANS; i++) {
>> +		for (s = 0; s < ARRAY_SIZE(lradc->scale_avail[i]); s++) {
>> +			/*
>> +			 * [s=0] = optional divider by two disabled (default)
>> +			 * [s=1] = optional divider by two enabled
>> +			 *
>> +			 * The scale is calculated by doing:
>> +			 *   Vref >> (realbits - s)
>> +			 * which multiplies by two on the second component
>> +			 * of the array.
>> +			 */
>> +			scale_uv = ((u64)lradc->vref_mv[i] * 100000000) >>
>> +				   (iio->channels[i].scan_type.realbits - s);
>
> Thinking about this, this is basically
>
>              vref_mv[CHANNEL] * 100 000 000
> scale_uv = --------------------------------
>                        2^(12 - s)
>
> Where s can be either 0 or 1.
>
> Why do you multiply it by 100000000 I don't quite understand, but maybe it's
> fully obvious. It should be documented though.

I copied Michael Hennerich in CC who was the author of this math in
  drivers/iio/adc/ad7793.c
  drivers/staging/iio/adc/ad7192.c
which I copied. Maybe he can explain. It looks like it is just a question of having a 
intermediate large enough number to later do the do_div operation, rather than having 
a meaningful figure.

>> +			lradc->scale_avail[i][s].nano =
>> +					do_div(scale_uv, 100000000) * 10;
>
> Are we not loosing precission here?

Yes, but the do_div is modifying the scale_uv parameter with the integer part so I 
guess it might be somewhat justified.
As I said before, I tried to do my own math without success so I just copied what was 
in other drivers.

>
>> +			lradc->scale_avail[i][s].integer = scale_uv;
>> +		}
>> +	}
>> +
>>   	/* Configure the hardware. */
>>   	mxs_lradc_hw_init(lradc);
>
> Best regards,
> Marek Vasut
>


Best regards,
--
Hector Palacios
