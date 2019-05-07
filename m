From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h6: Enable HDMI output on
 orangepi 3
Date: Tue, 7 May 2019 11:42:27 +0200
Message-ID: <20190507094227.3kokzszqz74mq5k2@core.my.home>
References: <20190420145240.27400-1-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190420145240.27400-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>
Cc: maxime.ripard@bootlin.com, wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Yangtao,

On Sat, Apr 20, 2019 at 10:52:40AM -0400, Yangtao Li wrote:
> Orangepi 3 has HDMI type A connector.

It also has DDC-IO-EN, whithout which HDMI will not work as expected
by most users.

I'm working on a proper solution (discussion here):

  https://lkml.org/lkml/2019/4/26/910

regards,
	o.

> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
> rebase:
> sunxi/dt64-for-5.2 arm64: dts: allwinner: a64-amarula-relic: Add OV5640
> camera node
> ---
>  .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> index 17d496990108..6ed3a1ee297d 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> @@ -21,6 +21,17 @@
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint = <&hdmi_out_con>;
> +			};
> +		};
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
>  
> @@ -50,6 +61,10 @@
>  	cpu-supply = <&reg_dcdca>;
>  };
>  
> +&de {
> +	status = "okay";
> +};
> +
>  &ehci0 {
>  	status = "okay";
>  };
> @@ -58,6 +73,16 @@
>  	status = "okay";
>  };
>  
> +&hdmi {
> +	status = "okay";
> +};
> +
> +&hdmi_out {
> +	hdmi_out_con: endpoint {
> +		remote-endpoint = <&hdmi_con_in>;
> +	};
> +};
> +
>  &mmc0 {
>  	vmmc-supply = <&reg_cldo1>;
>  	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
> -- 
> 2.17.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
