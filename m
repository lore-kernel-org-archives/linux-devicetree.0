From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] dt-bindings: iio: add Intersil isl76683 light sensor
 bindings
Date: Fri, 10 Nov 2017 15:26:04 -0600
Message-ID: <20171110212604.bpbsgtw7zbk5qp2d@rob-hp-laptop>
References: <1510068983-25769-1-git-send-email-chf.fritz@googlemail.com>
 <1510068983-25769-3-git-send-email-chf.fritz@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1510068983-25769-3-git-send-email-chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Fritz <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 07, 2017 at 04:36:22PM +0100, Christoph Fritz wrote:
> This patch adds documentation of device tree bindings for Intersil
> isl76683 light sensor.
> 
> Signed-off-by: Christoph Fritz <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/light/isl76683.txt     | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/light/isl76683.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/light/isl76683.txt b/Documentation/devicetree/bindings/iio/light/isl76683.txt
> new file mode 100644
> index 0000000..657f17d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/light/isl76683.txt
> @@ -0,0 +1,26 @@
> +* ISL76683 ambient light sensor
> +
> +http://www.intersil.com/content/dam/Intersil/documents/isl7/isl76683.pdf
> +
> +Required properties:
> +
> +  - compatible: must be "isil,isl76683"
> +  - reg: the I2C address of the sensor
> +  - interrupt-parent: should be the phandle for the interrupt controller
> +  - interrupts: interrupt mapping for GPIO IRQ
> +
> +Optional properties:
> +
> +  - isil,external-resistor: integer in kOhm of external resistor R_ext.
> +                            Valid values are from 1 to 1000.
> +                            If not supplied, 100 kOhm will be assumed.

Add an unit suffix as defined in property-units.txt.

> +
> +Example:
> +
> +isl76683@44 {
> +	compatible = "isil,isl76683";
> +	reg = <0x44>;
> +	interrupt-parent = <&gpio1>;
> +	interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
> +	isil,external-resistor = <50>;
> +};
> -- 
> 2.1.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
