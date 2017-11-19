From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] iio: adc: aspeed: Deassert reset in probe
Date: Sun, 19 Nov 2017 16:03:18 +0000
Message-ID: <20171119160318.41d7e85a@archlinux>
References: <20171031021203.18248-1-joel@jms.id.au>
        <CA+gwMcdVpq1P5kWAWzkg2A+Ah-fKyTk0adhGdg4465gkOY3EKA@mail.gmail.com>
        <CACPK8Xc1d89MXBjSJw7Jz0oqkCcoxKbymaVDmJq-kHFK6qG0Sw@mail.gmail.com>
        <20171102144932.00001e17@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171102144932.00001e17-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <Jonathan.Cameron-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2 Nov 2017 14:49:32 +0000
Jonathan Cameron <Jonathan.Cameron-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:

> On Wed, 1 Nov 2017 10:15:32 +1030
> Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> wrote:
> 
> > On Tue, Oct 31, 2017 at 10:28 PM, Philipp Zabel
> > <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:  
> > > On Tue, Oct 31, 2017 at 3:12 AM, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
> > > wrote:    
> > >> The ASPEED SoC must deassert a reset in order to use the ADC
> > >> peripheral.
> > >>
> > >> The device tree bindings are updated to document the resets
> > >> phandle, and the example is updated to match what is expected for
> > >> both the reset and clock phandle. Note that the bindings should
> > >> have always had the reset controller, as the hardware is unusable
> > >> without it.
> > >>
> > >> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>    
> > >
> > > It is unfortunate that this has to break DT (theoretical) backwards
> > > compatibility, but given that the old bindings never worked,
> > > this is better than to pretend a required reset is optional.
> > >
> > > Reviewed-by: Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>    
> > 
> > Thanks. I agree that it's unfortunate; this has been my first time
> > working on an ARM SoC and there were few things we could have done
> > better in hindsight.
> > 
> > I've got similar patches for the ASPEED hwmon pwm/tach driver, and the
> > i2c driver that I'll send out now.
> > 
> > Thanks for the review.
> > 
> > Cheers,
> > 
> > Joel  
> Hi Joel,
> 
> IIO is closed for this cycle anyway now.
> Otherwise, series looks good.
> 
> Will pick up when back with my main PC as traveling for this week and
> next.
Forgot to ask, do you want me to pick this up as a fix?
Also does it make sense to tag it for stable?

If not I can pick it up for the coming cycle. Given the code changes
are small and well isolated I'm happy to do any of the 3 options,
it really depends on whether the rest of the platform works well enough
to be worth rushing these through?

Jonathan
> 
> Thanks,
> 
> Jonathan
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-iio"
> > in the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html  
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
