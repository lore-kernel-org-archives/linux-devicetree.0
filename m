From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] media: ov9650: support device tree probing
Date: Mon, 8 Jan 2018 11:37:12 +0200
Message-ID: <20180108093712.xqpxmgbqsmkhw632@paasikivi.fi.intel.com>
References: <1515344064-23156-1-git-send-email-akinobu.mita@gmail.com>
 <1515344064-23156-2-git-send-email-akinobu.mita@gmail.com>
 <20180108091838.GM9493@w540>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180108091838.GM9493@w540>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jacopo mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Cc: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "H . Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

On Mon, Jan 08, 2018 at 10:18:38AM +0100, jacopo mondi wrote:
> > @@ -1561,9 +1605,19 @@ static const struct i2c_device_id ov965x_id[] = {
> >  };
> >  MODULE_DEVICE_TABLE(i2c, ov965x_id);
> >
> > +#if IS_ENABLED(CONFIG_OF)
> > +static const struct of_device_id ov965x_of_match[] = {
> > +	{ .compatible = "ovti,ov9650", },
> > +	{ .compatible = "ovti,ov9652", },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, ov965x_of_match);
> > +#endif
> > +
> >  static struct i2c_driver ov965x_i2c_driver = {
> >  	.driver = {
> >  		.name	= DRIVER_NAME,
> > +		.of_match_table = of_match_ptr(ov965x_of_match),
> 
> If CONFIG_OF is not defined, this will break compilation.
> Please guard this with #if IS_ENABLED(CONFIG_OF) as well.

of_match_ptr() will be NULL if CONFIG_OF is not defined, so AFAICT this is
fine.

-- 
Sakari Ailus
sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
