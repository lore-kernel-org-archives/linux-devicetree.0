From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH RfC v4 6/6] ARM(64): dts: meson: mark gpio controllers as
 interrupt controllers and update binding documentation
Date: Mon, 29 May 2017 10:50:21 +0200
Message-ID: <e93b9bfc-6a4f-3de1-825f-f3b02857164f@baylibre.com>
References: <49ab677f-3165-d6f5-75f5-a963879e8ecf@gmail.com>
 <ff109063-e412-ed2d-0ccc-d17012d07f45@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <ff109063-e412-ed2d-0ccc-d17012d07f45@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Heiner,

Same here, correct the subject.

On 05/28/2017 09:13 PM, Heiner Kallweit wrote:
> Make the GPIO controllers act as interrupt controllers and
> update the related DT binding documentation.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 4 ++++
>  arch/arm/boot/dts/meson8.dtsi                               | 4 ++++
>  arch/arm/boot/dts/meson8b.dtsi                              | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                 | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                  | 4 ++++
>  5 files changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> index 2392557e..49a8118a 100644
> --- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> @@ -24,6 +24,8 @@ Required properties for sub-nodes are:
>     when it is missing the "pull" registers are used instead
>   - gpio-controller: identifies the node as a gpio controller
>   - #gpio-cells: must be 2
> + - interrupt-controller: identifies the node as interrupt controller
> + - #interrupt-cells: must be 2
>  
>  === Other sub-nodes ===
>  
> @@ -62,6 +64,8 @@ pinctrl-bindings.txt
>  			reg-names = "mux", "pull", "pull-enable", "gpio";
>  			gpio-controller;
>  			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
>                 };
>  
>  		nand {
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index b4c4175d..a645257b 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -106,6 +106,8 @@
>  			reg-names = "mux", "pull", "gpio";
>  			gpio-controller;
>  			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
>  			gpio-ranges = <&pinctrl_aobus 0 120 16>;
>  		};
>  
> @@ -149,6 +151,8 @@
>  			reg-names = "mux", "pull", "pull-enable", "gpio";
>  			gpio-controller;
>  			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
>  			gpio-ranges = <&pinctrl_cbus 0 0 120>;
>  		};
>  
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index 1bce64a6..49233917 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -99,6 +99,8 @@
>  			reg-names = "mux", "pull", "gpio";
>  			gpio-controller;
>  			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
>  			gpio-ranges = <&pinctrl_aobus 0 130 16>;
>  		};
>  
> @@ -174,6 +176,8 @@
>  			reg-names = "mux", "pull", "pull-enable", "gpio";
>  			gpio-controller;
>  			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
>  			gpio-ranges = <&pinctrl_cbus 0 0 130>;
>  		};
>  	};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> index 6f8b3011..a771dae8 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> @@ -111,6 +111,8 @@
>  			reg-names = "mux", "pull", "gpio";
>  			gpio-controller;
>  			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
>  			gpio-ranges = <&pinctrl_aobus 0 0 14>;
>  		};
>  
> @@ -356,6 +358,8 @@
>  			reg-names = "mux", "pull", "pull-enable", "gpio";
>  			gpio-controller;
>  			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
>  			gpio-ranges = <&pinctrl_periphs 0 14 120>;
>  		};
>  
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> index 3efad5f0..16b584f5 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> @@ -80,6 +80,8 @@
>  			reg-names = "mux", "pull", "gpio";
>  			gpio-controller;
>  			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
>  			gpio-ranges = <&pinctrl_aobus 0 0 14>;
>  		};
>  
> @@ -244,6 +246,8 @@
>  			reg-names = "mux", "pull", "pull-enable", "gpio";
>  			gpio-controller;
>  			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
>  			gpio-ranges = <&pinctrl_periphs 0 14 101>;
>  		};
>  
> 


Seems good,

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
