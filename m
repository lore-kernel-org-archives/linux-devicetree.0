From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] iio: adc: aspeed: Deassert reset in probe
Date: Sat, 25 Nov 2017 14:22:44 +0000
Message-ID: <20171125142244.6be06099@archlinux>
References: <20171031021203.18248-1-joel@jms.id.au>
        <CA+gwMcdVpq1P5kWAWzkg2A+Ah-fKyTk0adhGdg4465gkOY3EKA@mail.gmail.com>
        <CACPK8Xc1d89MXBjSJw7Jz0oqkCcoxKbymaVDmJq-kHFK6qG0Sw@mail.gmail.com>
        <20171102144932.00001e17@huawei.com>
        <20171119160318.41d7e85a@archlinux>
        <CACPK8XdwpKOLydSvdfNY0D049ysCc526Vj8E1Om3VVkWbVuhdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACPK8XdwpKOLydSvdfNY0D049ysCc526Vj8E1Om3VVkWbVuhdg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Jonathan Cameron <Jonathan.Cameron-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 20 Nov 2017 15:22:38 +1030
Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> wrote:

> On Mon, Nov 20, 2017 at 2:33 AM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Thu, 2 Nov 2017 14:49:32 +0000
> > Jonathan Cameron <Jonathan.Cameron-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:  
> >> IIO is closed for this cycle anyway now.
> >> Otherwise, series looks good.
> >>
> >> Will pick up when back with my main PC as traveling for this week and
> >> next.  
> >
> > Forgot to ask, do you want me to pick this up as a fix?
> > Also does it make sense to tag it for stable?
> >
> > If not I can pick it up for the coming cycle. Given the code changes
> > are small and well isolated I'm happy to do any of the 3 options,
> > it really depends on whether the rest of the platform works well enough
> > to be worth rushing these through?  
> 
> Without the clock driver upstream there's no rush to merge this. I'm
> still waiting on review from the clock guys.
> 
> Please queue them for 4.16. Thanks!
Done - applied to the togreg branch of iio.git which will be pushed
out as testing for the autobuilders to play with it.

Thanks,

Jonathan
> 
> Cheers,
> 
> Joel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
