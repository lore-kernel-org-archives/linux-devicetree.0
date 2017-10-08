From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] iio: dac: Add Texas Instruments 8/10/12-bit
 2/4-channel DAC driver
Date: Sun, 8 Oct 2017 11:15:06 +0100
Message-ID: <20171008111506.78fe5e60@archlinux>
References: <cceeb1a985343d36dc90d2708371f3e1a73264f6.1504602350.git.lukas@wunner.de>
        <5d861035569248ac4ae971638ce7fd1e50947232.1504602350.git.lukas@wunner.de>
        <20170910161108.2ecc34d3@archlinux>
        <20171007091312.GA6890@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171007091312.GA6890-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Mathias Duckeck <m.duckeck-XB/JSsFECOqzQB+pC5nmwQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 7 Oct 2017 11:13:12 +0200
Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> wrote:

> On Sun, Sep 10, 2017 at 04:11:08PM +0100, Jonathan Cameron wrote:
> > On Tue, 5 Sep 2017 11:27:00 +0200 Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> wrote:  
> > > The DACrrcS085 (rr = 08/10/12, c = 2/4) family of SPI DACs was
> > > inherited by TI when they acquired National Semiconductor in 2011.  
> > 
> > Very nice.  A few really minor comments inline.  
> 
> D'accord on all your comments except this one:
> 
> 
> > > +	ret = sscanf(spi->modalias, "dac%2hhu%1d",
> > > +		     &ti_dac->resolution, &indio_dev->num_channels);
> > > +	WARN_ON(ret != 2);  
> > 
> > Whilst this seems nice and clear now, it may not work if this driver
> > had additional parts added in future. 
> > 
> > I would prefer an explicit table with this information in it and
> > use an enum to reference into it.
> > 
> > This is a bit 'too clever' :)  
> 
> Hm, I looked at the other SPI DACs available from TI and their programming
> interface is sufficiently different that they don't lend themselves all
> too well for integration into this driver.  There might be DACs from other
> vendors with a similar programming interface.
> 
> What I *could* do is encode the resolution and number of channels in the
> driver_data field of the spi MODULE_DEVICE_TABLE like this:
> 
> static const struct spi_device_id ti_dac_spi_id[] = {
> 	{ "dac082s085",  8 << 8 + 2 },
> 	{ "dac102s085", 10 << 8 + 2 },
> 	...
> 
> Then instead of reading the information from the modalias I'd read them
> from driver_data.  However it looks a bit redundant and silly to me.
> Can we add this extra complexity when the need for it actually arises?

Do it the simple if slightly more lengthy way. It's easier to review
and less likely to be fragile in future.

enum dac082s085_devices {
	DAC082S085,
	DAC102S085
};

struct dac082s085_device_info {
	int resolution;
	int num_channels;
};

static const struct
	dac082s085_device_info dac082s085_devices[dac082s085_devices] = {
		DAC082S085 = {
			.resolution = 8,
			.num_channels = 2,
		},
	....		
};

Then pick the relevant structure when you probe.

It's long code, but it is really easy to tell if it is correct.
Here we are trading off verbosity for maintainability.

Jonathan

> 
> Thanks,
> 
> Lukas
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
