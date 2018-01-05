From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 3/3] ARM: dts: r7s72100: add USB device to device tree
Date: Fri, 5 Jan 2018 12:03:29 +0300
Message-ID: <c6eac313-2d2d-70c8-16bb-ddb860fb7aa1@cogentembedded.com>
References: <20180104200150.11352-1-chris.brandt@renesas.com>
 <20180104200150.11352-4-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180104200150.11352-4-chris.brandt@renesas.com>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <chris.brandt@renesas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>
Cc: linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello!

On 1/4/2018 11:01 PM, Chris Brandt wrote:

> Add USB device support.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>   arch/arm/boot/dts/r7s72100.dtsi | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index ab9645a42eca..eb414e735185 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -667,4 +667,24 @@
>   		power-domains = <&cpg_clocks>;
>   		status = "disabled";
>   	};
> +
> +	usbhs0: usbhs@e8010000 {

    The node names should be generic, i.e "usb@e8010000".

> +		compatible = "renesas,usbhs-r7s72100";
> +		reg = <0xe8010000 0x1A0>;

    Lowercase in the hex values, please be consistent...

> +		interrupts = <GIC_SPI (73-32) IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&mstp7_clks R7S72100_CLK_USB0>;
> +		renesas,buswait = <4>;
> +		power-domains = <&cpg_clocks>;
> +		status = "disabled";
> +	};
> +
> +	usbhs1: usbhs@e8207000 {
> +		compatible = "renesas,usbhs-r7s72100";
> +		reg = <0xe8207000 0x1A0>;
> +		interrupts = <GIC_SPI (74-32) IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&mstp7_clks R7S72100_CLK_USB1>;
> +		renesas,buswait = <4>;
> +		power-domains = <&cpg_clocks>;
> +		status = "disabled";
> +	};
>   };

    The same comments for the 2nd device.

MBR, Sergei
