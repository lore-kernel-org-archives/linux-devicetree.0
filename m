From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v9 2/2] media: i2c: Add the ov7740 image sensor driver
Date: Wed, 13 Dec 2017 22:06:29 +0200
Message-ID: <1641aa67-b05e-47e2-600c-70b77571b450@iki.fi>
References: <20171211013146.2497-1-wenyou.yang@microchip.com>
 <20171211013146.2497-3-wenyou.yang@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171211013146.2497-3-wenyou.yang-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wenyou Yang <wenyou.yang-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Wenyou,

Wenyou Yang wrote:
...
> +static int ov7740_start_streaming(struct ov7740 *ov7740)
> +{
> +	int ret;
> +
> +	if (ov7740->fmt) {
> +		ret = regmap_multi_reg_write(ov7740->regmap,
> +					     ov7740->fmt->regs,
> +					     ov7740->fmt->reg_num);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (ov7740->frmsize) {
> +		ret = regmap_multi_reg_write(ov7740->regmap,
> +					     ov7740->frmsize->regs,
> +					     ov7740->frmsize->reg_num);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return __v4l2_ctrl_handler_setup(ov7740->subdev.ctrl_handler);

I believe you're still setting the controls after starting streaming.

-- 
Sakari Ailus
sakari.ailus-X3B1VOXEql0@public.gmane.org

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
