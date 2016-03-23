From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: input: add Raydium I2C touch driver bindings
Date: Wed, 23 Mar 2016 10:06:35 -0500
Message-ID: <20160323150635.GA14699@rob-hp-laptop>
References: <1458628733-2277-1-git-send-email-jeffrey.lin@rad-ic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1458628733-2277-1-git-send-email-jeffrey.lin@rad-ic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "jeffrey.lin" <yajohn@gmail.com>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, dmitry.torokhov@gmail.com, djkurtz@chromium.org, drinkcat@chromium.org, treding@nvidia.com, ajaykumar.rs@samsung.com, dusonlin@emc.com.tw, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jeffrey.lin@rad-ic.com, roger.yang@rad-ic.com, KP.li@rad-ic.com, albert.shieh@rad-ic.com
List-Id: devicetree@vger.kernel.org

On Tue, Mar 22, 2016 at 02:38:53PM +0800, jeffrey.lin wrote:
> Document the device tree binfings of Raydium I2C touch driver.

Is there a driver too?

> Signed-off-by: jeffrey.lin <jeffrey.lin@rad-ic.com>
> ---
>  .../devicetree/bindings/input/raydium_i2c_ts.txt    | 21 +++++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt         |  1 +
>  2 files changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/raydium_i2c_ts.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/raydium_i2c_ts.txt b/Documentation/devicetree/bindings/input/raydium_i2c_ts.txt
> new file mode 100644
> index 0000000..d7631d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/raydium_i2c_ts.txt
> @@ -0,0 +1,21 @@
> +Raydium I2C touchscreen
> +
> +Required properties:
> +- compatible:
> +    "raydium,rm3xxxx"

No wildcards in compatible strings please.

> +- reg: The I2C address of the device
> +- interrupts: interrupt to which the chip is connected
> +    See ../interrupt-controller/interrupts.txt
> +Optional property:

properties

> + - avdd-supply		: Analog power supply needed to power device
> + - vccio-supply		: IO Power source
> +
> +Example:
> +
> +	raydium_i2c@39 {

touchscreen@39

> +		compatible = "raydium,rm3xxxx";\

Drop the \

> +		reg = <0x39>;
> +		interrupt-parent = <&gpio>;
> +		interrupts = <0x0 IRQ_TYPE_EDGE_FALLING>;
> +	};
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index af49e0f..5b6224b 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -126,6 +126,7 @@ radxa	Radxa
>  raidsonic	RaidSonic Technology GmbH
>  ralink	Mediatek/Ralink Technology Corp.
>  ramtron	Ramtron International
> +raydium Raydium Semiconductor Corp.
>  realtek Realtek Semiconductor Corp.
>  renesas	Renesas Electronics Corporation
>  ricoh	Ricoh Co. Ltd.
> -- 
> 2.1.2
> 
