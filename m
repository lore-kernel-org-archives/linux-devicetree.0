Return-Path: <SRS0=1U1q=PM=verge.net.au=horms@kernel.org>
Date: Fri, 4 Jan 2019 14:14:09 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 4/5] ARM: dts: r8a7743: Remove LVDS encoder from du
 node
Message-ID: <20190104131408.dytwgjhw3ikn7ik3@verge.net.au>
References: <1544000815-28069-1-git-send-email-biju.das@bp.renesas.com>
 <1544000815-28069-5-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdW+qVJxu0fjC+j8w-neHU8FOHmJqRbHAtp1JvKYJ+RrXQ@mail.gmail.com>
 <OSBPR01MB2103C5C4C2A5B276E80D047AB88D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190104090517.bi5et5osmyxmfrwb@verge.net.au>
 <OSBPR01MB2103D40FC38C4A75476EBC39B88E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2103D40FC38C4A75476EBC39B88E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jan 04, 2019 at 10:02:02AM +0000, Biju Das wrote:
> Hi Simon,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH v2 4/5] ARM: dts: r8a7743: Remove LVDS encoder from
> > du node
> >
> > On Thu, Jan 03, 2019 at 02:34:39PM +0000, Biju Das wrote:
> > > Hi Geert,
> > >
> > > Thanks for the feedback.
> > >
> > > > Subject: Re: [PATCH v2 4/5] ARM: dts: r8a7743: Remove LVDS encoder
> > > > from du node
> > > >
> > > > Hi Biju,
> > > >
> > > > On Wed, Dec 5, 2018 at 10:15 AM Biju Das <biju.das@bp.renesas.com>
> > > > wrote:
> > > > > The internal LVDS encoder now has DT bindings separate from the DU.
> > > > > So remove it from du node.
> > > > >
> > > > > Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to
> > > > > bridge driver")
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > ---
> > > > > V1-->V2
> > > > >         * Removed LVDS encoder definition from DU node.
> > > >
> > > > Shouldn't you add a new node for the LVDS encoder?
> > >
> > > Yes for Soc Dtsi , I will add the new node for LVDS encoder.
> >
> > Can I clarify that I should wait for a fresh revision of this and the following
> > patch?
> 
> My original plan was to submit LVDS encoder patch as separate one.
> 
> But now we are agreeing for adding  LVDS encoder node as part of the fix (Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
> So I will send V3 with this change.

Great, thanks!
