Return-Path: <SRS0=HV5j=MK=arm.com=marc.zyngier@kernel.org>
Subject: Re: [PATCH] dt-bindings: irqchip: renesas-irqc: Document r8a7744
 support
References: <1537894594-54158-1-git-send-email-biju.das@bp.renesas.com>
From: Marc Zyngier <marc.zyngier@arm.com>
Message-ID: <4ff81e4e-4782-0dfa-5c7e-318f7de0a4ff@arm.com>
Date: Fri, 28 Sep 2018 12:58:56 +0100
MIME-Version: 1.0
In-Reply-To: <1537894594-54158-1-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
To: Biju Das <biju.das@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 25/09/18 17:56, Biju Das wrote:
> Document RZ/G1N (R8A7744) SoC bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> ---
>   Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
> index a046ed3..97a8c83 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
> @@ -6,6 +6,7 @@ Required properties:
>     Examples with soctypes are:
>       - "renesas,irqc-r8a73a4" (R-Mobile APE6)
>       - "renesas,irqc-r8a7743" (RZ/G1M)
> +    - "renesas,irqc-r8a7744" (RZ/G1N)
>       - "renesas,irqc-r8a7745" (RZ/G1E)
>       - "renesas,irqc-r8a77470" (RZ/G1C)
>       - "renesas,irqc-r8a7790" (R-Car H2)
> 

Queued for 4.20.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
