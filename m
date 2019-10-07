From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: iio: maxbotix,mb1232.yaml: transform to yaml
Date: Mon, 7 Oct 2019 07:42:29 -0500
Message-ID: <CAL_Jsq+0SpRVmGJSm5Hw8bQ_zdeJy5wfTb9RM1r=crkiT2uM-Q@mail.gmail.com>
References: <20191006142715.45k64cgw7mzlekm5@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191006142715.45k64cgw7mzlekm5@arbad>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 6, 2019 at 9:27 AM Andreas Klinger <ak@it-klinger.de> wrote:
>
> transform existing documentation of maxbotix,mb1232 ultrasonic ranger
> from text documentation format into yaml.
>
> Changes in v2:
> - removed description of reg property
> - added a line:
>   additionalProperties: false
>
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> ---
>  .../bindings/iio/proximity/maxbotix,mb1232.txt     | 29 -----------
>  .../bindings/iio/proximity/maxbotix,mb1232.yaml    | 56 ++++++++++++++++++++++
>  2 files changed, 56 insertions(+), 29 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml
>
> diff --git a/Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.txt b/Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.txt
> deleted file mode 100644
> index dd1058fbe9c3..000000000000
> --- a/Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -* MaxBotix I2CXL-MaxSonar ultrasonic distance sensor of type  mb1202,
> -  mb1212, mb1222, mb1232, mb1242, mb7040 or mb7137 using the i2c interface
> -  for ranging
> -
> -Required properties:
> - - compatible:         "maxbotix,mb1202",
> -                       "maxbotix,mb1212",
> -                       "maxbotix,mb1222",
> -                       "maxbotix,mb1232",
> -                       "maxbotix,mb1242",
> -                       "maxbotix,mb7040" or
> -                       "maxbotix,mb7137"
> -
> - - reg:                        i2c address of the device, see also i2c/i2c.txt
> -
> -Optional properties:
> - - interrupts:         Interrupt used to announce the preceding reading
> -                       request has finished and that data is available.
> -                       If no interrupt is specified the device driver
> -                       falls back to wait a fixed amount of time until
> -                       data can be retrieved.
> -
> -Example:
> -proximity@70 {
> -       compatible = "maxbotix,mb1232";
> -       reg = <0x70>;
> -       interrupt-parent = <&gpio2>;
> -       interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> -};
> diff --git a/Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml b/Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml
> new file mode 100644
> index 000000000000..e2fb1f6d4dbe
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
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    proximity@70 {

Fails to build with 'make dt_binding_check':

Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.example.dts:20.11-24:
Warning (reg_format): /example-0/proximity@70:reg: property has
invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.example.dt.yaml:
Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.example.dt.yaml:
Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.example.dt.yaml:
Warning (spi_bus_reg): Failed prerequisite 'reg_format'

You have to put this under an i2c bus node.

i2c {
  #address-cells = <1>;
  #size-cells = <0>;
  ...
};

> +      compatible = "maxbotix,mb1232";
> +      reg = <0x70>;
> +      interrupt-parent = <&gpio2>;
> +      interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> +    };
> --
> 2.11.0
