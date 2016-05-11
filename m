From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM64: dts: rockchip: enable eMMC for rk3399 EVB
Date: Wed, 11 May 2016 15:32:33 -0700
Message-ID: <20160511223233.GB65449@google.com>
References: <1462924975-69072-1-git-send-email-briannorris@chromium.org>
 <1462924975-69072-2-git-send-email-briannorris@chromium.org>
 <4355979.JCGxOmTVBW@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4355979.JCGxOmTVBW@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 11, 2016 at 04:51:58PM +0200, Heiko Stuebner wrote:
> Hi Brian,
> 
> Am Dienstag, 10. Mai 2016, 17:02:55 schrieb Brian Norris:
> > The 'mmc-hs400-enhanced-strobe' property has been acked by Rob Herring,
> > though it's still not merged.
> 
> The commit message should describe the actual change not the volatile 
> environment surrounding it :-) .
> 
> When I apply this patch the property-binding will have made it into a 
> maintainer-tree so is not valid anymore then. That is more material for the 
> "comment-section" below the "---"

Of course. I think I just felt guilty without a commit message :)

> > Signed-off-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3399-evb.dts | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
> > b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts index
> > 1a3eb1482050..ccfd2bcf02e1 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
> > @@ -89,6 +89,18 @@
> >  	status = "okay";
> >  };
> > 
> > +&emmc_phy {
> > +	status = "okay";
> > +};
> > +
> > +&sdhci {
> > +	bus-width = <8>;
> > +	mmc-hs400-1_8v;
> > +	non-removable;
> > +	mmc-hs400-enhanced-strobe;
> 
> alphabetic ordering of properties please

Will fix.

Thanks,
Brian

> > +	status = "okay";
> > +};
> > +
> >  &uart2 {
> >  	status = "okay";
> >  };
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
