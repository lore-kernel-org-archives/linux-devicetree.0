From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH] dt-bindings: irqchip: renesas-irqc: Document R-Car E3
 support
Date: Fri, 28 Sep 2018 12:59:11 +0100
Message-ID: <accca8b5-1941-2f28-d939-647ec3b30bd9@arm.com>
References: <20180928113238.17192-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180928113238.17192-1-geert+renesas@glider.be>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 28/09/18 12:32, Geert Uytterhoeven wrote:
> Document support for the Interrupt Controller for External Devices
> (INTC-EX) in the Renesas E3 (r8a77990) SoC.
> 
> No driver update is needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   .../devicetree/bindings/interrupt-controller/renesas,irqc.txt | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
> index a046ed374d808d66..b8a86e30e8e67068 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
> @@ -2,7 +2,8 @@ DT bindings for the R-Mobile/R-Car/RZ/G interrupt controller
>   
>   Required properties:
>   
> -- compatible: has to be "renesas,irqc-<soctype>", "renesas,irqc" as fallback.
> +- compatible: must be "renesas,irqc-<soctype>" or "renesas,intc-ex-<soctype>",
> +	      and "renesas,irqc" as fallback.
>     Examples with soctypes are:
>       - "renesas,irqc-r8a73a4" (R-Mobile APE6)
>       - "renesas,irqc-r8a7743" (RZ/G1M)
> @@ -19,6 +20,7 @@ Required properties:
>       - "renesas,intc-ex-r8a77965" (R-Car M3-N)
>       - "renesas,intc-ex-r8a77970" (R-Car V3M)
>       - "renesas,intc-ex-r8a77980" (R-Car V3H)
> +    - "renesas,intc-ex-r8a77990" (R-Car E3)
>       - "renesas,intc-ex-r8a77995" (R-Car D3)
>   - #interrupt-cells: has to be <2>: an interrupt index and flags, as defined in
>     interrupts.txt in this directory
> 

Queued for 4.20.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
