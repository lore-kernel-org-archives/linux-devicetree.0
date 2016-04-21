From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH] arm64: defconfig: Add Renesas R-Car USB 3.0 driver
 support
Date: Thu, 21 Apr 2016 09:44:57 +0000
Message-ID: <SG2PR06MB09199B8168E3822A9B09E9C6D86E0@SG2PR06MB0919.apcprd06.prod.outlook.com>
References: <1461142034-5008-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20160421031514.GB11116@verge.net.au>
 <SG2PR06MB0919C567798F775F2685811ED86E0@SG2PR06MB0919.apcprd06.prod.outlook.com>
 <20160421035623.GB28575@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160421035623.GB28575-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Content-Language: ja-JP
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: "magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Simon-san,

> From: Simon Horman
> Sent: Thursday, April 21, 2016 12:56 PM
> 
< snip >
> > > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > > index a44ef99..a95751d 100644
> > > > --- a/arch/arm64/configs/defconfig
> > > > +++ b/arch/arm64/configs/defconfig
> > > > @@ -1,7 +1,6 @@
> > > >  # CONFIG_LOCALVERSION_AUTO is not set
> > > >  CONFIG_SYSVIPC=y
> > > >  CONFIG_POSIX_MQUEUE=y
> > > > -CONFIG_FHANDLE=y
> > > >  CONFIG_AUDIT=y
> > > >  CONFIG_NO_HZ_IDLE=y
> > > >  CONFIG_HIGH_RES_TIMERS=y
> > >
> > > Is the hunk above intended?
> > > It does not seem to match my reading of the changelog.
> >
> > Perhaps I should make a patch for this change because
> > if I did the following commands, this change appeared.
> 
> I'm not sure how the ARM-SoC maintainers feel about such cleanups
> these days. I suggest just dropping that part of the change for now.

Thank you for the suggestion!
I agree with you. So, I will submit v2 patch today.

Best regards,
Yoshihiro Shimoda

> > on renesas-devel-20160420-v4.6-rc4
> > $ make defconfig
> > $ cp defconfig arch/arm64/config
> > $ git diff
> >
> > Best regards,
> > Yoshihiro Shimoda
> >
> > > > @@ -192,7 +191,7 @@ CONFIG_SND_SOC_AK4613=y
> > > >  CONFIG_USB=y
> > > >  CONFIG_USB_OTG=y
> > > >  CONFIG_USB_XHCI_HCD=y
> > > > -CONFIG_USB_XHCI_PLATFORM=y
> > > > +CONFIG_USB_XHCI_RCAR=y
> > > >  CONFIG_USB_EHCI_HCD=y
> > > >  CONFIG_USB_EHCI_MSM=y
> > > >  CONFIG_USB_EHCI_HCD_PLATFORM=y
> > > > --
> > > > 1.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
