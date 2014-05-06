From: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH 1/2] usb: dwc2: Option to disable dma descriptor mode
Date: Tue, 6 May 2014 20:11:34 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E03046D193D1E@US01WEMBX2.internal.synopsys.com>
References: <1399328585-30949-1-git-send-email-dinguyen@altera.com>
 <A2CA0424C0A6F04399FB9E1CD98E03046D193CDB@US01WEMBX2.internal.synopsys.com>
 <20140506183630.GA31117@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140506183630.GA31117-HgARHv6XitL9zxVx7UNMDg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
Cc: "dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org" <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> From: Felipe Balbi [mailto:balbi-l0cyMroinI0@public.gmane.org]
> Sent: Tuesday, May 06, 2014 11:37 AM
> 
> On Tue, May 06, 2014 at 06:21:02PM +0000, Paul Zimmerman wrote:
> > > From: dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org [mailto:dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org]
> > > Sent: Monday, May 05, 2014 3:23 PM
> > >
> > > Even though the IP supports Descriptor DMA mode, it does not support SPLIT
> > > transactions in this mode. Since the driver can get the Descriptor DMA mode
> > > support from hardware, the driver in its currently form cannot fully support
> > > LS/FS devices connected to a HS Hub when Descriptor DMA mode is enabled in the
> > > driver. Thus, we give the option to disable Descriptor DMA from device tree.
> >
> > Hi Dinh,
> >
> > Instead of this patch, how about if we make the driver default to buffer
> > DMA mode instead, and if anyone wants to use descriptor DMA mode, they
> > can add a DT property for that? I don't think anyone will want that,
> > since as you say it doesn't fully support LS/FS devices in that mode.
> >
> > The driver originally worked like that. I guess the default got changed by
> > one of Matthijs' patches, and I didn't notice it.
> 
> if this is the case, I guess you could call it a regression - well, it
> _did_ break LS/FS use cases - and still merge it during the -rc cycle.

Well, the change from Matthijs went in on August 30th last year. So it's
not exactly a recent regression ;)

-- 
Paul

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
