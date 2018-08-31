From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 21/30] iio: adc: sun4i-gpadc-iio: add
 support for H3 thermal sensor
Date: Fri, 31 Aug 2018 14:01:08 +0200
Message-ID: <b834bc83-e3fa-511b-7c29-bd3a9af01d5b@gmail.com>
References: <20180830154518.29507-1-embed3d@gmail.com>
 <20180830154518.29507-22-embed3d@gmail.com>
 <20180831091137.wkbbipssyd6mqfbt@flea>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Return-path: <linux-sunxi+bncBD257DPK24NRBCG4UTOAKGQEYWCPHSA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180831091137.wkbbipssyd6mqfbt@flea>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 31.08.2018 11:11, Maxime Ripard wrote:
>> +	regmap_write(info->regmap, SUN8I_H3_THS_CTRL0,
>> +			SUN4I_GPADC_CTRL0_T_ACQ(0xff));
>> +
>> +	regmap_write(info->regmap, SUN8I_H3_THS_CTRL2,
>> +			SUN8I_H3_THS_ACQ1(0x3f));
>> +
>> +	regmap_write(info->regmap, SUN8I_H3_THS_STAT,
>> +			SUN8I_H3_THS_INTS_TDATA_IRQ_0);
>> +
>> +	regmap_write(info->regmap, SUN8I_H3_THS_FILTER,
>> +			SUN4I_GPADC_CTRL3_FILTER_EN |
>> +			SUN4I_GPADC_CTRL3_FILTER_TYPE(0x2));
>> +
>> +	regmap_write(info->regmap, SUN8I_H3_THS_INTC,
>> +			SUN8I_H3_THS_INTC_TDATA_IRQ_EN0 |
>> +			SUN8I_H3_THS_TEMP_PERIOD(0x55));
>> +
>> +	regmap_read(info->regmap, SUN8I_H3_THS_CTRL2, &value);
>> +
>> +	regmap_write(info->regmap, SUN8I_H3_THS_CTRL2,
>> +			SUN8I_H3_THS_TEMP_SENSE_EN0 | value);
> Ideally, all these values should have a comment explaining what they
> are.
> 
> And we really start to have a lot of registers defines. We'd be better
> off using regmap_fields.

I will rework this in the next version.

Thanks,
Philipp
