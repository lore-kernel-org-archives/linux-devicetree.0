From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: iio: light: add UVIS25 device
 bindings
Date: Sat, 25 Nov 2017 16:11:26 +0000
Message-ID: <20171125161126.5ac74773@archlinux>
References: <20171123225906.31838-1-lorenzo.bianconi83@gmail.com>
        <20171123225906.31838-3-lorenzo.bianconi83@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171123225906.31838-3-lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 23 Nov 2017 23:59:06 +0100
Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Applied
> ---
>  .../devicetree/bindings/iio/light/uvis25.txt       | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/light/uvis25.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/light/uvis25.txt b/Documentation/devicetree/bindings/iio/light/uvis25.txt
> new file mode 100644
> index 000000000000..3041207e3f3c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/light/uvis25.txt
> @@ -0,0 +1,23 @@
> +* ST UVIS25 uv sensor
> +
> +Required properties:
> +- compatible: should be "st,uvis25"
> +- reg: i2c address of the sensor / spi cs line
> +
> +Optional properties:
> +- interrupt-parent: should be the phandle for the interrupt controller
> +- interrupts: interrupt mapping for IRQ. It should be configured with
> +  flags IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_EDGE_RISING, IRQ_TYPE_LEVEL_LOW or
> +  IRQ_TYPE_EDGE_FALLING.
> +
> +  Refer to interrupt-controller/interrupts.txt for generic interrupt
> +  client node bindings.
> +
> +Example:
> +
> +uvis25@47 {
> +	compatible = "st,uvis25";
> +	reg = <0x47>;
> +	interrupt-parent = <&gpio0>;
> +	interrupts = <0 IRQ_TYPE_EDGE_RISING>;
> +};

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
