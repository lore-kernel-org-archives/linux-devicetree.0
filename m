From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/3] mfd: wm831x: Add basic device tree binding
Date: Fri, 17 Mar 2017 09:15:02 +0000
Message-ID: <20170317091502.kzcrhj7vlku5mtq7@dell>
References: <1489592384-11510-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20170316140019.eoe757vox5wrlkmu@dell>
 <20170316143144.GL6986@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170316143144.GL6986-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 16 Mar 2017, Charles Keepax wrote:

> On Thu, Mar 16, 2017 at 02:00:19PM +0000, Lee Jones wrote:
> > On Wed, 15 Mar 2017, Charles Keepax wrote:
> > 
> > > Add the basic ability to register the device through device tree, more
> > > work is needed to get each individual sub-driver functioning correctly
> > > but this is enough to get the device to probe from device tree.
> > > 
> > > Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> > > ---
> > >  static int wm831x_i2c_probe(struct i2c_client *i2c,
> > >  			    const struct i2c_device_id *id)
> > >  {
> > > +	struct wm831x_pdata *pdata = dev_get_platdata(&i2c->dev);
> > >  	struct wm831x *wm831x;
> > > +	enum wm831x_parent type;
> > >  	int ret;
> > >  
> > > +	if (i2c->dev.of_node) {
> > > +		const struct of_device_id *id = of_match_device(wm831x_of_match,
> > > +								&i2c->dev);
> > 
> > Not keen on this.  Please declare the variable up with the others.
> > 
> 
> They are never going to be used anywhere else in the function.
> Again I can if you feel strongly but isn't it really better to
> limit the scope of the variables if they are only being used
> locally.

I understand the motivation, but if we did that all the time, the code
would look pretty dire IMHO.

> > > +		unsigned long of_type = (unsigned long)id->data;
> > 
> > And this one.
> > 
> > > +		type = (enum wm831x_parent)of_type;
> > 
> > Looks like you don't even need of_type.
> > 
> > Just cast id->data straight into wm81x_parent.
> 
> Pretty sure you will get a warning on 64-bit systems if I do
> that.

What makes you think that?

> > > +	} else {
> > > +		type = (enum wm831x_parent)id->driver_data;
> > > +	}
> > 
> > No need for bracketing here.
> > 
> 
> Kernel coding standards if one side  of the if has both should.

Yes, my bad.  I retract this one.

/me has been working on Zephyr too much recently (where *everything*
has to be bracketed -- I guess I'm getting a bit sensitive to
over-bracketing) :)

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
