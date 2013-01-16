From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 1/4] ARM i.MX6: use reserved bit for mxs phy clock
 gate
Date: Wed, 16 Jan 2013 10:10:37 +0800
Message-ID: <20130116021035.GE16514@nchen-desktop>
References: <1358230117-19443-1-git-send-email-peter.chen@freescale.com>
 <20130115113313.GB32113@S2101-09.ap.freescale.net>
 <20130116011845.GB16514@nchen-desktop>
 <20130116014855.GA8118@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130116014855.GA8118-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 16, 2013 at 09:48:57AM +0800, Shawn Guo wrote:
> On Wed, Jan 16, 2013 at 09:18:46AM +0800, Peter Chen wrote:
> > On Tue, Jan 15, 2013 at 07:33:16PM +0800, Shawn Guo wrote:
> > > On Tue, Jan 15, 2013 at 02:08:34PM +0800, Peter Chen wrote:
> > > > For mxs-phy user i.mx6q, the PHY's clock is controlled by
> > > > hardware automatically, the software only needs to enable it
> > > > at probe, disable it at remove. During the runtime,
> > > > we don't need to control it. So for the usbphy clk policy:
> > > > 
> > > > - Keep refcount for usbphy as clk framework needs to know if
> > > > it is off or on.
> > > 
> I thought it might be okay to access anatop for enabling the clock in
> usb driver.  But I found it's just too ugly to do that when I look at
> the code a little bit closer.  I prefer to keep clock driver unchanged
> and just call clk_prepare_enable() at platform level to enable the
> clock.  I really dislike the code accessing anatop for enabling the
> clock.  That's the part different from you v1 patch.

It is a way, but how to consolidate other mxx-phy users, like mx28.
It needs to call clk_prepare_enable runtime.
> 
> > I send the v2 patch due to below reasons,
> > There are other PLL3 users, it is better keep refcount
> > to all its children, or the user will be confused when the
> > PLL3 goes to disable, but the usb otg part is still used
> > 
> This is the part I'm not sure how it works.  You said, the PLL will be
> managed by hardware during USB suspend/resume.  I assume that it means
> the PLL will be powered off when USB suspends and be powered on when
> USB resumes.  If that's the case, how other users of the PLL work when
> PLL is powered off by USB hardware.

It is a little complicated:
You can understand both PLL7 and PLL3 like below:
PLL_POWER_BIT && usb_is_not_suspend
For PLL7: USB host 1 is the only user, so we can keep PLL7_POWER_BIT is always on
and let the usb hardware controller it automatically. Other way is let the
clock framework and usb hardware controller it together.
For PLL3, as there are other users, so software must control PLL3_POWER_BIT,
or the PLL3 will be off if the usb enters suspend.

This PLL_POWER_BIT is not related to usbphy clock gate, this power bit can be
usbphy's parent.

> 
> Shawn
> 
> > For PLL7, we can do it, and let the PLL7 be out of clock framework
> > management.
> > 
> > But I still think keep usbphy as PLL child is better solution,
> > in that case, the clock maintainer can know the real clock usage.
> > 

-- 

Best Regards,
Peter Chen

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
