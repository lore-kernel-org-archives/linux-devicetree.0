Return-Path: <SRS0=dR13=KC=verge.net.au=horms@kernel.org>
Date: Wed, 18 Jul 2018 11:27:18 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] DT: irqchip: renesas-irqc: document R8A77980 support
Message-ID: <20180718092717.nl6d6ueuv2fv4t4g@verge.net.au>
References: <71e2be51-5699-1b26-c2a1-fca7897817d1@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71e2be51-5699-1b26-c2a1-fca7897817d1@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 17, 2018 at 10:23:17PM +0300, Sergei Shtylyov wrote:
> Document R-Car V3H (AKA R8A77980) SoC bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
> ---
>  Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt |    1 +
>  1 file changed, 1 insertion(+)
> 
> Index: renesas/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
> ===================================================================
> --- renesas.orig/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
> +++ renesas/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
> @@ -16,6 +16,7 @@ Required properties:
>      - "renesas,intc-ex-r8a7796" (R-Car M3-W)
>      - "renesas,intc-ex-r8a77965" (R-Car M3-N)
>      - "renesas,intc-ex-r8a77970" (R-Car V3M)
> +    - "renesas,intc-ex-r8a77980" (R-Car V3H)
>      - "renesas,intc-ex-r8a77995" (R-Car D3)
>  - #interrupt-cells: has to be <2>: an interrupt index and flags, as defined in
>    interrupts.txt in this directory
> 
