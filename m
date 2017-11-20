From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: r8a779x: Add '#reset-cells' in cpg-mssr
Date: Mon, 20 Nov 2017 11:34:30 +0100
Message-ID: <20171120103430.2v2sbzdzbiyabpcb@verge.net.au>
References: <1510839357-11450-1-git-send-email-geert+renesas@glider.be>
 <20171120094957.2seep3qw4j274zrv@verge.net.au>
 <CAMuHMdXPrv4bwZbGxE=DJp2nufjF5Q6JwFAERDvBFi+UsAXVsA@mail.gmail.com>
 <20171120102611.hyrufkxou27gspah@verge.net.au>
 <CAK8P3a345J8JfVu4g+refG+y8r8VmMsjKPkUnYen4kMhQYvtEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a345J8JfVu4g+refG+y8r8VmMsjKPkUnYen4kMhQYvtEg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 20, 2017 at 11:30:49AM +0100, Arnd Bergmann wrote:
> On Mon, Nov 20, 2017 at 11:26 AM, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
> > On Mon, Nov 20, 2017 at 10:57:07AM +0100, Geert Uytterhoeven wrote:
> >> Hi Simon,
> >>
> >> On Mon, Nov 20, 2017 at 10:49 AM, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
> >> > On Thu, Nov 16, 2017 at 02:35:57PM +0100, Geert Uytterhoeven wrote:
> >> >> From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> >> >>
> >> >> With the latest dtc, we get many warnings about the missing
> >> >> '#reset-cells' property in these controllers, e.g.:
> >> >>
> >> >> arch/arm/boot/dts/r8a7790-lager.dtb: Warning (resets_property): Missing property '#reset-cells' in node /clock-controller@e6150000 or bad phandle (referred from /can@e6e80000:resets[0])
> >> >> arch/arm/boot/dts/r8a7792-blanche.dtb: Warning (resets_property): Missing property '#reset-cells' in node /soc/clock-controller@e6150000 or bad phandle (referred from /soc/dma-controller@e6700000:resets[0])
> >> >> arch/arm/boot/dts/r8a7792-wheat.dtb: Warning (resets_property): Missing property '#reset-cells' in node /soc/clock-controller@e6150000 or bad phandle (referred from /soc/ethernet@e6800000:resets[0])
> >> >> arch/arm/boot/dts/r8a7793-gose.dtb: Warning (resets_property): Missing property '#reset-cells' in node /clock-controller@e6150000 or bad phandle (referred from /gpio@e6050000:resets[0])
> >> >> arch/arm/boot/dts/r8a7794-alt.dtb: Warning (resets_property): Missing property '#reset-cells' in node /clock-controller@e6150000 or bad phandle (referred from /i2c@e6500000:resets[0])
> >> >> arch/arm/boot/dts/r8a7794-silk.dtb: Warning (resets_property): Missing property '#reset-cells' in node /clock-controller@e6150000 or bad phandle (referred from /interrupt-controller@e61c0000:resets[0])
> >> >>
> >> >> This adds it for the three r8a779x chips that were lacking it. The
> >> >> binding mandates this as <1>, so this is the value I use.
> >> >>
> >> >> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> >> >> [geert: Add fix for r8a7793.dtsi]
> >> >> Fixes: 34fbd2b12761d111 ("ARM: dts: r8a7790: Add reset control properties")
> >> >> Fixes: 6e11a322f1d7505d ("ARM: dts: r8a7792: Add reset control properties")
> >> >> Fixes: 84fb19e1d201ba86 ("ARM: dts: r8a7793: Add reset control properties")
> >> >> Fixes: 615beb759ca494a4 ("ARM: dts: r8a7794: Add reset control properties")
> >> >> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> >> >
> >> > Thanks for following up on this, its been fouling up my todo list for a
> >> > while now. Applied for v4.16.
> >>
> >> As this is a fix for changes made in v4.15-rc1, don't we want it in v4.15?
> >
> > Do the changes have any run-time effect?
> > If not I'd prefer not to push them into v4.15 as fixes.
> 
> The main effect right now is that we're up from no warnings in the
> default build to
> hundreds of warnings, which is really annoying. Obviously there is
> little gain in
> fixing these but not the other warnings that were introduced, but I would either
> want to fix them all, or disable the warning for one more release.
> 
> Rob, what do you think we should do here?

Ok, I'll queued these up as fixes for v4.15 as it seems to move things
in your desired direction.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
