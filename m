From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: iio: maxbotix,mb1232.yaml: transform to yaml
Date: Wed, 02 Oct 2019 09:19:21 -0500
Message-ID: <5d94b1ec.1c69fb81.bb720.6d97@mx.google.com>
References: <20190923174605.mhrbmdic3ynaw22o@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190923174605.mhrbmdic3ynaw22o@arbad>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>
Cc: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, mark.rutland@arm.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 23, 2019 at 07:46:34PM +0200, Andreas Klinger wrote:
> transform existing documentation of maxbotix,mb1232 ultrasonic ranger
> from text documentation format into yaml.
> 
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> ---
>  .../bindings/iio/proximity/maxbotix,mb1232.txt     | 29 -----------
>  .../bindings/iio/proximity/maxbotix,mb1232.yaml    | 56 ++++++++++++++++++++++
>  2 files changed, 56 insertions(+), 29 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml

> diff --git a/Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml b/Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml
> new file mode 100644
> index 000000000000..8301a1ad2a47
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/proximity/maxbotix,mb1232.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MaxBotix I2CXL-MaxSonar ultrasonic distance sensor
> +
> +maintainers:
> +  - Andreas Klinger <ak@it-klinger.de>
> +
> +description: |
> +  MaxBotix I2CXL-MaxSonar ultrasonic distance sensor of type  mb1202,
> +  mb1212, mb1222, mb1232, mb1242, mb7040 or mb7137 using the i2c interface
> +  for ranging
> +
> +  Specifications about the devices can be found at:
> +  https://www.maxbotix.com/documents/I2CXL-MaxSonar-EZ_Datasheet.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxbotix,mb1202
> +      - maxbotix,mb1212
> +      - maxbotix,mb1222
> +      - maxbotix,mb1232
> +      - maxbotix,mb1242
> +      - maxbotix,mb7040
> +      - maxbotix,mb7137
> +
> +  reg:
> +    description:
> +      i2c address of the device, see also i2c/i2c.txt

Drop this.

> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      Interrupt used to announce the preceding reading request has finished
> +      and that data is available.  If no interrupt is specified the device
> +      driver falls back to wait a fixed amount of time until data can be
> +      retrieved.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +

Add a:

additionalProperties: false

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    proximity@70 {
> +      compatible = "maxbotix,mb1232";
> +      reg = <0x70>;
> +      interrupt-parent = <&gpio2>;
> +      interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> +    };
> -- 
> 2.11.0
