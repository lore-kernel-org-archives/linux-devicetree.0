From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/4] Documentation: dt-bindings: iio: Add max9611 ADC
Date: Sat, 25 Mar 2017 15:27:44 +0000
Message-ID: <12426276-4388-c323-7d08-6bc8ee9eebca@kernel.org>
References: <1490369323-13866-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490369323-13866-2-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490369323-13866-2-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 24/03/17 15:28, Jacopo Mondi wrote:
> Add device tree bindings documentation for Maxim max9611/max9612 current
> sense amplifier.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Fine with me, waiting for Mark or Rob to take a look though....
> ---
>  .../devicetree/bindings/iio/adc/max9611.txt        | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/max9611.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/max9611.txt b/Documentation/devicetree/bindings/iio/adc/max9611.txt
> new file mode 100644
> index 0000000..8430d3b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/max9611.txt
> @@ -0,0 +1,26 @@
> +* Maxim max9611/max9612 current sense amplifier with 12-bits ADC interface
> +
> +Maxim max9611/max9612 is an high-side current sense amplifier with integrated
> +12-bits ADC communicating over I2c bus.
> +The device node for this driver shall be a child of a I2c controller.
> +
> +Required properties
> +  - compatible: Should be "maxim,max9611" or "maxim,max9612"
> +  - reg: The 7-bits long I2c address of the device
> +  - shunt-resistor-uohm: Value, in uOhm, of the current sense shunt resistor
I'm fine with this being generic, but it makes this just non trivial enough that
I'll wait for Rob or Mark to have a chance to take a look at the binding.
> +
> +Example:
> +
> +&i2c4 {
> +	csa: adc@7c {
> +		compatible = "maxim,max9611";
> +		reg = <0x7c>;
> +
> +		shunt-resistor-uohm = <5000>;
> +	};
> +};
> +
> +This device node describes a current sense amplifier sitting on I2c4 bus
> +with address 0x7c (read address is 0xf9, write address is 0xf8).
> +A sense resistor of 0,005 Ohm is installed between RS+ and RS- current-sensing
> +inputs.
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
