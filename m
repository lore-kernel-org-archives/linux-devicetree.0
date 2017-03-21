From: jacopo <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] iio: Documentation: Add max961x sysfs documentation
Date: Tue, 21 Mar 2017 17:09:11 +0100
Message-ID: <20170321160911.GE30223@w540>
References: <1487948756-25172-1-git-send-email-jacopo+renesas@jmondi.org>
 <1487948756-25172-3-git-send-email-jacopo+renesas@jmondi.org>
 <56b35a65-a23d-68ac-17d6-cf46f9352ab7@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56b35a65-a23d-68ac-17d6-cf46f9352ab7-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, meerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jonathan,

On Sat, Feb 25, 2017 at 03:54:45PM +0000, Jonathan Cameron wrote:
> On 24/02/17 15:05, Jacopo Mondi wrote:
> > Add documentation for max961x driver.
> > The only attribute to document is the current sense shunt resistor
> > value.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
> Interestingly generic as it only applies to some of the channels.
> We might need to have the channel where it is effecting the output specified in the
> name, even if we end up with several repeats of the same thing for different
> computed channels.
> 

Sorry, I'm getting on this a bit late...

Do you still think we should have an attribute for each of the
channels this values affects?
We will end up having 2 distinct processed channels (power and
current) that depends on this value.
I can expose them as 2 distinct attributes if you think this is the
case...

A note on the series in general: given the lack of comments, I will
send v2 exposing two processed channels, with no buffered reads, and
gain selection performed in kernel space.
If we will have to add buffered reads to accomodate higher sampling
frequency we'll do that later on eventually.

Thanks
  j

> Jonathan
> > ---
> >  Documentation/ABI/testing/sysfs-bus-iio-adc-max961x | 5 +++++
> >  1 file changed, 5 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-max961x
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-max961x b/Documentation/ABI/testing/sysfs-bus-iio-adc-max961x
> > new file mode 100644
> > index 0000000..dbd5e75
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-max961x
> > @@ -0,0 +1,5 @@
> > +What:		/sys/bus/iio/devices/iio:deviceX/in_shunt_resistor
> > +Date:		February 2017
> > +KernelVersion:	4.10
> > +Contact:	linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > +Description: 	The value of the shunt resistor in micro Ohms.
> > 
> 
