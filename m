From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/4] ARM i.MX6: use reserved bit for mxs phy clock gate
Date: Wed, 16 Jan 2013 09:48:57 +0800
Message-ID: <20130116014855.GA8118@S2101-09.ap.freescale.net>
References: <1358230117-19443-1-git-send-email-peter.chen@freescale.com>
 <20130115113313.GB32113@S2101-09.ap.freescale.net>
 <20130116011845.GB16514@nchen-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130116011845.GB16514@nchen-desktop>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 16, 2013 at 09:18:46AM +0800, Peter Chen wrote:
> On Tue, Jan 15, 2013 at 07:33:16PM +0800, Shawn Guo wrote:
> > On Tue, Jan 15, 2013 at 02:08:34PM +0800, Peter Chen wrote:
> > > For mxs-phy user i.mx6q, the PHY's clock is controlled by
> > > hardware automatically, the software only needs to enable it
> > > at probe, disable it at remove. During the runtime,
> > > we don't need to control it. So for the usbphy clk policy:
> > > 
> > > - Keep refcount for usbphy as clk framework needs to know if
> > > it is off or on.
> > 
> > Just checked the reference manual, it seems that not only bit 6
> > (EN_USB_CLKS) but also bit 12 (POWER) are controlled by USB hardware.
> > If this is true, I think that PLL3 and PLL7 are really designed for
> > USB PHY use only.  Do you actually see other real users of these two
> > PLLs on imx6q besides USB PHY?  If not, we can just provide a dummy
> > clock to mxs-phy driver on imx6q, and keep real clocks usbphy1 and
> > usbphy2 there for platform init function to enable them if USB support
> > is built in.  Then, we can save all these dirty hacks.  Thoughts?
> It was my v1 patch did.
> 
I thought it might be okay to access anatop for enabling the clock in
usb driver.  But I found it's just too ugly to do that when I look at
the code a little bit closer.  I prefer to keep clock driver unchanged
and just call clk_prepare_enable() at platform level to enable the
clock.  I really dislike the code accessing anatop for enabling the
clock.  That's the part different from you v1 patch.

> I send the v2 patch due to below reasons,
> There are other PLL3 users, it is better keep refcount
> to all its children, or the user will be confused when the
> PLL3 goes to disable, but the usb otg part is still used
> 
This is the part I'm not sure how it works.  You said, the PLL will be
managed by hardware during USB suspend/resume.  I assume that it means
the PLL will be powered off when USB suspends and be powered on when
USB resumes.  If that's the case, how other users of the PLL work when
PLL is powered off by USB hardware.

Shawn

> For PLL7, we can do it, and let the PLL7 be out of clock framework
> management.
> 
> But I still think keep usbphy as PLL child is better solution,
> in that case, the clock maintainer can know the real clock usage.
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
