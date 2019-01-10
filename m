Return-Path: <SRS0=vyWa=PS=verge.net.au=horms@kernel.org>
Date: Thu, 10 Jan 2019 10:39:54 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: v3msk: specify EtherAVB PHY IRQ
Message-ID: <20190110093953.o43ilpmuppnjzpp5@verge.net.au>
References: <038a791d-aa57-9c3d-eaea-09c5704ecb54@cogentembedded.com>
 <f9c6b067-80ba-c3c6-abcb-57d9524972fc@cogentembedded.com>
 <CAMuHMdWV92SY2VOXBObr56nf=kA4C4G1jn1QQK7UizcF02v9ig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWV92SY2VOXBObr56nf=kA4C4G1jn1QQK7UizcF02v9ig@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jan 09, 2019 at 09:29:12AM +0100, Geert Uytterhoeven wrote:
> On Tue, Jan 8, 2019 at 8:57 PM Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > Specify EtherAVB PHY IRQ in the V3M Starter Kit board's device tree, now
> > that we have the GPIO support (previously phylib had to resort to polling).
> >
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.1
