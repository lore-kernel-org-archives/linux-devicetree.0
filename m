From: Nikita Yushchenko <nikita.yoush@yandex.ru>
Subject: Re: [1/3] ARM: dts: imx51-zii-common: create common include dtsi
Date: Wed, 27 Jun 2018 10:11:40 +0300
Message-ID: <5a3490a5-ee5c-a4da-8b54-b5234b7e50d0@yandex.ru>
References: <1529603100-31958-2-git-send-email-andrey.gusakov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1529603100-31958-2-git-send-email-andrey.gusakov@cogentembedded.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, cphealy@gmail.com, andrew.smirnov@gmail.com, l.stach@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> +	i2c_gpio: i2c-gpio {
> +		compatible = "i2c-gpio";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_swi2c>;
> +		i2c-gpio,delay-us = <50>;
> +		status = "okay";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +	};

You add i2c-gpio node to dtsi file without defining gpios, with reference
to pinctrl not defined inside your dtsi file or it's includes, and without
any usage inside dtsi file.

Saving several text lines that way is a bad idea. Please move it to where
it is fully defined and used.

> +&usb_vbus {
> +	regulator-always-on;

usb_vbus is regilator-fixed, what for is this?

> +&uart2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart2>;
> +	status = "okay";
> +};

In your further patches you include this and then revert by marking &uart2 as
disabled. Better to enable it in dts for boards that have it.

Same with ecspi2, ipu and maybe more.

> -	flash@1 {
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		compatible = "atmel,at45db642d", "atmel,at45", "atmel,dataflash";
> -		spi-max-frequency = <25000000>;
> -		reg = <1>;
> -	};

> +	flash@1 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "atmel,at45", "atmel,dataflash";
> +		spi-max-frequency = <25000000>;
> +		reg = <1>;
> +	};

Lost a compatible key?

> -			sysled0@3 {
> -				reg = <3>;
> -				label = "system:green:status";
> -				linux,default-trigger = "default-on";
> -			};

> +			sysled3: led3@3 {
> +				reg = <3>;
> +				label = "system:red:power";
> +				linux,default-trigger = "default-on";
> +			};

> +&sysled3 {
> +	label = "system:green:status";
 
What for this label games?
Maybe just define things for boards that use it?
