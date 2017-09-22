From: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 02/12] ARM: dts: sunxi: h3/h5: Fix i2c2 register address
Date: Fri, 22 Sep 2017 10:02:11 +0200
Message-ID: <20170922080211.GA24768@Red>
References: <20170921172151.29779-1-clabbe.montjoie@gmail.com>
 <20170921172151.29779-3-clabbe.montjoie@gmail.com>
 <20170922074945.jzibcgromgbhggxy@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170922074945.jzibcgromgbhggxy-ZC1Zs529Oq4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 22, 2017 at 09:49:45AM +0200, Maxime Ripard wrote:
> On Thu, Sep 21, 2017 at 05:21:41PM +0000, Corentin Labbe wrote:
> > The unit address and register address does not match.
> > This patch fix the register address with the good one.
> > 
> > Signed-off-by: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > index 59ddac9f65a7..37464d4d07f6 100644
> > --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > @@ -630,9 +630,9 @@
> >  			#size-cells = <0>;
> >  		};
> >  
> > -		i2c2: i2c@01c2b400 {
> > +		i2c2: i2c@1c2b400 {
> 
> This one should be merged into the previous patch.
> 
> The serie looks good otherwise, onec it's fixed, you can add my
> Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> 
> Maxime
> 

For me this patch could be backported (since it fixes a bug) so I have put it appart.
But as requsted, I will merge it.

Regards
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
