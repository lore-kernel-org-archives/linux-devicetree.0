Return-Path: <SRS0=cfG7=P7=verge.net.au=horms@kernel.org>
Date: Wed, 23 Jan 2019 10:01:21 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 1/5] ARM: dts: r8a7743: Convert to new LVDS DT bindings
Message-ID: <20190123090120.rqrr6x4of6crflel@verge.net.au>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
 <1548170749-12773-2-git-send-email-biju.das@bp.renesas.com>
 <20190122171325.GC26166@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190122171325.GC26166@pendragon.ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jan 22, 2019 at 07:13:25PM +0200, Laurent Pinchart wrote:
> Hi Biju,
> 
> Thank you for the patch.
> 
> On Tue, Jan 22, 2019 at 03:25:45PM +0000, Biju Das wrote:
> > The internal LVDS encoder now has DT bindings separate from the DU. Port
> > the device tree over to the new model.
> > 
> > Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
> 
> Sorry for the breakage. The DT and DU series raced each other, but I
> should have still caught it.
> 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> I expect Simon to pick this up.

Thanks, applied as a fix for v5.0 as the fixes tag indicates the breakage
occurred in v4.17.
