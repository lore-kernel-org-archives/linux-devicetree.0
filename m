From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: light: Add binding for
 ADUX1020
Date: Sat, 12 Oct 2019 11:35:13 +0100
Message-ID: <20191012113513.7ceda4e0@archlinux>
References: <20191011184852.12202-1-manivannan.sadhasivam@linaro.org>
        <20191011184852.12202-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011184852.12202-2-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, robh+dt@kernel.org, alexandru.Ardelean@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 12 Oct 2019 00:18:51 +0530
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:

> Add devicetree binding for Analog Devices ADUX1020 Photometric
> sensor.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to poke at it some more.

Thanks,

Jonathan

> ---
>  .../bindings/iio/light/adux1020.yaml          | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/light/adux1020.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/light/adux1020.yaml b/Documentation/devicetree/bindings/iio/light/adux1020.yaml
> new file mode 100644
> index 000000000000..69bd5c06319d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/light/adux1020.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/light/adux1020.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices ADUX1020 Photometric sensor
> +
> +maintainers:
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +
> +description: |
> +  Photometric sensor over an i2c interface.
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/ADUX1020.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,adux1020
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
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
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        adux1020@64 {
> +                compatible = "adi,adux1020";
> +                reg = <0x64>;
> +                interrupt-parent = <&msmgpio>;
> +                interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +    };
> +...
