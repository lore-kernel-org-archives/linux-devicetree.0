Return-Path: <robherring2@gmail.com>
Date: Fri, 20 Jul 2018 08:11:43 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: Update omap l4 binding for optional
 registers
Message-ID: <20180720141143.GA24223@rob-hp-laptop>
References: <20180709063612.12025-1-tony@atomide.com>
 <20180709063612.12025-2-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180709063612.12025-2-tony@atomide.com>
To: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tero Kristo <t-kristo@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-ID: <devicetree@vger.kernel.org>

On Sun, Jul 08, 2018 at 11:36:08PM -0700, Tony Lindgren wrote:
> The interconnects on omap variants have configuration registers.
> There are registers for a link agent, one or more interconnect
> agent, and an optional access protection.
> 
> Let's also update the example for omap4 l4 per instance as it
> has multiple interconnect agent registers.
> 
> For more information, see chapter "Interconnect" in TI techical
> reference manuals.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  Documentation/devicetree/bindings/arm/omap/l4.txt | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
