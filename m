From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: iio: accel: kxcjk1013: Add device
 tree binding documentation
Date: Sat, 9 Mar 2019 18:15:02 +0000
Message-ID: <20190309181502.0ba185fd@archlinux>
References: <20190304151912.11485-1-decatf@gmail.com>
        <20190304151912.11485-3-decatf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304151912.11485-3-decatf@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Yang <decatf@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon,  4 Mar 2019 10:19:11 -0500
Robert Yang <decatf@gmail.com> wrote:

> Document device tree bindings for Kionix KXCJK-1013 Accelerometer driver.
> 
> Signed-off-by: Robert Yang <decatf@gmail.com>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

thanks,

Jonathan

> ---
>  .../bindings/iio/accel/kionix,kxcjk1013.txt     | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/accel/kionix,kxcjk1013.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/accel/kionix,kxcjk1013.txt b/Documentation/devicetree/bindings/iio/accel/kionix,kxcjk1013.txt
> new file mode 100644
> index 000000000000..eb76a02e2a82
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/accel/kionix,kxcjk1013.txt
> @@ -0,0 +1,17 @@
> +Kionix KXCJK-1013 Accelerometer device tree bindings
> +
> +Required properties:
> +
> +- compatible: Must be one of:
> +    "kionix,kxcjk1013"
> +    "kionix,kxcj91008"
> +    "kionix,kxtj21009"
> +    "kionix,kxtf9"
> + - reg: i2c slave address
> +
> +Example:
> +
> +kxtf9@f {
> +	compatible = "kionix,kxtf9";
> +	reg = <0x0F>;
> +};
