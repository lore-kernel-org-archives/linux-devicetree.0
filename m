Return-Path: <SRS0=W0ze=OA=verge.net.au=horms@kernel.org>
Date: Wed, 21 Nov 2018 11:20:02 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] dt-bindings: can: rcar_canfd: document r8a77965
 support
Message-ID: <20181121102002.hkw5xsbiivaewftr@verge.net.au>
References: <20181118173201.4645-1-marek.vasut+renesas@gmail.com>
 <20181118231807.GE2553@kunai>
 <20181119104139.ujbtl4jfnhxj5gxy@verge.net.au>
 <20181119105358.GB932@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181119105358.GB932@kunai>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Marek Vasut <marek.vasut@gmail.com>, devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Nov 19, 2018 at 11:53:58AM +0100, Wolfram Sang wrote:
> On Mon, Nov 19, 2018 at 11:41:39AM +0100, Simon Horman wrote:
> > On Mon, Nov 19, 2018 at 12:18:07AM +0100, Wolfram Sang wrote:
> > > 
> > > > +  - "renesas,r8a77965-canfd" for R8A77965 (R-Car M3-N) compatible controller.
> > > 
> > > Eeeks, the 'canfd' is a suffix here not a prefix :( Not your issue,
> > > of course. But Simon, shall we fix that for all CANFD?
> > 
> > I think its too late to fix it for existing bindings.
> > We could move to a new scheme for r8a77965 and beyond,
> > but that is rather messy. I lean to wards continuing with
> > using 'canfd' as a suffix.
> 
> Geert, Simon: OK, thanks for the answers.

I think this is good to go as-is.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
