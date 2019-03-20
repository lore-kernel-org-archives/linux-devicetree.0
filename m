From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: imx6q-logicpd: Shutdown LCD regulator
 during suspend
Date: Wed, 20 Mar 2019 20:42:22 +0800
Message-ID: <20190320124221.GN4980@dragon>
References: <20190306140402.17122-1-aford173@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190306140402.17122-1-aford173@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Adam Ford <aford173@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 06, 2019 at 08:03:59AM -0600, Adam Ford wrote:
> The LCD power sequencer is very finicky.  The backlight cannot
> be driven until after the sequencer is done.  Until now, the
> regulators were marked with 'regulator-always-on' to make sure
> it came up before the backlight.  This patch allows the LCD
> regulators to power down and prevent the backlight from being
> used again until the sequencer is ready.  This reduces
> standby power consumption by ~100mW.
> 
> Fixes: 1c207f911fe9 ("ARM: dts: imx: Add support for Logic
> PD i.MX6QD EVM")

Fixes tag is more for regressions or serious bugs.  It looks the patch
is more like an improvement though.

Shawn

> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> diff --git a/arch/arm/boot/dts/imx6q-logicpd.dts b/arch/arm/boot/dts/imx6q-logicpd.dts
> index 45eb0b7f75f8..d96ae54be338 100644
> --- a/arch/arm/boot/dts/imx6q-logicpd.dts
> +++ b/arch/arm/boot/dts/imx6q-logicpd.dts
> @@ -21,6 +21,8 @@
>  
>  	panel-lvds0 {
>  		compatible = "okaya,rs800480t-7x0gp";
> +		power-supply = <&reg_lcd_reset>;
> +		backlight = <&backlight>;
>  
>  		port {
>  			panel_in_lvds0: endpoint {
> @@ -38,7 +40,6 @@
>  		regulator-max-microvolt = <3300000>;
>  		gpio = <&gpio4 17 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
> -		regulator-always-on;
>  		vin-supply = <&reg_3v3>;
>  		startup-delay-us = <500000>;
>  	};
> @@ -52,7 +53,6 @@
>  		regulator-max-microvolt = <3300000>;
>  		gpio = <&gpio5 2 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
> -		regulator-always-on;
>  		vin-supply = <&reg_lcd>;
>  	};
>  };
> -- 
> 2.17.1
> 
