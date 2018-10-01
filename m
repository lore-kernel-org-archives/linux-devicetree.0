Return-Path: <SRS0=9BQ+=MN=verge.net.au=horms@kernel.org>
Date: Mon, 1 Oct 2018 14:36:41 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: Document iWave RZ/G1N SOM
Message-ID: <20181001123628.caddj5tfhd3xcz67@verge.net.au>
References: <1537950104-18330-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdUPkbVs3UxqrP63Fx=25XvKCB=U5qy5TETydHT3=zi-tQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUPkbVs3UxqrP63Fx=25XvKCB=U5qy5TETydHT3=zi-tQ@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Sep 26, 2018 at 01:37:59PM +0200, Geert Uytterhoeven wrote:
> On Wed, Sep 26, 2018 at 10:28 AM Biju Das <biju.das@bp.renesas.com> wrote:
> > Document the iW-RainboW-G20M-RZ/G1N Qseven device tree bindings,
> > listing it as a supported system on module.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > ---
> > iWave uses the same "iW-RainboW-G20M-Qseven" name for both
> > iWave-RZ/G1N and iWave-RZ/G1M Q7 SOM. Details can be found
> > in the below link
> > https://www.iwavesystems.com/rz-g1m-qseven-module.html
> 
> Makes perfect sense, as the SoCs are pin-compatible.

Thanks, applied for v4.21.
