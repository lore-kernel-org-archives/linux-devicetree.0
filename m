From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v9 2/2] media: i2c: Add the ov7740 image sensor driver
Date: Tue, 19 Dec 2017 11:11:39 +0200
Message-ID: <20171219091139.n2wmsj6ydcjntnf3@valkosipuli.retiisi.org.uk>
References: <20171211013146.2497-1-wenyou.yang@microchip.com>
 <20171211013146.2497-3-wenyou.yang@microchip.com>
 <1641aa67-b05e-47e2-600c-70b77571b450@iki.fi>
 <F9F4555C4E01D7469D37975B62D0EFBB8DDA56@CHN-SV-EXMX07.mchp-main.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <F9F4555C4E01D7469D37975B62D0EFBB8DDA56-8fD0d2gESGoGk1ErWP88zX2Vsf1/G1/XQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wenyou.Yang-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org
Cc: mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas.Ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Wenyou,

On Tue, Dec 19, 2017 at 02:11:28AM +0000, Wenyou.Yang-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org wrote:
> Hi Sakari,
> 
> > -----Original Message-----
> > From: Sakari Ailus [mailto:sakari.ailus-X3B1VOXEql0@public.gmane.org]
> > Sent: 2017年12月14日 4:06
> > To: Wenyou Yang - A41535 <Wenyou.Yang-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>; Mauro Carvalho
> > Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>; Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>;
> > Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Nicolas Ferre - M43238
> > <Nicolas.Ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Jonathan Corbet
> > <corbet-T1hC0tSOHrs@public.gmane.org>; Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>; linux-arm-
> > kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; Linux Media Mailing List <linux-
> > media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>; Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> > Subject: Re: [PATCH v9 2/2] media: i2c: Add the ov7740 image sensor driver
> > 
> > Hi Wenyou,
> > 
> > Wenyou Yang wrote:
> > ...
> > > +static int ov7740_start_streaming(struct ov7740 *ov7740) {
> > > +	int ret;
> > > +
> > > +	if (ov7740->fmt) {
> > > +		ret = regmap_multi_reg_write(ov7740->regmap,
> > > +					     ov7740->fmt->regs,
> > > +					     ov7740->fmt->reg_num);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	if (ov7740->frmsize) {
> > > +		ret = regmap_multi_reg_write(ov7740->regmap,
> > > +					     ov7740->frmsize->regs,
> > > +					     ov7740->frmsize->reg_num);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	return __v4l2_ctrl_handler_setup(ov7740->subdev.ctrl_handler);
> > 
> > I believe you're still setting the controls after starting streaming.
> 
> Yes, it sees it does so.
> 
> The OV7740 sensor generates the stream pixel data at the constant frame
> rate, no such start or stop control.

That'd be odd but I guess hardware sometimes is. I'll apply the patches.

Thanks!

-- 
Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
