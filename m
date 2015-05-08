From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH iio] imu: inv_mpu6050: adds device tree bindings
Date: Fri, 08 May 2015 11:08:02 -0400
Message-ID: <554CD152.7080304@kernel.org>
References: <1429867387-10219-1-git-send-email-varkab@cdac.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429867387-10219-1-git-send-email-varkab-If5XQcfNmg0@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Varka Bhadram <varkab-If5XQcfNmg0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 24/04/15 05:23, Varka Bhadram wrote:
> Signed-off-by: Varka Bhadram <varkab-If5XQcfNmg0@public.gmane.org>
Applied to the togreg branch of iio.git. Will be initially pushed
out as testing for the autobuilders to play with it.

Thanks,

Jonathan
> ---
>  .../devicetree/bindings/iio/imu/inv_mpu6050.txt    |   17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt b/Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt
> new file mode 100644
> index 0000000..e4d8f1c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt
> @@ -0,0 +1,17 @@
> +InvenSense MPU-6050 Six-Axis (Gyro + Accelerometer) MEMS MotionTracking Device
> +
> +http://www.invensense.com/mems/gyro/mpu6050.html
> +
> +Required properties:
> + - compatible : should be "invensense,mpu6050"
> + - reg : the I2C address of the sensor
> + - interrupt-parent : should be the phandle for the interrupt controller
> + - interrupts : interrupt mapping for GPIO IRQ
> +
> +Example:
> +	mpu6050@68 {
> +		compatible = "invensense,mpu6050";
> +		reg = <0x68>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <18 1>;
> +	};
> 
