From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] ARM: dts: r8a7745: Add DU support
Date: Thu, 09 Nov 2017 11:31:25 +0200
Message-ID: <12916864.hfKIdpMrll@avalon>
References: <1509992814-4543-1-git-send-email-fabrizio.castro@bp.renesas.com> <9872942.on8edmfvcY@avalon> <20171108044822.ktnzzowzprqtdnsm@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20171108044822.ktnzzowzprqtdnsm@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Chris Paterson <chris.paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Simon,

On Wednesday, 8 November 2017 06:48:23 EET Simon Horman wrote:
> On Tue, Nov 07, 2017 at 06:05:37AM +0200, Laurent Pinchart wrote:
> > Hi Fabrizio,
> > 
> > Thank you for the patch.
> > 
> > On Monday, 6 November 2017 20:26:53 EET Fabrizio Castro wrote:
> > > Add du node to r8a7745 SoC DT. Boards that want to enable the DU
> > > need to specify the output topology.
> > > 
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > > ---
> > > 
> > >  arch/arm/boot/dts/r8a7745.dtsi | 27 +++++++++++++++++++++++++++
> > >  1 file changed, 27 insertions(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/r8a7745.dtsi
> > > b/arch/arm/boot/dts/r8a7745.dtsi index 846c27a..53eb1ce4 100644
> > > --- a/arch/arm/boot/dts/r8a7745.dtsi
> > > +++ b/arch/arm/boot/dts/r8a7745.dtsi
> > > @@ -821,6 +821,33 @@
> > > 
> > >  			status = "disabled";
> > >  		
> > >  		};
> > > 
> > > +		du: display@feb00000 {
> > > +			compatible = "renesas,du-r8a7745";
> 
> Hi,
> 
> could you provide some information on the status of upstreaming
> the binding used above?

I'll send a pull request for v4.16, it's too late for v4.15.

-- 
Regards,

Laurent Pinchart
