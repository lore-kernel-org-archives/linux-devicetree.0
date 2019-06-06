Return-Path: <SRS0=Sfu6=UF=verge.net.au=horms@kernel.org>
Date: Thu, 6 Jun 2019 10:42:27 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] ARM: dts: r7s9210: Add IRQC device node
Message-ID: <20190606084227.vmoi7gl3klnuqmdc@verge.net.au>
References: <20190604200914.64896-1-chris.brandt@renesas.com>
 <20190604200914.64896-2-chris.brandt@renesas.com>
 <CAMuHMdXocLb+d7Qv9=qe+bYG27pJO5sMUDkdWmj1WFqZ9JiQTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXocLb+d7Qv9=qe+bYG27pJO5sMUDkdWmj1WFqZ9JiQTw@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jun 05, 2019 at 03:14:17PM +0200, Geert Uytterhoeven wrote:
> On Tue, Jun 4, 2019 at 10:09 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> > Enable support for the IRQC on RZ/A2M, which is a small front-end to the
> > GIC.  This allows to use up to 8 external interrupts with configurable
> > sense select.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for inclusion in v5.3.
