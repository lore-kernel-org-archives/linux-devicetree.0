From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v4 1/2] ARM: dts: da850-lcdk: add the dumb-vga-dac node
Date: Tue, 06 Dec 2016 15:42:04 +0200
Message-ID: <4410572.7ltIsoL1pV@avalon>
References: <1481030026-7329-1-git-send-email-bgolaszewski@baylibre.com> <1481030026-7329-2-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481030026-7329-2-git-send-email-bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Bartosz,

Thank you for the patch.

On Tuesday 06 Dec 2016 14:13:45 Bartosz Golaszewski wrote:
> Add the dumb-vga-dac node to the board DT together with corresponding
> ports and vga connector. This allows to retrieve the edid info from
> the display automatically.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/da850-lcdk.dts | 69 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/da850-lcdk.dts
> b/arch/arm/boot/dts/da850-lcdk.dts index afcb482..ca437c1 100644
> --- a/arch/arm/boot/dts/da850-lcdk.dts
> +++ b/arch/arm/boot/dts/da850-lcdk.dts
> @@ -51,6 +51,51 @@
>  			system-clock-frequency = <24576000>;
>  		};
>  	};
> +
> +	vga-bridge {
> +		compatible = "dumb-vga-dac";

Please don't. The board uses a THS8135, which has a few control signals. 
They're not used on this board so you can certainly rely on the dumb-vga-dac 
driver, but you should not use that compatible string. You should instead add 
DT bindings for ti,ths8135 and add that compatible string to the dumb-vga-dac 
driver.

The rest looks good to me.

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <0>;
> +
> +				vga_bridge_in: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&display_out_vga>;
> +				};
> +			};
> +
> +			port@1 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <1>;
> +
> +				vga_bridge_out: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&vga_con_in>;
> +				};
> +			};
> +		};
> +	};
> +
> +	vga {
> +		compatible = "vga-connector";
> +
> +		ddc-i2c-bus = <&i2c0>;
> +
> +		port {
> +			vga_con_in: endpoint {
> +				remote-endpoint = <&vga_bridge_out>;
> +			};
> +		};
> +	};
>  };
> 
>  &pmx_core {
> @@ -236,3 +281,27 @@
>  &memctrl {
>  	status = "okay";
>  };
> +
> +&display {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&lcd_pins>;
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		display_out: port@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +		};
> +	};
> +};
> +
> +&display_out {
> +	display_out_vga: endpoint@0 {
> +		reg = <0>;
> +		remote-endpoint = <&vga_bridge_in>;
> +	};
> +};

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
