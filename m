From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v7 01/14] usb: chipidea: remove unneeded NULL check
Date: Wed, 27 Jun 2012 14:24:56 +0800
Message-ID: <20120627062455.GC21750@b20223-02.ap.freescale.net>
References: <1340607391-16380-1-git-send-email-richard.zhao@freescale.com>
 <1340607391-16380-2-git-send-email-richard.zhao@freescale.com>
 <20120626214311.GA4878@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120626214311.GA4878-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 26, 2012 at 02:43:11PM -0700, Greg KH wrote:
> On Mon, Jun 25, 2012 at 02:56:18PM +0800, Richard Zhao wrote:
> > From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > 
> > As reported by Dan Carpenter, there is a NULL check in udc_start() that
> > follows a dereference of the pointer that's being checked. However, at
> > that point udc pointer shouldn't ever be NULL and if it is, the dereference
> > should cause an oops.
> > 
> > Signed-off-by: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > Reported-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> > Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> > ---
> >  drivers/usb/chipidea/udc.c |    3 ---
> >  1 file changed, 3 deletions(-)
> 
> First comment, you send a bunch of patches, yet you didn't sign off on
> some of them, why?  If you are forwarding on patches, please sign off
> showing you have reviewed them (so you can be on the path-of-blame if
> there is a problem...)
You're right :)
> 
> There has been some discussion on some of these patches, so I'm guessing
> we need a v8 set of this series at the least?
Yes.

Thanks
Richard
> 
> thanks,
> 
> greg k-h
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
