From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2 v6] iio: gyro: Add MPU-3050 device tree bindings
Date: Tue, 25 Oct 2016 17:13:57 +0100
Message-ID: <e6e8241e-d9db-a61d-8a9b-530e4ec3f28a@kernel.org>
References: <1477404954-3942-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477404954-3942-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 25/10/16 15:15, Linus Walleij wrote:
> This adds device tree bindings for the MPU-3050 gyroscope. Since it
> is the first set of bindings for a gyroscope, the folder for it
> is also created.
> 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to largely ignore this patch ;)

Thanks

Jonathan
> ---
> ChangeLog v5->v6:
> - No changes, just reposting.
> ChangeLog v4->v5:
> - No changes, just reposting.
> ChangeLog v3->v4:
> - No changes, just reposting. If we agree on these bindings and since
>   the dependent I2C bindings are merged, this patch should be merge
>   material now I guess.
> ChangeLog v2->v3:
> - Augmented device tree bindings to reflect Peter Rosins now merged
>   I2C gate bindings.
> ChangeLog v1->v2:
> - Not yet convered to use i2c-gate as I'm waiting for that
>   patch set to stabilize.
> ---
>  .../bindings/iio/gyroscope/invensense,mpu3050.txt  | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.txt b/Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.txt
> new file mode 100644
> index 000000000000..b0d3b59966bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.txt
> @@ -0,0 +1,46 @@
> +Invensense MPU-3050 Gyroscope device tree bindings
> +
> +Required properties:
> +  - compatible : should be "invensense,mpu3050"
> +  - reg : the I2C address of the sensor
> +
> +Optional properties:
> +  - interrupt-parent : should be the phandle for the interrupt controller
> +  - interrupts : interrupt mapping for the trigger interrupt from the
> +    internal oscillator. The following IRQ modes are supported:
> +    IRQ_TYPE_EDGE_RISING, IRQ_TYPE_EDGE_FALLING, IRQ_TYPE_LEVEL_HIGH and
> +    IRQ_TYPE_LEVEL_LOW. The driver should detect and configure the hardware
> +    for the desired interrupt type.
> +  - vdd-supply : supply regulator for the main power voltage.
> +  - vlogic-supply : supply regulator for the signal voltage.
> +  - mount-matrix : see iio/mount-matrix.txt
> +
> +Optional subnodes:
> +  - The MPU-3050 will pass through and forward the I2C signals from the
> +    incoming I2C bus, alternatively drive traffic to a slave device (usually
> +    an accelerometer) on its own initiative. Therefore is supports a subnode
> +    i2c gate node. For details see: i2c/i2c-gate.txt
> +
> +Example:
> +
> +mpu3050@68 {
> +	compatible = "invensense,mpu3050";
> +	reg = <0x68>;
> +	interrupt-parent = <&foo>;
> +	interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +	vdd-supply = <&bar>;
> +	vlogic-supply = <&baz>;
> +
> +	/* External I2C interface */
> +	i2c-gate {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		fnord@18 {
> +			compatible = "fnord";
> +			reg = <0x18>;
> +			interrupt-parent = <&foo>;
> +			interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
> +		};
> +	};
> +};
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
