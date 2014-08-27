From: Beniamino Galvani <b.galvani@gmail.com>
Subject: Re: [PATCH 1/4] mfd: Add Ricoh RN5T618 PMIC core driver
Date: Wed, 27 Aug 2014 23:12:37 +0200
Message-ID: <20140827211237.GA24921@gmail.com>
References: <1409091237-16722-1-git-send-email-b.galvani@gmail.com>
 <1409091237-16722-2-git-send-email-b.galvani@gmail.com>
 <20140827075614.GZ26707@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140827075614.GZ26707@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Carlo Caione <carlo@caione.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 27, 2014 at 08:56:14AM +0100, Lee Jones wrote:
[...]
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 8d5fad2..fae8c5b 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -582,6 +582,17 @@ config MFD_RC5T583
> >  	  Additional drivers must be enabled in order to use the
> >  	  different functionality of the device.
> >  
> > +config MFD_RN5T618
> > +	bool "Ricoh RN5T5618 PMIC"
> 
> Shouldn't this be tristate?

Yes, I suppose the driver would work also as a module, I only have to
uninstall the pm_power_off hook on module removal.

> > +++ b/drivers/mfd/rn5t618.c
> > @@ -0,0 +1,129 @@
> 
> [...]
> 
> > +static int rn5t618_i2c_probe(struct i2c_client *i2c,
> > +			     const struct i2c_device_id *id)
> > +{
> 
> [...]
> 
> > +	dev_info(&i2c->dev, "RN5T618 MFD driver loaded");
> 
> Can you remove this line?  We normally only print things when
> information is gathered from a chip i.e. version information and the
> like.

I will remove it, thanks.

Beniamino
