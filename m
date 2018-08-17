From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH] dt-bindings: irqchip: renesas-irqc: Document r8a774a1
 support
Date: Fri, 17 Aug 2018 15:09:41 +0100
Message-ID: <4177b31e-dbef-a2f1-fc63-927fe8f70713@arm.com>
References: <1534250008-15680-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1534250008-15680-1-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 14/08/18 13:33, Fabrizio Castro wrote:
> Document RZ/G2M (R8A774A1) SoC bindings.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
> index 697ca2f2..a046ed3 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
> @@ -13,6 +13,7 @@ Required properties:
>      - "renesas,irqc-r8a7792" (R-Car V2H)
>      - "renesas,irqc-r8a7793" (R-Car M2-N)
>      - "renesas,irqc-r8a7794" (R-Car E2)
> +    - "renesas,intc-ex-r8a774a1" (RZ/G2M)
>      - "renesas,intc-ex-r8a7795" (R-Car H3)
>      - "renesas,intc-ex-r8a7796" (R-Car M3-W)
>      - "renesas,intc-ex-r8a77965" (R-Car M3-N)
> 

Queued, thanks.

	M.
-- 
Jazz is not dead. It just smells funny...
