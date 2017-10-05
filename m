From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: initial Eagle board device
 tree
Date: Thu, 5 Oct 2017 11:03:49 +0200
Message-ID: <20171005090348.GB26369@verge.net.au>
References: <20170915194445.950496886@cogentembedded.com>
 <CAMuHMdUX+RW9H-p5n_JB-SkW8k5g_i0bg-i9LD59b5MLvFm3YQ@mail.gmail.com>
 <9ad9bd62-300c-cc78-a8f3-bbdd9eed6bed@cogentembedded.com>
 <CAMuHMdUfRr-X_+pZhmWw28SDwa5=7daSefjVaT9y5cFB9VoO6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUfRr-X_+pZhmWw28SDwa5=7daSefjVaT9y5cFB9VoO6Q@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 04, 2017 at 01:10:26PM +0200, Geert Uytterhoeven wrote:
> Hi Sergei,
> 
> On Wed, Oct 4, 2017 at 1:03 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > On 9/21/2017 4:18 PM, Geert Uytterhoeven wrote:
> >>> Add the initial device  tree for  the R8A77970 SoC based Eagle board.
> >>> The board has 1 debug serial port (SCIF0); include support for it,
> >>> so that the serial console can work.
> >>>
> >>> Based on the original (and large) patch by Vladimir Barinov
> >>> <vladimir.barinov@cogentembedded.com>.
> >>>
> >>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> >>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >>
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>
> >>> --- /dev/null
> >>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> 
> >>> +&extal_clk {
> >>> +       clock-frequency = <16666666>;
> >>
> >>
> >> Nitpicking: the schematics say 16.6666 MHz
> >> At 100 ppm accuracy that's the same, though.
> >
> >    So, you still want me to change this freq?
> 
> I don't think that's really needed, as the difference is smaller than the
> accuracy anyway.

Thanks, I have applied this patch for v4.15.
