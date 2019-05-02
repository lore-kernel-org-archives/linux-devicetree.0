Return-Path: <SRS0=uJB5=TC=essensium.com=charles-antoine.couret@kernel.org>
Subject: Re: [PATCH 1/6] iio: ad7949: Support internal Vref
References: <1556745423-11368-1-git-send-email-adam.michaelis@rockwellcollins.com>
From: Couret Charles-Antoine <charles-antoine.couret@essensium.com>
Message-ID: <4f674e6a-2346-4ca3-4043-205e54473dbd@essensium.com>
Date: Thu, 2 May 2019 08:30:53 +0200
MIME-Version: 1.0
In-Reply-To: <1556745423-11368-1-git-send-email-adam.michaelis@rockwellcollins.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
To: Adam Michaelis <adam.michaelis@rockwellcollins.com>, linux-iio@vger.kernel.org
Cc: lars@metafoo.de, michael.hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, brandon.maier@rockwellcollins.com, clayton.shotwell@rockwellcollins.com
List-ID: <devicetree@vger.kernel.org>

Hi,
I read your patch series and it seems really good. Thank you for the 
improvements. :)
But I have one comment about it there:

Le 01/05/2019 à 23:16, Adam Michaelis a écrit :
> @@ -223,10 +247,18 @@ static int ad7949_spi_init(struct ad7949_adc_chip *ad7949_adc)
>   {
>   	int ret;
>   	int val;
> +	u16 adc_config = 0;
>   
> -	/* Sequencer disabled, CFG readback disabled, IN0 as default channel */
>   	ad7949_adc->current_channel = 0;
> -	ret = ad7949_spi_write_cfg(ad7949_adc, 0x3C79, AD7949_MASK_TOTAL);
> +	ad7949_adc->cfg = 0;
> +
> +	adc_config = (0x3c << 8);
> +	adc_config |= ((ad7949_adc->current_channel & 0x07) << 7);
> +	adc_config |= (1 << 6);
> +	adc_config |= (ad7949_adc->ref_sel << 3);
> +	adc_config |= 1;
> +
> +	ret = ad7949_spi_write_cfg(ad7949_adc, adc_config, AD7949_MASK_TOTAL);

That should be great to replace some _magic constants_ by a more 
explicit name, shouldn't it? Especially (0x3c << 8) and (1 << 6 parts).

Regards,

Charles-Antoine Couret
