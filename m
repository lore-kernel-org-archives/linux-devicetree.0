From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 12/38] Documentation: dt: iio: Add binding for L3G4200D
Date: Sat, 14 Sep 2013 13:09:18 +0100
Message-ID: <523451EE.7080307@kernel.org>
References: <1378817379-8238-1-git-send-email-lee.jones@linaro.org> <1378817379-8238-13-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378817379-8238-13-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, denis.ciocca-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add devicetree list cc
On 09/10/13 13:49, Lee Jones wrote:
> L3G4200D is a Gyroscope Sensor
> 
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/gyro/l3g4200d.txt       | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/gyro/l3g4200d.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/gyro/l3g4200d.txt b/Documentation/devicetree/bindings/iio/gyro/l3g4200d.txt
> new file mode 100644
> index 0000000..29baf9d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/gyro/l3g4200d.txt
> @@ -0,0 +1,21 @@
> +* STMicroelectronics Gyroscope Sensor
> +
> +Required properties:
> +  - compatible: Should be "st,l3g4200d_gyro"
> +  - reg: The I2C address of the sensor
> +
> +Optional properties:
> +  - vdd-supply: Phandle to the Vdd supply regulator
> +  - vddio-supply: Phandle to the Vdd-IO supply regulator
> +
> +Example:
> +
> +i2c@80128000 {
> +	l3g4200d_gyro@68 {
> +		compatible = "st,l3g4200d_gyro";
> +		reg = <0x68>;
> +
> +		vdd-supply = <&ab8500_ldo_aux1_reg>;
> +		vddio-supply = <&db8500_vsmps2_reg>;
> +	};
> +};
> 
