From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 2/2] iio: (bma400) add driver for the BMA400
Date: Sat, 12 Oct 2019 17:33:44 +0100
Message-ID: <20191012173344.7d25fd02@archlinux>
References: <20191012035420.13904-1-dan@dlrobertson.com>
        <20191012035420.13904-3-dan@dlrobertson.com>
        <20191012104033.006b33f9@archlinux>
        <20191012153556.GA15972@nessie>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191012153556.GA15972@nessie>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Robertson <dan@dlrobertson.com>
Cc: linux-iio@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, devicetree@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sat, 12 Oct 2019 15:35:56 +0000
Dan Robertson <dan@dlrobertson.com> wrote:

> Thanks again everyone for the informative feedback!
> 
> On Sat, Oct 12, 2019 at 10:31:07AM +0100, Jonathan Cameron wrote:
> > Apologies for not pointing this out in V1 but all new IIO bindings need
> > to be in the yaml format rather than plain text.  
> 
> No problem. I'll use the yaml format in v3.
> 
> On Fri, Oct 11, 2019 at 11:11:31PM -0700, Randy Dunlap wrote:
> > > +config BMA400
> > > +	tristate "Bosch BMA400 3-Axis Accelerometer Driver"
> > > +	depends on I2C
> > > +	select REGMAP
> > > +	select BMA400_I2C if (I2C)  
> >
> > Since this already has "depends on I2C", the "if (I2C)" above is not needed.
> > Or maybe BMA400 alone does not depend on I2C?  
> 
> Good catch. I'll remove the I2C depends from BMA400_I2C.
> 
> On Sat, Oct 12, 2019 at 10:39:54AM +0300, Andy Shevchenko wrote:
> > On Sat, Oct 12, 2019 at 10:07 AM Randy Dunlap <rdunlap@infradead.org> wrote:  
> > > On 10/11/19 8:54 PM, Dan Robertson wrote:  
> >  
> > > > +config BMA400_I2C
> > > > +     tristate
> > > > +     depends on BMA400
> > > > +     depends on I2C
> > > > +     select REGMAP_I2C
> > > > +  
> > >
> > > The bma400_i2c driver seems to use some OF interfaces.
> > > Should it also depend on OF?  
> >
> > Please, avoid unnecessary and strict dependencies when it's limiting
> > the area of use the driver.
> > The driver does not depend to OF. Why to stick with OF?
> >
> > The actual change has to be done is to switch from
> >  
> > > #include <linux/of.h>  
> >
> > to
> >
> > #include <linux/mod_devicetable.h>  
> 
> Ah! Did not know about mod_devicetable.h. I'll make this change in the next
> version.
> 
> On Sat, Oct 12, 2019 at 10:40:33AM +0100, Jonathan Cameron wrote:
> > > +static const struct attribute_group bma400_attrs_group = {
> > > +	.attrs = bma400_attributes,  
> >
> > No need to supply any attrs at all if the core is doing everything
> > for you, so get rid of these.  
> 
> Good catch.
> 
> > > +int bma400_probe(struct device *dev,
> > > +		 struct regmap *regmap,
> > > +		 const char *name)  
> >
> > Try to avoid unnecessary line breaks.  There are stilly only
> > so many lines on a computer monitor :)  
> 
> Will do. I'll do a quick audit of the patchset for other short lines, but
> please don't hesitate to point out others you may find.
> 
> > > +		/*
> > > +		 * If the softreset failed, try to put the device in
> > > +		 * sleep mode, but still report the error.
> > > +		 */  
> >
> > Silly question.  Why is soft_reset preferred to sleep mode?  
> 
> Not a silly question. I actually debated this when initially implementing the
> driver. The datasheet describes soft-reset behavior in section 4.9, the
> following snippet from the datasheet is particularly relevant:
> 
> > The softreset performs a fundamental reset to the device which is largely
> > equivalent to a power cycle. Following a delay, all user configuration
> > settings are overwritten with their default state...  
> 
> Sleep mode is the default power-mode, so the only real difference would be that
> the oversampling ratio, sampling frequency, and scale would all be reset to
> their defaults with a soft-reset. If we just set the power-mode to sleep mode,
> the user configuration registers would be preserved.
> 
> I can add a comment about the behavior of a softreset in bma400_remove.
I'd just not do it.  That way there is only the putting it to sleep path.
We normally assume that we don't know the state during startup and aren't
as careful on remove to make sure things are in a default state.

That way you only need a single path in the remove function. If sleep mode
fails you are probably broken anyway.

Jonathan

> 
> Cheers,
> 
>  - Dan
