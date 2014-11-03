From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [RESUBMIT PATCH v6 1/8] mfd: Add support for Skyworks SKY81452
 driver
Date: Mon, 03 Nov 2014 22:28:08 +0100
Message-ID: <1415050088.20372.72.camel@x220>
References: <1414393369-31583-1-git-send-email-jack.yoo@skyworksinc.com>
	 <1414739322-12487-1-git-send-email-jack.yoo@skyworksinc.com>
	 <1414739322-12487-2-git-send-email-jack.yoo@skyworksinc.com>
	 <20141103171451.GG12011@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141103171451.GG12011@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, florian.vaussard-p8DiymsW2f8@public.gmane.org, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2014-11-03 at 17:14 +0000, Lee Jones wrote:
>On Fri, 31 Oct 2014, gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> Code looks fine, but what are its dependencies.  I'm assuming nothing;
> however, did Mark say that something depends on it?

That would be REGULATOR_SKY81452. That is currently dangling (since
v3.18-rc1) as it depends on the non-existent symbol SKY81452.

> If so, what and what are you going to do about it?

See 7/8. That patch makes REGULATOR_SKY81452 depend on MFD_SKY81452,
making it buildable.

> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 1456ea7..a54244c 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -693,6 +693,18 @@ config MFD_SM501_GPIO
> >  	 lines on the SM501. The platform data is used to supply the
> >  	 base number for the first GPIO line to register.
> >  
> > +config MFD_SKY81452
> > +	tristate "Skyworks Solutions SKY81452"
> > +	select MFD_CORE
> > +	select REGMAP_I2C
> > +	depends on I2C
> > +	help
> > +	  This is the core driver for the Skyworks SKY81452 backlight and
> > +	  voltage regulator device.
> > +
> > +	  This driver can also be built as a module.  If so, the module
> > +	  will be called sky81452.
> > +
> >  config MFD_SMSC
> >         bool "SMSC ECE1099 series chips"
> >         depends on I2C=y


Paul Bolle

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
