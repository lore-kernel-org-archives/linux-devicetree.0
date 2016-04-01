From: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 06/11] phy: da8xx-usb: new driver for DA8XX SoC USB PHY
Date: Fri, 1 Apr 2016 14:56:35 -0500
Message-ID: <20160401195635.GA29841@uda0271908>
References: <1458181615-27782-1-git-send-email-david@lechnology.com>
 <1458181615-27782-7-git-send-email-david@lechnology.com>
 <56FE74AC.6080303@ti.com>
 <20160401144510.GA6264@uda0271908>
 <56FE9B8F.7050605@lechnology.com>
 <56FECFEB.2030708@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56FECFEB.2030708-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Apr 01, 2016 at 10:45:47PM +0300, Sergei Shtylyov wrote:
> On 04/01/2016 07:02 PM, David Lechner wrote:
> 
> >>>>+EXPORT_SYMBOL_GPL(da8xx_usb20_phy_set_mode);
> >>>
> >>>Don't prefer export symbols from PHY driver. That'll create unnecessary
> >>>dependencies between the controller and the PHY.
> >>
> >>Agreed.
> >>
> >>>I think it'll be better to create a new attribute and use it?
> >>
> >>Another simpler option is to not support _set_mode() for DA8xx, and the
> >>phy driver set the otgmode bit in probe() based on dr_mode of the
> >>controller.
> >>
> >>Regards,
> >>-Bin.
> >
> >This certainly works for my particular use case, however, Sergei Shtylyov, who
> >wrote the da8xx musb glue layer originally, seemed to recall in his review of
> >the patch series that this really is necessary for OTG mode to work properly.
> 
>    No, it's still not necessary, however this method is now called
> from musb_init_controller() (it wasn't in my time). ISTR however
> that you needed to enforce the mode override in CFGCHIP2 for the
> host mode to function properly.

Yes, but I think we don't have to rely on musb_init_controller(), what
we can do is the phy probe() calls of_usb_get_dr_mode_by_phy() to get
the dr_mode of the controller then sets CFGCHIP2 bits accordingly, so
that we can drop _set_mode() in the phy driver.

Regards,
-Bin.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
