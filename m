From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH v3 0/5] usb: change clock information for chipidea
Date: Wed, 30 Sep 2015 14:48:57 +0800
Message-ID: <20150930064857.GF16362@tiger>
References: <1443579925-1330-1-git-send-email-peter.chen@freescale.com>
 <20150930052835.GC18468@tiger>
 <20150930062427.GA1665@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150930062427.GA1665@shlinux2>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 30, 2015 at 02:24:28PM +0800, Peter Chen wrote:
> On Wed, Sep 30, 2015 at 01:28:36PM +0800, Shawn Guo wrote:
> > On Wed, Sep 30, 2015 at 10:25:20AM +0800, Peter Chen wrote:
> > > This patch set changes usb clock information for legacy i.mx platforms.
> > > At these platforms, they needs three clocks to let controller work.
> > > 
> > > Hi Shawn,
> > > 
> > > Fabio has tested for both imx27 and imx25 platforms.
> > > I have queued 1/5 and 5/5, would you please help to queue others,
> > > thanks.
> > > 
> > > Changes for v3:
> > > - Delete property "needs-three-clocks", and using of_device_id->data
> > >   to differentiate platforms
> > > - change <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> #v3.19+ to <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> #v4.1+
> > 
> > So the last patch will be sent as a fix with stable on copy?
> 
> Yes
> 
> > In that
> > case, will USB driver just work without corresponding DTS change?  Or
> > the driver change has a dependency on the DTS change?
> > 
> 
> At v4.1, One of USB driver changes break i.mx27's USB function.
> The driver's change at patch 5/5 is also tagged for stable tree,
> so it needs both DTS and driver's change to let i.mx27 USB work from
> v4.1.

In that case, you need to have dts and driver changes go through the
same tree.  For dts patches, you can have

Acked-by: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

As a side note, the kernel change breaks the ABI with DT anyway.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
