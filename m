From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: iio: potentiometer: add max5432.yaml binding
Date: Mon, 29 Jul 2019 17:43:54 -0600
Message-ID: <CAL_JsqLfMhR819mxTtam8AJQmy321-b1ut0az+tpPARE3HWzmg@mail.gmail.com>
References: <20190721175915.27192-1-martin@kaiser.cx> <20190729114531.12386-1-martin@kaiser.cx>
 <20190729114531.12386-2-martin@kaiser.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729114531.12386-2-martin@kaiser.cx>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Kaiser <martin@kaiser.cx>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 29, 2019 at 5:46 AM Martin Kaiser <martin@kaiser.cx> wrote:
>
> Add a binding for the Maxim Integrated MAX5432-MAX5435 family of digital
> potentiometers.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> changes in v3
>  - split dt bindings and driver code into separate patches
>  - use yaml format for dt bindings
>  - fix formatting of parameter lists
>
> changes in v2
>  - use MAX5432_ prefix for all defines
>  - fix indentation
>  - convert void * to unsigned long, not to u32
>    (warning from kbuild test robot)
>
>  .../bindings/iio/potentiometer/max5432.yaml        | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/potentiometer/max5432.yaml
>
> diff --git a/Documentation/devicetree/bindings/iio/potentiometer/max5432.yaml b/Documentation/devicetree/bindings/iio/potentiometer/max5432.yaml
> new file mode 100644
> index 000000000000..448781b80f39
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/potentiometer/max5432.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/potentiometer/max5432.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim Integrated MAX5432-MAX5435 Digital Potentiometers
> +
> +maintainers:
> +  - Martin Kaiser <martin@kaiser.cx>
> +
> +description: |
> +  Maxim Integrated MAX5432-MAX5435 Digital Potentiometers connected via I2C
> +
> +  Datasheet:
> +    https://datasheets.maximintegrated.com/en/ds/MAX5432-MAX5435.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max5432
> +      - maxim,max5433
> +      - maxim,max5434
> +      - maxim,max5435
> +

reg?

Also, add an 'additionalProperties: false' line. This means other
properties can't be present (except 'status' and a few we
automatically add).

> +examples:
> +  - |
> +    i2c0 {

i2c {

> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      max5434@28 {
> +        compatible = "maxim,max5434";
> +        reg = <0x28>;
> +      };
> +    };
> --
> 2.11.0
>
