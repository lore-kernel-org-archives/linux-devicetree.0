From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: renesas: document V3MSK board bindings
Date: Wed, 29 Nov 2017 11:48:42 +0100
Message-ID: <20171129104842.qdr6rwyw6ocdf7pl@verge.net.au>
References: <20171124204748.920422106@cogentembedded.com>
 <20171126222905.62qkvnvep2rkqcb6@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171126222905.62qkvnvep2rkqcb6@rob-hp-laptop>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Nov 26, 2017 at 04:29:05PM -0600, Rob Herring wrote:
> On Fri, Nov 24, 2017 at 11:47:39PM +0300, Sergei Shtylyov wrote:
> > Document the V3M Starter Kit device tree bindings, listing it as
> > a supported board.
> > 
> > This allows to use checkpatch.pl to validate .dts files referring to
> > the V3MSK board.
> > 
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > 
> > ---
> >  Documentation/devicetree/bindings/arm/shmobile.txt |    2 ++
> >  1 file changed, 2 insertions(+)
> 
> Acked-by: Rob Herring <robh@kernel.org>

Thanks, applied.
