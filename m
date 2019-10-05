From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [RESEND PATCH v2 2/3] dt-bindings: iio: light: add veml6030 ALS
 bindings
Date: Sat, 5 Oct 2019 15:14:04 +0100
Message-ID: <20191005151404.5fc7386f@archlinux>
References: <cover.1569321085.git.gupt21@gmail.com>
        <b9d5cb134c7c2c7351025a0b556148bca23f302f.1569321085.git.gupt21@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b9d5cb134c7c2c7351025a0b556148bca23f302f.1569321085.git.gupt21@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rishi Gupta <gupt21@gmail.com>
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, tglx@linutronix.de, allison@lohutok.net, alexios.zavras@intel.com, angus@akkea.ca, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, hslester96@gmail.com, wsa+renesas@sang-engineering.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 24 Sep 2019 16:21:57 +0530
Rishi Gupta <gupt21@gmail.com> wrote:

> This commit adds device tree bindings for veml6030 ambient
> light sensor.
> 
> Signed-off-by: Rishi Gupta <gupt21@gmail.com>
looks fine to me, but...

DT bindings should always be sent to the DT-bindings maintainers and mailing list
for review.

+CC Rob, Mark and devicetree list.

Jonathan

> ---
> Changes in v2:
> * Corrected grammatical mistake from 'is' to 'are' in description of bindings
> 
>  .../devicetree/bindings/iio/light/veml6030.yaml    | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/light/veml6030.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/light/veml6030.yaml b/Documentation/devicetree/bindings/iio/light/veml6030.yaml
> new file mode 100644
> index 0000000..969b314
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/light/veml6030.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/light/veml6030.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: VEML6030 Ambient Light Sensor (ALS)
> +
> +maintainers:
> +  - Rishi Gupta <gupt21@gmail.com>
> +
> +description: |
> +  Bindings for the ambient light sensor veml6030 from Vishay
> +  Semiconductors over an i2c interface.
> +
> +  Irrespective of whether interrupt is used or not, application
> +  can get the ALS and White channel reading from IIO raw interface.
> +
> +  If the interrupts are used, application will receive an IIO event
> +  whenever configured threshold is crossed.
> +
> +  Specifications about the sensor can be found at:
> +    https://www.vishay.com/docs/84366/veml6030.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - vishay,veml6030
> +
> +  reg:
> +    description:
> +      I2C address of the device. If the ADDR pin on veml6030
> +      is pulled up, this address is 0x48. If the ADDR pin is
> +      pulled down, this address is 0x10.
> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      interrupt mapping for IRQ. Configure with IRQ_TYPE_LEVEL_LOW.
> +      Refer to interrupt-controller/interrupts.txt for generic
> +      interrupt client node bindings.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        light-sensor@10 {
> +                compatible = "vishay,veml6030";
> +                reg = <0x10>;
> +                interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
> +        };
> +    };
> +...
