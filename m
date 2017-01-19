From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm,gic: Fix binding example for a
 virt-capable GIC
Date: Thu, 19 Jan 2017 14:40:16 +0000
Message-ID: <20170119144016.GF11176@leverpostej>
References: <1484736811-24002-1-git-send-email-marc.zyngier@arm.com>
 <1484736811-24002-2-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1484736811-24002-2-git-send-email-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Russell King <linux@armlinux.org.uk>, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Simon
List-Id: devicetree@vger.kernel.org

On Wed, Jan 18, 2017 at 10:53:30AM +0000, Marc Zyngier wrote:
> The joys of copy/paste: the example of a virtualization capable GIC
> in the DT binding was wrong, and propagated to dozens of platforms.

Could you please mention what's wrong (i.e. GICC is impossibly small in
the example).

> 
> Oh well. Let's fix the source of the crap before tackling individual
> offenders.
> 
> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
> index 5393e2a..a3d51ed 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
> @@ -107,11 +107,11 @@ Required properties:
>  Example:
>  
>  	interrupt-controller@2c001000 {
> -		compatible = "arm,cortex-a15-gic";
> +		compatible = "arm,gic-400";

I'm happy with this change in the spirit of making this more generally
applicable, even if it's not a bug as such. Please mention this as a
related cleanup in the commit message.

With those fixed up:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Thanks,
Mark.

>  		#interrupt-cells = <3>;
>  		interrupt-controller;
>  		reg = <0x2c001000 0x1000>,
> -		      <0x2c002000 0x1000>,
> +		      <0x2c002000 0x2000>,
>  		      <0x2c004000 0x2000>,
>  		      <0x2c006000 0x2000>;
>  		interrupts = <1 9 0xf04>;
> -- 
> 2.1.4
> 
