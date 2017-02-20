From: Rask Ingemann Lambertsen <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
Subject: Re: [linux-sunxi][PATCH] ARM: dts: sun8i-h3: orange-pi-2: Enable
 audio codec
Date: Mon, 20 Feb 2017 22:57:12 +0100
Message-ID: <20170220215711.7i253mkl2ahcd766@localhost>
References: <20170220162052.21932-1-codekipper@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170220162052.21932-1-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 20, 2017 at 05:20:52PM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> The Orange Pi 2 routes the LINEOUT pins through a SGM8900 PA which
> needs to be enabled. The onboard microphone is routed to MIC1, with
> MBIAS providing power.
> 
> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3-orangepi-2.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
> index 047e9e1c6093..b0d2b99990cc 100644
> --- a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
> @@ -105,6 +105,16 @@
>  	};
>  };
>  
> +&codec {
> +	pinctrl-0 = <&codec_pa_pin>;
> +	allwinner,pa-gpios = <&pio 0 16 GPIO_ACTIVE_HIGH>; /* PA16 */
> +	allwinner,audio-routing =
> +		"Speaker", "LINEOUT",
> +		"MIC1", "Mic",
> +		"Mic",  "MBIAS";
> +	status = "okay";
> +};
> +
>  &ehci1 {
>  	status = "okay";
>  };
> @@ -144,6 +154,11 @@
>  };
>  
>  &pio {
> +	codec_pa_pin: codec_pa_pin@0 {
> +		pins = "PA16";
> +		function = "gpio_out";
> +	};
> +

There should not be underscores in node names. See e.g.:
https://www.mail-archive.com/linux-kernel%40vger.kernel.org/msg1122967.html
https://www.mail-archive.com/linux-kernel%40vger.kernel.org/msg1145633.html
https://www.mail-archive.com/netdev%40vger.kernel.org/msg90319.html

Pinmux nodes for GPIO usage are considered unnecessary or even harmful
these days, so you should just drop the node in this case (as well as the
reference to it). As a bonus, you avoid a duplicate definition.

-- 
Rask Ingemann Lambertsen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
