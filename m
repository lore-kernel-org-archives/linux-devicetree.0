From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH anybus v1 2/4] dt-bindings: anybus-bridge: document
 devicetree binding.
Date: Thu, 25 Oct 2018 06:19:18 +0100
Message-ID: <20181025051918.GC4939@dell>
References: <20181024142456.10084-1-svendev@arcx.com>
 <20181024142456.10084-3-svendev@arcx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181024142456.10084-3-svendev@arcx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <svendev@arcx.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, andriy.shevchenko@linux.intel.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, yuanzhichang@hisilicon.com, stuyoder@gmail.com, linus.walleij@linaro.org, maxime.ripard@bootlin.com, bogdan.purcareata@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 24 Oct 2018, Sven Van Asbroeck wrote:

> This patch adds devicetree binding documentation for the
> Arcx anybus bridge.
> 
> Signed-off-by: Sven Van Asbroeck <svendev@arcx.com>
> ---
>  .../bindings/mfd/arcx,anybus-bridge.txt       | 37 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt   |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/arcx,anybus-bridge.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/arcx,anybus-bridge.txt b/Documentation/devicetree/bindings/mfd/arcx,anybus-bridge.txt
> new file mode 100644
> index 000000000000..3c0399c4ed45
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/arcx,anybus-bridge.txt
> @@ -0,0 +1,37 @@
> +* Arcx anybus bridge
> +
> +This chip communicates with the SoC over the WEIM bus. It is
> +expected that its Device Tree node is specified as the child of a node
> +corresponding to the WEIM bus used for communication.
> +
> +Required properties:
> +
> +  - compatible : The following chip-specific string:
> +        "arcx,anybus-bridge"
> +
> +  - reg :
> +	weim memory area where the cpld registers are located,	followed by:
> +	weim memory area of the first  anybus-s slot,		followed by:
> +	weim memory area of the second anybus-s slot.
> +
> +  - enable-gpios : the gpio connected to the bridge's 'enable gpio'.
> +
> +  - pwms : the pwm connected to the bridge's 'pwm input'.
> +
> +  - irq-gpios : the gpios connected to the bridge's interrupt lines.
> +	note that there is no need to provide the 'interrupts' property here.
> +
> +Example of usage:
> +
> +&weim {
> +	bridge@0,0 {

I haven't seen this syntax before.

It doesn't mean it's wrong, but will needs Rob et. al to cast an eye.

> +		compatible = "arcx,anybus-bridge";
> +		reg = <0 0 0x100>, <0 0x400000 0x800>, <1 0x400000 0x800>;
> +		fsl,weim-cs-timing = <0x024400b1 0x00001010 0x20081100
> +				0x00000000 0xa0000240 0x00000000>;

This needs to be documented.

> +		enable-gpios = <&gpio5 2 GPIO_ACTIVE_HIGH>;
> +		pwms = <&pwm3 0 571>;
> +		irq-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>,
> +					<&gpio1 5 GPIO_ACTIVE_HIGH>;

Tabbing.

> +	};
> +};
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 2c3fc512e746..1bf07b20a8af 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -35,6 +35,7 @@ aptina	Aptina Imaging
>  arasan	Arasan Chip Systems
>  archermind ArcherMind Technology (Nanjing) Co., Ltd.
>  arctic	Arctic Sand
> +arcx	Arcx/Archronix Inc.
>  aries	Aries Embedded GmbH
>  arm	ARM Ltd.
>  armadeus	ARMadeus Systems SARL

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
