From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: r8a7745: Add DU support
Date: Fri, 10 Nov 2017 09:32:49 +0100
Message-ID: <20171110083248.3lurepyfmrvxejaa@verge.net.au>
References: <1509992814-4543-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <9872942.on8edmfvcY@avalon>
 <20171108044822.ktnzzowzprqtdnsm@verge.net.au>
 <12916864.hfKIdpMrll@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <12916864.hfKIdpMrll@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 09, 2017 at 11:31:25AM +0200, Laurent Pinchart wrote:
> Hi Simon,
> 
> On Wednesday, 8 November 2017 06:48:23 EET Simon Horman wrote:
> > On Tue, Nov 07, 2017 at 06:05:37AM +0200, Laurent Pinchart wrote:
> > > Hi Fabrizio,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Monday, 6 November 2017 20:26:53 EET Fabrizio Castro wrote:
> > > > Add du node to r8a7745 SoC DT. Boards that want to enable the DU
> > > > need to specify the output topology.
> > > > 
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> > > > Reviewed-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> > > 
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> > > 
> > > > ---
> > > > 
> > > >  arch/arm/boot/dts/r8a7745.dtsi | 27 +++++++++++++++++++++++++++
> > > >  1 file changed, 27 insertions(+)
> > > > 
> > > > diff --git a/arch/arm/boot/dts/r8a7745.dtsi
> > > > b/arch/arm/boot/dts/r8a7745.dtsi index 846c27a..53eb1ce4 100644
> > > > --- a/arch/arm/boot/dts/r8a7745.dtsi
> > > > +++ b/arch/arm/boot/dts/r8a7745.dtsi
> > > > @@ -821,6 +821,33 @@
> > > > 
> > > >  			status = "disabled";
> > > >  		
> > > >  		};
> > > > 
> > > > +		du: display@feb00000 {
> > > > +			compatible = "renesas,du-r8a7745";
> > 
> > Hi,
> > 
> > could you provide some information on the status of upstreaming
> > the binding used above?
> 
> I'll send a pull request for v4.16, it's too late for v4.15.

Thanks, I'm happy with patches in that stage of being upstreamed
as the basis for accepting these patches. I'll see about doing so.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
