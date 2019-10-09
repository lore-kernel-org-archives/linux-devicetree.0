From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v10 5/6] dt-bindings: backlight: Add led-backlight binding
Date: Wed, 9 Oct 2019 14:35:23 -0500
Message-ID: <20191009193523.GA7094@bogus>
References: <20191009085127.22843-1-jjhiblot@ti.com>
 <20191009085127.22843-6-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191009085127.22843-6-jjhiblot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, sre@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, daniel.thompson@linaro.org, dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 09, 2019 at 10:51:26AM +0200, Jean-Jacques Hiblot wrote:
> Add DT binding for led-backlight.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> 
> ---
> 
> .../leds/backlight/led-backlight.yaml         | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
> new file mode 100644
> index 000000000000..47ae3d6b4f31
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/led-backlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED-based Backlight Device Tree Bindings
> +
> +maintainers:
> +  - Jean-Jacques Hiblot <jjhiblot@ti.com>
> +
> +description: |
> +  This binding is used to describe a basic backlight device made of LEDs.
> +  It can also be used to describe a backlight device controlled by the
> +  output of a LED driver.
> +
> +properties:
> +  compatible:
> +    const: led-backlight
> +
> +  leds:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: List of LEDs constitutive of the backlight.
> +
> +  default-brightness:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Default brightness level on boot.

It's not clear that this is an index when 'brightness-levels' is present 
and absolute level when not. I wonder if we've been consistent on that?

> +    minimum: 0

Implied by being a uint32.

> +
> +  brightness-levels:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: Array of distinct brightness levels. The levels must be in
> +      the range accepted by the underlying LED devices. This is used to
> +      translate a backlight brightness level into a LED brightness level. If
> +      it is not provided, the identity mapping is used.
> +
> +required:
> +  - compatible
> +  - backlight-leds

leds?


Add 'additionalProperties: false' here.

> +
> +examples:
> +  - |
> +    backlight {

Please also define $nodename is 'backlight'.

> +      compatible = "led-backlight";
> +      backlight-leds = <&led1>;

leds?

> +      brightness-levels = <0 4 8 16 32 64 128 255>;
> +      default-brightness = <6>; /*6th level => brightness of the LEDs is 128*/
> +    };
> +  - |
> +    backlight {
> +      compatible = "led-backlight";
> +      backlight-leds = <&led1>, <&led2>;
> +      default-brightness = <255>;
> +    };
> +...
> -- 
> 2.17.1
> 
