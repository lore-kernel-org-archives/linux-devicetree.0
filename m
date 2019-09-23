From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [Patch v2 5/7] media: i2c: ov2659: Add powerdown/reset gpio
 handling
Date: Mon, 23 Sep 2019 20:07:25 +0300
Message-ID: <20190923170725.GE9467@paasikivi.fi.intel.com>
References: <20190919203955.15125-1-bparrot@ti.com>
 <20190919203955.15125-6-bparrot@ti.com>
 <20190920101706.GX5781@paasikivi.fi.intel.com>
 <20190920165529.it7urirm6epg4woq@ti.com>
 <20190923061731.GZ5781@paasikivi.fi.intel.com>
 <20190923170557.mggr5gcov43pcmfs@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190923170557.mggr5gcov43pcmfs@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 23, 2019 at 12:05:57PM -0500, Benoit Parrot wrote:
> Sakari Ailus <sakari.ailus@linux.intel.com> wrote on Mon [2019-Sep-23 09:17:32 +0300]:
> > Hi Benoit,
> > 
> > On Fri, Sep 20, 2019 at 11:55:29AM -0500, Benoit Parrot wrote:
> > ...
> > > > > @@ -1400,6 +1440,18 @@ static int ov2659_probe(struct i2c_client *client)
> > > > >  	    ov2659->xvclk_frequency > 27000000)
> > > > >  		return -EINVAL;
> > > > >  
> > > > > +	/* Optional gpio don't fail if not present */
> > > > > +	ov2659->pwdn_gpio = devm_gpiod_get_optional(&client->dev, "powerdown",
> > > > > +						    GPIOD_OUT_LOW);
> > > > > +	if (IS_ERR(ov2659->pwdn_gpio))
> > > > > +		return PTR_ERR(ov2659->pwdn_gpio);
> > > > > +
> > > > > +	/* Optional gpio don't fail if not present */
> > > > > +	ov2659->resetb_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> > > > > +						      GPIOD_OUT_HIGH);
> > > > > +	if (IS_ERR(ov2659->resetb_gpio))
> > > > > +		return PTR_ERR(ov2659->resetb_gpio);
> > > > > +
> > > > >  	v4l2_ctrl_handler_init(&ov2659->ctrls, 2);
> > > > >  	ov2659->link_frequency =
> > > > >  			v4l2_ctrl_new_std(&ov2659->ctrls, &ov2659_ctrl_ops,
> > > > > @@ -1445,6 +1497,9 @@ static int ov2659_probe(struct i2c_client *client)
> > > > >  	ov2659->frame_size = &ov2659_framesizes[2];
> > > > >  	ov2659->format_ctrl_regs = ov2659_formats[0].format_ctrl_regs;
> > > > >  
> > > > > +	pm_runtime_enable(&client->dev);
> > > > > +	pm_runtime_get_sync(&client->dev);
> > > > 
> > > > This makes the driver depend on runtime PM.
> > > 
> > > Obviously.
> > > Why? Is that bad?
> > 
> > Well, if it is, then it should be listed in driver's dependencies in
> > Kconfig.
> 
> And I see that most camera driver using pm_runtime calls don't mark it as a
> dependency in their own Kconfig. There is actually only one that does.

Drivers should also work without runtime PM even if they can use it.

> 
> > 
> > > 
> > > > 
> > > > See e.g. the smiapp driver for an example how to make it work without. It
> > > > wasn't trivial. :I You won't need autosuspend.
> > > 
> > > I took a look at that driver, but I don't get your reference to being able
> > > to work without runtime pm!
> > 
> > The driver didn't need runtime PM, so it'd be nice to continue work
> > without.
> 
> Ok.
> 
> > 
> > What smiapp does is that it powers the sensor on first *without* runtime
> > PM, and then proceeds to set up runtime PM if it's available. The sensor
> > will only be powered off when the device is unbound with runtime PM
> > disabled.
> 
> In that case in your original reply you suggested that I move the content
> of ov2659_set_power() into the pm_runtime callback, but based on this
> comments then I should keep ov2659_set_power() as is as I  would need to
> use it for this specific purpose.

No need to; you can call the same function elsewhere in the driver (just
like the smiapp driver does).

> 
> > 
> > Regarding the smiapp driver, you can replace pm_runtime_get_noresume() and
> > all the autoidle lines with pm_runtime_idle() call after
> > pm_runtime_enable() in the ov2659 driver.
> 
> Ok, I'll study this mechanics a little more, as this is not immediately
> clear.
> 
> Benoit
> 
> > 
> > > That driver looks pretty similar to ov7740.c which I used as a reference
> > > for this.
> > 
> > I guess in practice many sensor drivers don't work without it on DT-based
> > systems I'm afraid. :-( They should be fixed.
> > 
> > -- 
> > Kind regards,
> > 
> > Sakari Ailus
> > sakari.ailus@linux.intel.com

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
