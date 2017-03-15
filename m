From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] regulator: tps65132: add device-tree binding
Date: Wed, 15 Mar 2017 12:05:23 -0500
Message-ID: <20170315170523.rkwbscfh37huopxj@rob-hp-laptop>
References: <1488818260-25882-1-git-send-email-vreddytalla@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1488818260-25882-1-git-send-email-vreddytalla@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Venkat Reddy Talla <vreddytalla@nvidia.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, ldewangan@nvidia.com
List-Id: devicetree@vger.kernel.org

On Mon, Mar 06, 2017 at 10:07:40PM +0530, Venkat Reddy Talla wrote:
> Adding tps65132 regulator devicetree binding documentation
> 
> Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
> ---
>  .../bindings/regulator/tps65132-regulator.txt      | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/tps65132-regulator.txt
> 
> diff --git a/Documentation/devicetree/bindings/regulator/tps65132-regulator.txt b/Documentation/devicetree/bindings/regulator/tps65132-regulator.txt
> new file mode 100644
> index 0000000..1ef6ede
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/tps65132-regulator.txt
> @@ -0,0 +1,46 @@
> +TPS65132 regulators
> +
> +Required properties:
> +- compatible: "ti,tps65132"
> +- reg: I2C slave address
> +
> +Optional Subnode:
> +Device supports two regulators OUTP and OUTN. A sub node within the
> +   device node descrbe the properties of these regulators. The sub-node
> +   names must be as follows:
> +	-For regulator outp, the sub node name should be "outp".
> +	-For regulator outn, the sub node name should be "outn".
> +
> +-ti,enable-gpio: Regulators are controlled by the input pins. If
> +   it is connected to GPIO through host system then provide the
> +   gpio number as per gpio.txt.

-gpios instead. Also, need to state the active state.

> +-ti,disable-active-discharge: Boolean, presence of this property
> +   will disable active discharge on the regulator output.
> +-ti,active-discharge-gpio: Some configurations use delay mechanisms

-gpios and active state

> +  on the enable pin, to keep the regulator enabled for some time after
> +  the enable signal goes low. This GPIO is used to actively discharge
> +  the delay mechanism. Requires specification of ti,active-discharge-time
> +-ti,active-discharges-time: how long the active discharge gpio should be
> +  asserted for during active discharge, in microseconds.

unit suffix.

> +
> +Each regulator is defined using the standard binding for regulators.
> +
> +Example:
> +
> +	tps65132@3e {
> +		compatible = "ti,tps65132";

reg?

> +
> +		outp {
> +			regulator-name = "outp";
> +			regulator-boot-on;
> +			regulator-always-on;
> +			ti,enable-gpio = <&gpio 23 0>;
> +		};
> +
> +		outn {
> +			regulator-name = "outn";
> +			regulator-boot-on;
> +			regulator-always-on;
> +			ti,enable-gpio = <&gpio 40 0>;
> +		};
> +	};
> -- 
> 2.1.4
> 
