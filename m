From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: marvell: add generic-ahci compatibles for
 CP110 ahci
Date: Mon, 16 Jan 2017 12:06:21 +0000
Message-ID: <20170116120621.GE5908@leverpostej>
References: <E1cS72h-0004nc-Rr@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1cS72h-0004nc-Rr-eh5Bv4kxaXIk46pC+1QYvQNdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 13, 2017 at 06:57:39PM +0000, Russell King wrote:
> Testing with an Armada 8040 board shows that adding the generic-ahci
> compatible to the CP110 AHCI nodes gets us working AHCI on the board.
> A previous patch series posted by Thomas Petazzoni was retracted when
> it was realised that the IP was supposed to be, and is, compatible
> with the standard register layout.
> 
> Add this compatible.
> 
> Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>

Assuming the above is correct this looks sane to me. FWIW:

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Mark.

> ---
>  arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi | 3 ++-
>  arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi  | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
> index 464b491c7291..65ad781d7910 100644
> --- a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
> @@ -128,7 +128,8 @@
>  			};
>  
>  			cpm_sata0: sata@540000 {
> -				compatible = "marvell,armada-8k-ahci";
> +				compatible = "marvell,armada-8k-ahci",
> +					     "generic-ahci";
>  				reg = <0x540000 0x30000>;
>  				interrupts = <ICU_GRP_NSR 107 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&cpm_syscon0 1 15>;
> diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
> index b10f4781d8fb..168d667d50a3 100644
> --- a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
> @@ -128,7 +128,8 @@
>  			};
>  
>  			cps_sata0: sata@540000 {
> -				compatible = "marvell,armada-8k-ahci";
> +				compatible = "marvell,armada-8k-ahci",
> +					     "generic-ahci";
>  				reg = <0x540000 0x30000>;
>  				interrupts = <ICU_GRP_NSR 107 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&cps_syscon0 1 15>;
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
