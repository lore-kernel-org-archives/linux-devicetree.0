From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] media: platform: rcar_imr: add IMR-LSX3 support
Date: Fri, 17 Mar 2017 22:26:12 +0300
Message-ID: <35e744da-4ae6-5a7c-2651-656012c961aa@cogentembedded.com>
References: <20170316190000.216761731@cogentembedded.com>
 <b12254ac-ed2f-dec5-8cbd-4ce22c5f3c55@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b12254ac-ed2f-dec5-8cbd-4ce22c5f3c55-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/17/2017 05:33 PM, Hans Verkuil wrote:

>> Add support for the image renderer light SRAM extended 3 (IMR-LSX3) found
>> only in the R-Car V2H (R8A7792) SoC.  It differs  from IMR-LX4 in that it
>> supports only planar video formats but can use the video capture data for
>> the textures.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

[...]
>> Index: media_tree/drivers/media/platform/rcar_imr.c
>> ===================================================================
>> --- media_tree.orig/drivers/media/platform/rcar_imr.c
>> +++ media_tree/drivers/media/platform/rcar_imr.c
[...]
>> @@ -282,6 +296,34 @@ static u32 __imr_flags_common(u32 iflags
>>  	return iflags & oflags & IMR_F_PLANES_MASK;
>>  }
>>
>> +static const struct imr_format_info imr_lsx3_formats[] = {
>> +	{
>> +		.name	= "YUV 4:2:2 semiplanar (NV16)",
>> +		.fourcc	= V4L2_PIX_FMT_NV16,
>> +		.flags	= IMR_F_Y8 | IMR_F_UV8 | IMR_F_PLANAR,
>> +	},
>> +	{
>> +		.name	= "Greyscale 8-bit",
>> +		.fourcc	= V4L2_PIX_FMT_GREY,
>> +		.flags	= IMR_F_Y8 | IMR_F_PLANAR,
>> +	},
>> +	{
>> +		.name	= "Greyscale 10-bit",
>> +		.fourcc	= V4L2_PIX_FMT_Y10,
>> +		.flags	= IMR_F_Y8 | IMR_F_Y10 | IMR_F_PLANAR,
>> +	},
>> +	{
>> +		.name	= "Greyscale 12-bit",
>> +		.fourcc	= V4L2_PIX_FMT_Y12,
>> +		.flags	= IMR_F_Y8 | IMR_F_Y10 | IMR_F_Y12 | IMR_F_PLANAR,
>> +	},
>> +	{
>> +		.name	= "Chrominance UV 8-bit",
>> +		.fourcc	= V4L2_PIX_FMT_UV8,
>> +		.flags	= IMR_F_UV8 | IMR_F_PLANAR,
>> +	},
>> +};
>> +
>>  static const struct imr_format_info imr_lx4_formats[] = {
>>  	{
>>  		.name	= "YUV 4:2:2 semiplanar (NV16)",
>> @@ -335,6 +377,18 @@ static const struct imr_format_info imr_
>>  	},
>>  };
>>
>> +static const struct imr_info imr_lsx3 = {
>> +	.type		= IMR_LSX3,
>> +	.formats	= imr_lsx3_formats,
>> +	.num_formats	= ARRAY_SIZE(imr_lsx3_formats),
>> +};
>> +
>> +static const struct imr_info imr_lx4 = {
>> +	.type		= IMR_LX4,
>> +	.formats	= imr_lx4_formats,
>> +	.num_formats	= ARRAY_SIZE(imr_lx4_formats),
>> +};
>> +
>>  /* mesh configuration constructor */
>>  static struct imr_cfg *imr_cfg_create(struct imr_ctx *ctx,
>>  				      u32 dl_size, u32 dl_start)
[...]
>> @@ -823,7 +879,7 @@ static void imr_dl_program_setup(struct
>>  			*dl++ = IMR_OP_WTS(IMR_SSTR,
>>  					   w << (iflags & IMR_F_UV10 ? 1 : 0));
>>  		}
>> -	} else {
>> +	} else if (ctx->imr->info->type == IMR_LX4) {
>>  		u16 src_fmt = (iflags & IMR_F_UV_SWAP ? IMR_CMRCR2_UVFORM : 0) |
>>  			      (iflags & IMR_F_YUV_SWAP ?
>>  			       IMR_CMRCR2_YUV422FORM : 0);
>> @@ -864,6 +920,9 @@ static void imr_dl_program_setup(struct
>>  			*dl++ = IMR_OP_WTS(IMR_DSTR,
>>  					   W << (cflags & IMR_F_Y10 ? 2 : 1));
>>  		}
>> +	} else	{
>> +		/* this shouldn't happen! */
>> +		BUG();
>
> Can you find a better way? The use of 'BUG' is frowned upon. It's better
> to return an error here.

    OK, I'll try to return -EINVAL here...
    BTW, the main driver patch also has BUG_ON()...

> Also, are you sure this can't happen?  At least for
 > me it is not obvious from the code.

    Absolutely. Interleaved formats are not supported by IMR-L[S]X3, so the 
format array has IMR_F_PLANAR set for all formats supported by these cores. 
Interleaved formats are onlt supported by IMR-LX4 (for which we check above).

[...]

> Regards,
>
> 	Hans

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
