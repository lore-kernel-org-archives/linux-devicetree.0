From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 11/38] Documentation: dt: iio: Add binding for LSM303DLH
Date: Sat, 14 Sep 2013 13:09:00 +0100
Message-ID: <523451DC.7050607@kernel.org>
References: <1378817379-8238-1-git-send-email-lee.jones@linaro.org> <1378817379-8238-12-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378817379-8238-12-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, denis.ciocca-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

add devicetree list cc

On 09/10/13 13:49, Lee Jones wrote:
> LSM303DLH is a Accelerometer Sensor
> 
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/accel/lsm303dlh.txt     | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/accel/lsm303dlh.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/accel/lsm303dlh.txt b/Documentation/devicetree/bindings/iio/accel/lsm303dlh.txt
> new file mode 100644
> index 0000000..bb59363
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/accel/lsm303dlh.txt
> @@ -0,0 +1,21 @@
> +* STMicroelectronics Accelerometer Sensor
> +
> +Required properties:
> +  - compatible: Should be "st,lsm303dlh_accel"
> +  - reg: The I2C address of the sensor
> +
> +Optional properties:
> +  - vdd-supply: Phandle to the Vdd supply regulator
> +  - vddio-supply: Phandle to the Vdd-IO supply regulator
> +
> +Example:
> +
> +i2c@80128000 {
> +	lsm303dlh_accel@19 {
> +		compatible = "st,lsm303dlh_accel";
> +		reg = <0x19>;
> +
> +		vdd-supply = <&ab8500_ldo_aux1_reg>;
> +		vddio-supply = <&db8500_vsmps2_reg>;
> +	};
> +};
> 
