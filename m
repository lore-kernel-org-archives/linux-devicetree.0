From: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 3/4] dt-bindings: iio: document envelope-detector
 bindings
Date: Thu, 20 Oct 2016 13:29:16 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1610201304490.19919@pmeerw.net>
References: <1476955562-13673-1-git-send-email-peda@axentia.se> <1476955562-13673-4-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476955562-13673-4-git-send-email-peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 20 Oct 2016, Peter Rosin wrote:

nitpicking below

> Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
> ---
>  .../bindings/iio/adc/envelope-detector.txt         | 65 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 ++
>  2 files changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/envelope-detector.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/envelope-detector.txt b/Documentation/devicetree/bindings/iio/adc/envelope-detector.txt
> new file mode 100644
> index 000000000000..0e26299516fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/envelope-detector.txt
> @@ -0,0 +1,65 @@
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
> +- compatible: Should be "envelope-detector"
> +- io-channels: Channel node of the dac to be used for comparator input.
> +- io-channel-names: Should be "dac".
> +- interrupt specification for one client interrupt,
> +  see ../../interrupt-controller/interrupts.txt for details.
> +- interrupt-names: Should be "comp".
> +- envelope-detector,dac-max: The maximum raw input value for the dac.
> +- envelope-detector,comp-interval-ms: How long to wait for the comparator
> +  to trigger before moving on to another DAC level. This interval needs to
> +  relate to the lowest possible frequency of the above input signal.
> +
> +Optional properties:
> +- envelope-detector,inverted: If the input signal is centered around the
> +  dac-max voltage (instead of zero), this property causes the detector to
> +  search for the lowest DAC value that does not triggers the comparator

does not trigger

> +  (instead of the highest). The result is also inverted so that a lower DAC
> +  reading yields a higher voltage value.
> +
> +
> +Example:
> +
> +	&spi {
> +		dac: ad7303@4 {
> +			compatible = "adi,ad7303";
> +			reg = <4>;
> +			spi-max-frequency = <10000000>;
> +			Vdd-supply = <&vdd_supply>;
> +			adi,use-external-reference;
> +			REF-supply = <&vref_supply>;
> +			#io-channel-cells = <1>;
> +		};
> +	};
> +
> +	envelope-detector {
> +		compatible = "envelope-detector";
> +		io-channels = <&dac 0>;
> +		io-channel-names = "dac";
> +
> +		interrupt-parent = <&gpio>;
> +		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-names = "comp";
> +
> +		envelope-detector,dac-max = <255>;
> +		envelope-detector,comp-interval-ms = <50>;
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

Peter Meerwald-Stadler
+43-664-2444418 (mobile)
