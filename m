From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [PATCH v2 6/7] dt-bindings: iio: document envelope-detector
 bindings
Date: Sun, 23 Oct 2016 11:01:16 +0200
Message-ID: <f743f779-84e2-ca8f-ec04-dc2e360e934f@axentia.se>
References: <1477176226-10566-1-git-send-email-peda@axentia.se>
 <1477176226-10566-7-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477176226-10566-7-git-send-email-peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-10-23 00:43, Peter Rosin wrote:
> Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
> ---
>  .../bindings/iio/adc/envelope-detector.txt         | 55 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 +++
>  2 files changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/envelope-detector.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/envelope-detector.txt b/Documentation/devicetree/bindings/iio/adc/envelope-detector.txt
> new file mode 100644
> index 000000000000..9099531cffff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/envelope-detector.txt
> @@ -0,0 +1,55 @@
> +Bindings for ADC envelope detector using a DAC and a comparator
> +
> +The DAC is used to find the peak level of an alternating voltage input
> +signal by a binary search using the output of a comparator wired to
> +an interrupt pin. Like so:
> +                          _
> +                         | \
> +    input +------>-------|+ \
> +                         |   \
> +           .-------.     |    }---.
> +           |       |     |   /    |
> +           |    dac|-->--|- /     |
> +           |       |     |_/      |
> +           |       |              |
> +           |       |              |
> +           |    irq|------<-------'
> +           |       |
> +           '-------'
> +
> +Required properties:
> +- compatible: Should be "axentia,tse850-envelope-detector"
> +- io-channels: Channel node of the dac to be used for comparator input.
> +- io-channel-names: Should be "dac".
> +- interrupt specification for one client interrupt,
> +  see ../../interrupt-controller/interrupts.txt for details.
> +- interrupt-names: Should be "comp".
> +
> +Example:
> +
> +	&i2c {
> +		dpot: mcp4651-104@28 {
> +			compatible = "microchip,mcp4651-104";
> +			reg = <0x28>;
> +			#io-channel-cells = <1>;
> +		};
> +	};
> +
> +	dac: dac {
> +		compatible = "dpot-dac";
> +		vref-supply = <&reg_3v3>;
> +		io-channels = <&dpot 0>;
> +		io-channel-names = "dpot";
> +		dpot-dac,max-ohms = <100000>;

Just noticed that this line isn't needed anymore. I'll kill it for v3.

Cheers,
Peter

> +		#io-channel-cells = <1>;
> +	};
> +
> +	envelope-detector {
> +		compatible = "axentia,tse850-envelope-detector";
> +		io-channels = <&dac 0>;
> +		io-channel-names = "dac";
> +
> +		interrupt-parent = <&gpio>;
> +		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-names = "comp";
> +	};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8c8aae24b96b..4b6f6ec1b703 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6118,6 +6118,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/dac/dpot-dac.txt
>  F:	drivers/iio/dac/dpot-dac.c
>  
> +IIO ENVELOPE DETECTOR
> +M:	Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
> +L:	linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/iio/adc/envelope-detector.txt
> +
>  IIO SUBSYSTEM AND DRIVERS
>  M:	Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>  R:	Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
