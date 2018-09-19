Return-Path: <SRS0=njd1=MB=verge.net.au=horms@kernel.org>
Date: Wed, 19 Sep 2018 11:23:31 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] ARM: dts: r8a77470: Add APMU node and second CPU core
Message-ID: <20180919092329.uwzpn7di4zfonzgj@verge.net.au>
References: <1537173850-5310-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537173850-5310-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVmwevtcjHyKcY5Y0pXFOQhAGeyhdSqF4PGJzVt5C2XMA@mail.gmail.com>
 <20180919082541.q6izcnj5pigp2fdz@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180919082541.q6izcnj5pigp2fdz@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Sep 19, 2018 at 10:25:42AM +0200, Simon Horman wrote:
> On Mon, Sep 17, 2018 at 10:53:16AM +0200, Geert Uytterhoeven wrote:
> > Perhaps "ARM: dts: r8a77470: Add SMP support"?
> > 
> > On Mon, Sep 17, 2018 at 10:44 AM Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com> wrote:
> > > Add DT node for the Advanced Power Management Unit (APMU), add the
> > > second CPU core, and use "renesas,apmu" as "enable-method".
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > 
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> I would like to ask to what extent this has been tested with respect to
> CPU hotplug, suspend to RAM, and combinations thereof.

And any details of firmware, bootloader, ... version stacks where this is
supported.
