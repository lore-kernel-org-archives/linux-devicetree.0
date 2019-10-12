From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: accel: bma400: add bindings
Date: Sat, 12 Oct 2019 10:31:07 +0100
Message-ID: <20191012103107.61eeb350@archlinux>
References: <20191012035420.13904-1-dan@dlrobertson.com>
        <20191012035420.13904-2-dan@dlrobertson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191012035420.13904-2-dan@dlrobertson.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Robertson <dan@dlrobertson.com>
Cc: linux-iio@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, devicetree@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 12 Oct 2019 03:54:19 +0000
Dan Robertson <dan@dlrobertson.com> wrote:

> Add devicetree binding for the Bosch BMA400 3-axes ultra-low power
> accelerometer sensor.
> 
> Signed-off-by: Dan Robertson <dan@dlrobertson.com>
Hi Dan,

Apologies for not pointing this out in V1 but all new IIO bindings need
to be in the yaml format rather than plain text.

Please convert this one over for v3.  Content wise it's fine btw!

Jonathan


> ---
>  .../devicetree/bindings/iio/accel/bma400.txt     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/accel/bma400.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/accel/bma400.txt b/Documentation/devicetree/bindings/iio/accel/bma400.txt
> new file mode 100644
> index 000000000000..abba4f104941
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/accel/bma400.txt
> @@ -0,0 +1,16 @@
> +
> +* Bosch BMA400 triaxial acceleration sensor
> +
> +https://ae-bst.resource.bosch.com/media/_tech/media/datasheets/BST-BMA400-DS000.pdf
> +
> +Required properties:
> +
> +  - compatible : should be "bosch,bma400"
> +  - reg : the I2C address of the sensor
> +
> +Example:
> +
> +bma400@14 {
> +	compatible = "bosch,bma400";
> +	reg = <0x14>;
> +};
> 
> 
