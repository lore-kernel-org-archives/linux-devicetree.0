From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: da850: add the mstpri and ddrctl nodes
Date: Tue, 15 Nov 2016 15:35:52 +0530
Message-ID: <de22c568-22b8-7809-5506-cac23fad252d@ti.com>
References: <1479144724-14231-1-git-send-email-bgolaszewski@baylibre.com>
 <1479144724-14231-2-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479144724-14231-2-git-send-email-bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 14 November 2016 11:02 PM, Bartosz Golaszewski wrote:
> Add the nodes for the MSTPRI configuration and DDR2/mDDR memory
> controller drivers to da850.dtsi.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/da850.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index 1bb1f6d..1635218 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -440,6 +440,11 @@
>  			interrupts = <52>;
>  			status = "disabled";
>  		};
> +
> +		mstpri: mstpri@14110 {
> +			compatible = "ti,da850-mstpri";
> +			reg = <0x14110 0x0c>;
> +		};

Instead of adding the node to the end, can you place it above the
cfgchip node to keep it sorted by reg. We have not really followed that
in this file. May be we should have. But lets start with this.

>  	};
>  	aemif: aemif@68000000 {
>  		compatible = "ti,da850-aemif";
> @@ -451,4 +456,8 @@
>  			  1 0 0x68000000 0x00008000>;
>  		status = "disabled";
>  	};
> +	ddrctl: ddrctl@b0000000 {
> +		compatible = "ti,da850-ddr-controller";
> +		reg = <0xb0000000 0xe8>;
> +	};

Can you name the node memory-controller@b0000000? Thats the generic name
suggested by ePAPR 1.1 for memory controllers.

I could not find any naming suggestions for the bus master priority
controller above, but based on the pattern used for other controllers,
may be it should be called priority-controller@14110 instead of mstpri@14110

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
