From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 1/4] ARM: dts: rockchip: Fix gic/efuse sort ordering for
 rk3288
Date: Thu, 21 Mar 2019 14:06:13 -0700
Message-ID: <20190321210613.GQ112750@google.com>
References: <20190320201402.114309-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190320201402.114309-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, ryandcase@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 20, 2019 at 01:13:59PM -0700, Douglas Anderson wrote:
> It can be seen that 0xffb40000 < 0xffc01000, thus efuse comes first.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  arch/arm/boot/dts/rk3288.dtsi | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 09868dcee34b..e9f454248398 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -1378,19 +1378,6 @@
>  		reg = <0x0 0xffaf0080 0x0 0x20>;
>  	};
>  
> -	gic: interrupt-controller@ffc01000 {
> -		compatible = "arm,gic-400";
> -		interrupt-controller;
> -		#interrupt-cells = <3>;
> -		#address-cells = <0>;
> -
> -		reg = <0x0 0xffc01000 0x0 0x1000>,
> -		      <0x0 0xffc02000 0x0 0x2000>,
> -		      <0x0 0xffc04000 0x0 0x2000>,
> -		      <0x0 0xffc06000 0x0 0x2000>;
> -		interrupts = <GIC_PPI 9 0xf04>;
> -	};
> -
>  	efuse: efuse@ffb40000 {
>  		compatible = "rockchip,rk3288-efuse";
>  		reg = <0x0 0xffb40000 0x0 0x20>;
> @@ -1404,6 +1391,19 @@
>  		};
>  	};
>  
> +	gic: interrupt-controller@ffc01000 {
> +		compatible = "arm,gic-400";
> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		#address-cells = <0>;
> +
> +		reg = <0x0 0xffc01000 0x0 0x1000>,
> +		      <0x0 0xffc02000 0x0 0x2000>,
> +		      <0x0 0xffc04000 0x0 0x2000>,
> +		      <0x0 0xffc06000 0x0 0x2000>;
> +		interrupts = <GIC_PPI 9 0xf04>;
> +	};
> +
>  	pinctrl: pinctrl {
>  		compatible = "rockchip,rk3288-pinctrl";
>  		rockchip,grf = <&grf>;

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
