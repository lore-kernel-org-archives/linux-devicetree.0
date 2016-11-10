From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] Documentation: DT: Add bmi160 imu binding
Date: Thu, 10 Nov 2016 12:55:52 -0600
Message-ID: <20161110185552.ny5fdfmy24l2li2f@rob-hp-laptop>
References: <20161103112527.29623-1-m.niestroj@grinn-global.com>
 <20161103112527.29623-2-m.niestroj@grinn-global.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161103112527.29623-2-m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 03, 2016 at 12:25:27PM +0100, Marcin Niestroj wrote:
> This adds documentation for Bosch BMI160 Inertial Measurement Unit
> device-tree bindings.
> 
> Signed-off-by: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/imu/bmi160.txt         | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/imu/bmi160.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/imu/bmi160.txt b/Documentation/devicetree/bindings/iio/imu/bmi160.txt
> new file mode 100644
> index 0000000..b02ef3e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/imu/bmi160.txt
> @@ -0,0 +1,34 @@
> +Bosch BMI160 - Inertial Measurement Unit with Accelerometer, Gyroscope
> +and externally connectable Magnetometer
> +
> +https://www.bosch-sensortec.com/bst/products/all_products/bmi160
> +
> +Required properties:
> + - compatible : should be "bosch,bmi160"
> + - reg : the I2C address or SPI chip select number of the sensor
> + - spi-max-frequency : set maximum clock frequency (only for SPI)
> +
> +Optional properties:
> + - interrupt-parent : should be the phandle of the interrupt controller
> + - interrupts : interrupt mapping for GPIO IRQ, must be IRQ_TYPE_LEVEL_LOW

The fact that a GPIO is typically used is outside the scope of this doc.

> + - interrupt-names : set to "INT2" if using INT2 pin

Normally there's no point to have names property when there is a single 
interrupt. However, it seems this could be either INT1 or INT2 or both 
connected. You need to specify all the options.

Rob
