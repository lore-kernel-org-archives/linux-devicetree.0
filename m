From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 02/18] ARM: dts: vf610: add GPC as new interrupt parent
Date: Thu, 31 Mar 2016 16:21:37 +0800
Message-ID: <20160331082137.GW28207@tiger>
References: <1457576219-7971-1-git-send-email-stefan@agner.ch>
 <1457576219-7971-3-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1457576219-7971-3-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, kernel@pengutronix.de, sergeimir@emcraft.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 09, 2016 at 06:16:43PM -0800, Stefan Agner wrote:
> Signed-off-by: Stefan Agner <stefan@agner.ch>

So this patch cannot be applied before the fsl,vf610-gpc driver gets
landed on mainline.

Shawn

> ---
>  arch/arm/boot/dts/vfxxx.dtsi | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
> index 5e49fbd..909988d 100644
> --- a/arch/arm/boot/dts/vfxxx.dtsi
> +++ b/arch/arm/boot/dts/vfxxx.dtsi
> @@ -88,7 +88,7 @@
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		compatible = "simple-bus";
> -		interrupt-parent = <&mscm_ir>;
> +		interrupt-parent = <&gpc>;
>  		ranges;
>  
>  		aips0: aips-bus@40000000 {
> @@ -475,6 +475,14 @@
>  				reg = <0x4006e000 0x1000>;
>  				interrupts = <96 IRQ_TYPE_LEVEL_HIGH>;
>  			};
> +
> +			gpc: gpc@4006c000 {
> +				compatible = "fsl,vf610-gpc";
> +				reg = <0x4006c000 0x1000>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupt-parent = <&mscm_ir>;
> +			};
>  		};
>  
>  		aips1: aips-bus@40080000 {
> -- 
> 2.7.2
> 
> 
