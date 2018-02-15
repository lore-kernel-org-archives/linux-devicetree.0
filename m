From: Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: eagle: add HDMI output using the
 ADV7511W
Date: Thu, 15 Feb 2018 09:09:11 +0000
Message-ID: <feff4afa-843f-3906-4726-b5ba4dcfd65f@ideasonboard.com>
References: <20180131161811.12699-1-niklas.soderlund@ragnatech.se>
 <20180131161811.12699-6-niklas.soderlund@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180131161811.12699-6-niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Niklas,

On 31/01/18 16:18, Niklas Söderlund wrote:
> From: Niklas Söderlund <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
> 
> Add the HDMI connector and the ADV7511W, also connect it to LVDS. Enable
> the DU and LVDS to be able to use the HDMI output.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
> ---
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 66 ++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> index 359e835cca9876fe..c0fd144970c55fa2 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -31,6 +31,17 @@
>  		/* first 128MB is reserved for secure area. */
>  		reg = <0x0 0x48000000 0x0 0x38000000>;
>  	};
> +
> +	hdmi-out {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con_out: endpoint {
> +				remote-endpoint = <&adv7511_out>;
> +			};
> +		};
> +	};
>  };
>  
>  &avb {
> @@ -67,9 +78,46 @@
>  		gpio-controller;
>  		#gpio-cells = <2>;
>  	};
> +
> +	hdmi@39 {
> +		compatible = "adi,adv7511w";
> +		reg = <0x39>;

It looks like the Eagle-V3M expansion board also has an ADV7511 chip on it.

That brings it into the same category as the Wheat board, and because of a fault
on the ADV7511 reset - *both* chips will have to specify alternate custom I2C
registers. (Alternatively, the expansion board could override the reg and
reg-names of this device node to handle this as an overlay style fix up).

Not an issue with this patch - or a blocker - but something to be aware of.

--
Kieran


> +		interrupt-parent = <&gpio1>;
> +		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
> +
> +		adi,input-depth = <8>;
> +		adi,input-colorspace = "rgb";
> +		adi,input-clock = "1x";
> +		adi,input-style = <1>;
> +		adi,input-justification = "evenly";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				adv7511_in: endpoint {
> +					remote-endpoint = <&lvds0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				adv7511_out: endpoint {
> +					remote-endpoint = <&hdmi_con_out>;
> +				};
> +			};
> +		};
> +	};
>  };
>  
>  &pfc {
> +	du_pins: du {
> +		groups = "du_rgb666", "du_sync", "du_oddf", "du_clk_out";
> +		function = "du";
> +	};
> +
>  	i2c0_pins: i2c0 {
>  		groups = "i2c0";
>  		function = "i2c0";
> @@ -92,3 +140,21 @@
>  
>  	status = "okay";
>  };
> +
> +&du {
> +	pinctrl-0 = <&du_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&lvds0 {
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&adv7511_in>;
> +			};
> +		};
> +	};
> +};
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
