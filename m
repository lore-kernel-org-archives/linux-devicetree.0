From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v6 2/2] dt-bindings: iio: frequency: Add docs for
 ADF4371 PLL
Date: Sat, 8 Jun 2019 14:46:36 +0100
Message-ID: <20190608144636.13b31f52@archlinux>
References: <1559660301-12298-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559660301-12298-1-git-send-email-stefan.popa@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Popa <stefan.popa@analog.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 4 Jun 2019 17:58:21 +0300
Stefan Popa <stefan.popa@analog.com> wrote:

> Document support for Analog Devices ADF4371 SPI Wideband Synthesizer.
> 
> Signed-off-by: Stefan Popa <stefan.popa@analog.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan

> ---
> Changes in v2:
> 	- Nothing changed.
> Changes in v3:
> 	- Nothing changed.
> Changes in v4:
> 	- Nothing changed.
> Changes in v5:
> 	- Nothing changed.
> Changes in v6:
> 	- Nothing changed.
> 
>  .../devicetree/bindings/iio/frequency/adf4371.yaml | 54 ++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml b/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
> new file mode 100644
> index 0000000..d7adf074
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/frequency/adf4371.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices ADF4371 Wideband Synthesizer
> +
> +maintainers:
> +  - Popa Stefan <stefan.popa@analog.com>
> +
> +description: |
> +  Analog Devices ADF4371 SPI Wideband Synthesizer
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/adf4371.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,adf4371
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      Definition of the external clock (see clock/clock-bindings.txt)
> +    maxItems: 1
> +
> +  clock-names:
> +    description:
> +      Must be "clkin"
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    spi0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        frequency@0 {
> +                compatible = "adi,adf4371";
> +                reg = <0>;
> +                spi-max-frequency = <1000000>;
> +                clocks = <&adf4371_clkin>;
> +                clock-names = "clkin";
> +        };
> +    };
> +...
