From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 6/8] arm64: dts: renesas: r8a77995-draak: Enable DU
Date: Thu, 15 Feb 2018 16:12:38 +0200
Message-ID: <6281511.bskcdgqsgb@avalon>
References: <1518683903-10681-1-git-send-email-kbingham@kernel.org> <1518683903-10681-7-git-send-email-kbingham@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518683903-10681-7-git-send-email-kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kieran Bingham <kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, geert-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Thursday, 15 February 2018 10:38:21 EET Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> 
> Enable the DU, providing only the VGA output for now.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

I assume Simon will take care of this patch.

> ---
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 51 +++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts index
> af07da240be0..668e246dfc5d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -27,6 +27,38 @@
>  		stdout-path = "serial0:115200n8";
>  	};
> 
> +	vga {
> +		compatible = "vga-connector";
> +
> +		port {
> +			vga_in: endpoint {
> +				remote-endpoint = <&adv7123_out>;
> +			};
> +		};
> +	};
> +
> +	vga-encoder {
> +		compatible = "adi,adv7123";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				adv7123_in: endpoint {
> +					remote-endpoint = <&du_out_rgb>;
> +				};
> +			};
> +			port@1 {
> +				reg = <1>;
> +				adv7123_out: endpoint {
> +					remote-endpoint = <&vga_in>;
> +				};
> +			};
> +		};
> +	};
> +
>  	memory@48000000 {
>  		device_type = "memory";
>  		/* first 128MB is reserved for secure area. */
> @@ -46,6 +78,11 @@
>  		};
>  	};
> 
> +	du_pins: du {
> +		groups = "du_rgb888", "du_sync", "du_disp", "du_dotclkout0";
> +		function = "du";
> +	};
> +
>  	i2c0_pins: i2c0 {
>  		groups = "i2c0";
>  		function = "i2c0";
> @@ -95,6 +132,20 @@
>  	status = "okay";
>  };
> 
> +&du {
> +	pinctrl-0 = <&du_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			endpoint {
> +				remote-endpoint = <&adv7123_in>;
> +			};
> +		};
> +	};
> +};
> +
>  &ehci0 {
>  	status = "okay";
>  };


-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
