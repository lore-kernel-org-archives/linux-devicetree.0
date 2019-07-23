From: "Andrew Jeffery" <andrew@aj.id.au>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: tiogapass: Add VR devices
Date: Tue, 23 Jul 2019 09:41:20 +0930
Message-ID: <802c5419-08ec-4a0e-8a50-ad4a1bbf7f3a@www.fastmail.com>
References: <20190722192451.1947348-1-vijaykhemka@fb.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722192451.1947348-1-vijaykhemka@fb.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vijay Khemka <vijaykhemka@fb.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>, Sai Dasari <sdasari@fb.com>
List-Id: devicetree@vger.kernel.org

Hi Vijay,

A few nitpicks.

On Tue, 23 Jul 2019, at 05:10, Vijay Khemka wrote:
> Addes

Typo: Adds

> Voltage

Unnecessary capitalisation.

> regulators Infineon pxe1610 devices to Facebook
> tiogapass platform.
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>  .../dts/aspeed-bmc-facebook-tiogapass.dts     | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts 
> b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> index c4521eda787c..b7783833a58c 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> @@ -144,6 +144,42 @@
>  &i2c5 {
>  	status = "okay";
>  	// CPU Voltage regulators
> +	vr@48 {

The recommended generic name is 'regulator', so e.g. regulator@48

> +		compatible = "infineon,pxe1610";
> +		reg = <0x48>;
> +	};
> +	vr@4a {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x4a>;
> +	};
> +	vr@50 {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x50>;
> +	};
> +	vr@52 {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x52>;
> +	};
> +	vr@58 {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x58>;
> +	};
> +	vr@5a {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x5a>;
> +	};
> +	vr@68 {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x68>;
> +	};
> +	vr@70 {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x70>;
> +	};
> +	vr@72 {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x72>;
> +	};
>  };
>  
>  &i2c6 {
> -- 
> 2.17.1
> 
>
