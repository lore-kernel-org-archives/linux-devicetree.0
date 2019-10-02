From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] misc: add cc1101 devicetree binding
Date: Wed, 02 Oct 2019 09:19:12 -0500
Message-ID: <5d94b1e3.1c69fb81.9d89.1cce@mx.google.com>
References: <20190922060356.58763-1-hs@denx.de>
 <20190922060356.58763-2-hs@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190922060356.58763-2-hs@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Schocher <hs@denx.de>
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 22, 2019 at 08:03:55AM +0200, Heiko Schocher wrote:
> add devicetree binding for cc1101 misc driver.
> 
> Signed-off-by: Heiko Schocher <hs@denx.de>
> ---
> 
>  .../devicetree/bindings/misc/cc1101.txt       | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/cc1101.txt

Can you please convert this to DT schema.

> 
> diff --git a/Documentation/devicetree/bindings/misc/cc1101.txt b/Documentation/devicetree/bindings/misc/cc1101.txt
> new file mode 100644
> index 0000000000000..afea6acf4a9c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/cc1101.txt

Normal naming is to use compatible string. So ti,cc1101.yaml for schema.

> @@ -0,0 +1,27 @@
> +driver cc1101 Low-Power Sub-1 GHz RF Transceiver chip from Texas
> +Instruments.
> +
> +Requires node properties:
> +- compatible : should be "ti,cc1101";
> +- reg        : Chip select address of device, see:
> +               Documentation/devicetree/bindings/spi/spi-bus.txt
> +- gpios      : list of 2 gpios, first gpio is for GDO0 pin
> +               second for GDO2 pin, see more:

Is there a GDO1? Would be hard to add later because you can't change the 
indices once defined.

> +               Documentation/devicetree/bindings/gpio/gpio.txt
> +
> +Recommended properties:
> + - spi-max-frequency: Definition as per
> +                Documentation/devicetree/bindings/spi/spi-bus.txt

Notice that this file is now just in redirection...

> + - freq       : used spi frequency for communication with cc1101 chip

What's this? Doesn't spi-max-frequency cover it?

> +
> +example:
> +
> +&ecspi4 {
> +        cc1101@0 {
> +                compatible = "ti,cc1101";
> +                spi-max-frequency = <10000000>;
> +                reg = <0>;
> +                freq = <5000000>;
> +                gpios = <&gpio2 11 GPIO_ACTIVE_HIGH &gpio5 8 GPIO_ACTIVE_HIGH>;
> +        };
> +};
> -- 
> 2.21.0
> 
