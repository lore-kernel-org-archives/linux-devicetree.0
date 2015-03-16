From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [RFC 10/18] omap3isp: Move the syscon register out of the ISP
 register maps
Date: Tue, 17 Mar 2015 01:21:46 +0200
Message-ID: <20150316232146.GF11954@valkosipuli.retiisi.org.uk>
References: <1425764475-27691-1-git-send-email-sakari.ailus@iki.fi>
 <1425764475-27691-11-git-send-email-sakari.ailus@iki.fi>
 <5344778.cfsY6SCB4g@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5344778.cfsY6SCB4g@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 16, 2015 at 02:19:04AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Saturday 07 March 2015 23:41:07 Sakari Ailus wrote:
> > The syscon register isn't part of the ISP, use it through the syscom driver
> > regmap instead. The syscom block is considered to be from 343x on ISP
> > revision 2.0 whereas 15.0 is assumed to have 3630 syscon.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/omap3.dtsi                |    2 +-
> >  arch/arm/mach-omap2/devices.c               |   10 ----------
> >  drivers/media/platform/omap3isp/isp.c       |   19 +++++++++++++++----
> >  drivers/media/platform/omap3isp/isp.h       |   19 +++++++++++++++++--
> >  drivers/media/platform/omap3isp/ispcsiphy.c |   20 +++++++++-----------
> 
> I've noticed another issue, you need a "select MFD_SYSCON" in Kconfig.

Thanks, fixed!

-- 
Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
