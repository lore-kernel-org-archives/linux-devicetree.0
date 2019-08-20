Return-Path: <SRS0=BRjG=WQ=verge.net.au=horms@kernel.org>
Date: Tue, 20 Aug 2019 17:19:30 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] dt-bindings: sh-mobile-ceu: Rename bindings
 documentation file
Message-ID: <20190820151930.pwi42cewslkchssf@verge.net.au>
References: <20190819140544.19294-1-horms+renesas@verge.net.au>
 <20190820095205.xnthl7d7cpy7myq2@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820095205.xnthl7d7cpy7myq2@uno.localdomain>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 20, 2019 at 11:52:05AM +0200, Jacopo Mondi wrote:
> Hi Simon,
> 
> On Mon, Aug 19, 2019 at 04:05:44PM +0200, Simon Horman wrote:
> > Renesas media binding documentation files uses a naming schema of
> > 'renesas,<module>.txt'. Rename the SH Mobile CEU file to match this pattern.
> >
> 
> The old soc-camera based sh-mobile-ceu driver has been removed one
> year ago and replaced by driver/media/platform/renesas-ceu.c whose
> bindings are described at
> Documentation/devicetree/bindings/media/renesas,ceu.txt
> 
> Should this file be removed instead of renamed?

Thanks,

I thought I had checked that but clearly I did not.
I agree the file should be removed and I'll send a revised patch
accordingly.

> 
> Thanks
>   j
> 
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> > Based on v5.3-rc1
> > ---
> >  .../bindings/media/{sh_mobile_ceu.txt => renesas,sh-mobile-ceu.txt}       | 0
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename Documentation/devicetree/bindings/media/{sh_mobile_ceu.txt => renesas,sh-mobile-ceu.txt} (100%)
> >
> > diff --git a/Documentation/devicetree/bindings/media/sh_mobile_ceu.txt b/Documentation/devicetree/bindings/media/renesas,sh-mobile-ceu.txt
> > similarity index 100%
> > rename from Documentation/devicetree/bindings/media/sh_mobile_ceu.txt
> > rename to Documentation/devicetree/bindings/media/renesas,sh-mobile-ceu.txt
> > --
> > 2.11.0
> >
