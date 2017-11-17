From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: eagle: specify EtherAVB PHY IRQ
Date: Fri, 17 Nov 2017 06:20:18 -0800
Message-ID: <20171117142017.g6vg7m5k2tcd7ovy@verge.net.au>
References: <20171113213152.819421744@cogentembedded.com>
 <CAMuHMdUqX6OhsKBET5RkL0zcZO-aiTT4wHHuwuRTeVHAYkSnZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUqX6OhsKBET5RkL0zcZO-aiTT4wHHuwuRTeVHAYkSnZg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 15, 2017 at 05:15:58PM +0100, Geert Uytterhoeven wrote:
> On Mon, Nov 13, 2017 at 10:23 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > Specify  EtherAVB PHY IRQ  in the Eagle board's device tree, now that we
> > have the GPIO support (previously phylib had to resort to polling).
> >
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
