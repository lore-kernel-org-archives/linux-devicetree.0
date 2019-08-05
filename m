From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: Add binding document for NOA1305
Date: Mon, 5 Aug 2019 16:57:55 +0100
Message-ID: <20190805165755.10c0bde3@archlinux>
References: <20190802114228.1278-1-martyn.welch@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190802114228.1278-1-martyn.welch@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@lists.collabora.co.uk, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri,  2 Aug 2019 12:42:27 +0100
Martyn Welch <martyn.welch@collabora.com> wrote:

> Document the ON Semiconductor NOA1305 ambient light sensor devicetree
> bindings.
> 
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to the togreg branch of iio.git and pushed out as testing.

Thanks,

Jonathan

> ---
> 
> Changes:
> v2: Same as v1.
> v3: Same as v2.
> v4: Same as v3.
> 
>  .../bindings/iio/light/noa1305.yaml           | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/light/noa1305.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/light/noa1305.yaml b/Documentation/devicetree/bindings/iio/light/noa1305.yaml
> new file mode 100644
> index 000000000000..17e7f140b69b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/light/noa1305.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/light/noa1305.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ON Semiconductor NOA1305 Ambient Light Sensor
> +
> +maintainers:
> +  - Martyn Welch <martyn.welch@collabora.com>
> +
> +description: |
> +  Ambient sensing with an i2c interface.
> +
> +  https://www.onsemi.com/pub/Collateral/NOA1305-D.PDF
> +
> +properties:
> +  compatible:
> +    enum:
> +      - onnn,noa1305
> +
> +  reg:
> +    maxItems: 1
> +
> +  vin-supply:
> +    description: Regulator that provides power to the sensor
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    i2c {
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        light@39 {
> +                compatible = "onnn,noa1305";
> +                reg = <0x39>;
> +        };
> +    };
> +...
