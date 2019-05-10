From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/2] arm64: dts: meson: sei510: consistently order nodes
Date: Fri, 10 May 2019 14:43:50 -0700
Message-ID: <7h4l62dlyh.fsf@baylibre.com>
References: <20190510155327.5759-1-jbrunet@baylibre.com> <20190510155327.5759-2-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190510155327.5759-2-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Like order boards, order nodes by address then node names then aliases.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../boot/dts/amlogic/meson-g12a-sei510.dts    | 92 +++++++++----------
>  1 file changed, 46 insertions(+), 46 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> index 34b40587e5ef..61fb30047d7f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> @@ -14,10 +14,6 @@
>  	compatible = "seirobotics,sei510", "amlogic,g12a";
>  	model = "SEI Robotics SEI510";
>  
> -	aliases {
> -		serial0 = &uart_AO;
> -	};
> -
>  	adc_keys {
>  		compatible = "adc-keys";
>  		io-channels = <&saradc 0>;
> @@ -31,13 +27,8 @@
>  		};
>  	};
>  
> -	ao_5v: regulator-ao_5v {
> -		compatible = "regulator-fixed";
> -		regulator-name = "AO_5V";
> -		regulator-min-microvolt = <5000000>;
> -		regulator-max-microvolt = <5000000>;
> -		vin-supply = <&dc_in>;
> -		regulator-always-on;
> +	aliases {
> +		serial0 = &uart_AO;
>  	};

minor nit: I kind of like "aliases" and "chosen" at the top since they
are kind of special nodes, but honestly, I can't think of a really good
reason other than personal preference, so keeping things sorted as
you've done here is probably better.

Kevin
