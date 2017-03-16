From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v4 1/3] mfd: wm831x: Add basic device tree binding
Date: Thu, 16 Mar 2017 14:31:44 +0000
Message-ID: <20170316143144.GL6986@localhost.localdomain>
References: <1489592384-11510-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20170316140019.eoe757vox5wrlkmu@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170316140019.eoe757vox5wrlkmu@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, gnurou@gmail.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Thu, Mar 16, 2017 at 02:00:19PM +0000, Lee Jones wrote:
> On Wed, 15 Mar 2017, Charles Keepax wrote:
> 
> > Add the basic ability to register the device through device tree, more
> > work is needed to get each individual sub-driver functioning correctly
> > but this is enough to get the device to probe from device tree.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> > ---
> >  static int wm831x_i2c_probe(struct i2c_client *i2c,
> >  			    const struct i2c_device_id *id)
> >  {
> > +	struct wm831x_pdata *pdata = dev_get_platdata(&i2c->dev);
> >  	struct wm831x *wm831x;
> > +	enum wm831x_parent type;
> >  	int ret;
> >  
> > +	if (i2c->dev.of_node) {
> > +		const struct of_device_id *id = of_match_device(wm831x_of_match,
> > +								&i2c->dev);
> 
> Not keen on this.  Please declare the variable up with the others.
> 

They are never going to be used anywhere else in the function.
Again I can if you feel strongly but isn't it really better to
limit the scope of the variables if they are only being used
locally.

> > +		unsigned long of_type = (unsigned long)id->data;
> 
> And this one.
> 
> > +		type = (enum wm831x_parent)of_type;
> 
> Looks like you don't even need of_type.
> 
> Just cast id->data straight into wm81x_parent.
> 

Pretty sure you will get a warning on 64-bit systems if I do
that.

> > +	} else {
> > +		type = (enum wm831x_parent)id->driver_data;
> > +	}
> 
> No need for bracketing here.
> 

Kernel coding standards if one side  of the if has both should.

Thanks,
Charles
