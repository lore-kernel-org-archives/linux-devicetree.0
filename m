From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH  2/2] ARM: dts: r8a7743: Add I2C DT support
Date: Mon, 14 Aug 2017 07:37:17 +0200
Message-ID: <20170814053717.GD5654@verge.net.au>
References: <1502191449-16118-1-git-send-email-biju.das@bp.renesas.com>
 <20170809085238.GJ2705@verge.net.au>
 <KL1PR06MB17020664F5636F87F9F97597B88B0@KL1PR06MB1702.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <KL1PR06MB17020664F5636F87F9F97597B88B0-k6wCOA2IOKSx7cDWSRonpW0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 09, 2017 at 09:23:05AM +0000, Biju Das wrote:
> 
> 
> > -----Original Message-----
> > From: Simon Horman [mailto:horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org]
> > Sent: 09 August 2017 09:53
> > To: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland
> > <mark.rutland-5wv7dgnIgG8@public.gmane.org>; Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>; Magnus
> > Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>; Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>;
> > Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > Subject: Re: [PATCH 2/2] ARM: dts: r8a7743: Add I2C DT support
> >
> > On Tue, Aug 08, 2017 at 12:24:09PM +0100, Biju Das wrote:
> > > Add the I2C[0-5] devices to the r8a7743 device tree.
> > >
> > > Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> > > ---
> > > This patch has been tested against Linux-next tag 20170727 and renesas-dev
> > branch.
> > > This patch depends on
> > > https://www.mail-archive.com/linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg1700
> > > 8.html
> >
> > As per the patch at the link above it seems that these patches are targeted at
> > the renesas tree.  The best practice in that case is to base patches on the latest
> > devel branch. Please consider doing so in future.
> >
> > I would also slightly prefer if dependencies were referenced by name, in this
> > case:
> >
> > *  [PATCH 2/3] ARM: dts: r8a7743: Add APMU node and second CPU core
> >
> > or
> >
> > * [PATCH  0/3] Add SMP support
> >
> > Also including a link is fine by me.
> >
> >
> > It would also be useful if you described the dependency as a conflict (merge-
> > time), compile-time or run-time.
> 
> 
> Thanks Simon. I will take care this next time.
> 
> > As for the patch itself, it looks good to me.

As I believe the dependencies are apply-time and seemed easy to resolve
I have applied this patch for v4.14.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
