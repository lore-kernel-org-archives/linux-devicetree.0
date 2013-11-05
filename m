From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 04/11] ARM: dts: imx6: add anatop phandle for usbphy
Date: Tue, 5 Nov 2013 11:02:11 +0800
Message-ID: <20131105030210.GE13472@shlinux1.ap.freescale.net>
References: <1383616183-10511-1-git-send-email-peter.chen@freescale.com>
 <1383616183-10511-5-git-send-email-peter.chen@freescale.com>
 <20131105024130.GG19770@S2101-09.ap.freescale.net>
 <20131105025307.GC13472@shlinux1.ap.freescale.net>
 <20131105031654.GL19770@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131105031654.GL19770-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 05, 2013 at 11:16:57AM +0800, Shawn Guo wrote:
> On Tue, Nov 05, 2013 at 10:53:08AM +0800, Peter Chen wrote:
> > On Tue, Nov 05, 2013 at 10:41:33AM +0800, Shawn Guo wrote:
> > > On Tue, Nov 05, 2013 at 09:49:36AM +0800, Peter Chen wrote:
> > > > Add anatop phandle for usbphy
> > > > 
> > > > Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > > ---
> > > >  arch/arm/boot/dts/imx6qdl.dtsi |    2 ++
> > > >  1 files changed, 2 insertions(+), 0 deletions(-)
> > > 
> > > Does imx6sl.dtsi need the same update?
> > > 
> > 
> > It is needed (for chipidea, it is the same), but I still have
> > no time to test on it. Will add them later.
> 
> So all "fsl,imx6sl-usbphy" code is untested so far?
> 
> Shawn

Yes, "fsl,imx23-usbphy" and "fsl,imx6q-usbphy" have been tested,
I will test imx6sl during this patchset review cycle.

-- 

Best Regards,
Peter Chen

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
