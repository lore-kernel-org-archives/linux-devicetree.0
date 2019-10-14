From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: accel: bma400: add bindings
Date: Mon, 14 Oct 2019 12:15:21 -0500
Message-ID: <20191014171521.GA29335@bogus>
References: <20191012192525.21040-1-dan@dlrobertson.com>
 <20191012192525.21040-2-dan@dlrobertson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191012192525.21040-2-dan@dlrobertson.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Robertson <dan@dlrobertson.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Andy Shevchenko <andy.shevchenko@gmail.com>, devicetree@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 12, 2019 at 07:25:24PM +0000, Dan Robertson wrote:
> Add devicetree binding for the Bosch BMA400 3-axes ultra-low power
> accelerometer sensor.
> 
> Signed-off-by: Dan Robertson <dan@dlrobertson.com>
> ---
>  .../devicetree/bindings/iio/accel/bma400.yaml | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/accel/bma400.yaml

Fails 'make dt_binding_check':

Documentation/devicetree/bindings/iio/accel/bma400.example.dts:22.13-26: 
Warning (reg_format): /example-0/i2c0/bma400@14:reg: property has 
invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/iio/accel/bma400.example.dt.yaml: 
Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/iio/accel/bma400.example.dt.yaml: 
Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/iio/accel/bma400.example.dt.yaml: 
Warning (spi_bus_reg): Failed prerequisite 'reg_format'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/accel/bma400.example.dt.yaml: 
i2c0: #size-cells:0:0: 0 was expected


> 
> diff --git a/Documentation/devicetree/bindings/iio/accel/bma400.yaml b/Documentation/devicetree/bindings/iio/accel/bma400.yaml
> new file mode 100644
> index 000000000000..31dceac89ace
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/accel/bma400.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/accel/bma400.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bosch BMA400 triaxial acceleration sensor
> +
> +maintainers:
> +  - Dan Robertson <dan@dlrobertson.com>
> +
> +description: |
> +  Acceleration and temerature iio sensors with an i2c interface
> +
> +  Specifications about the sensor can be found at:
> +    https://ae-bst.resource.bosch.com/media/_tech/media/datasheets/BST-BMA400-DS000.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - bosch,bma400
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    i2c0 {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      bma400@14 {
> +        compatible = "bosch,bma400";
> +        reg = <0x14>;
> +      };
> +    };
> -- 
> 2.23.0
> 
> 
> 
