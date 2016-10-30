From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 5/8] dt-bindings: iio: document dpot-dac bindings
Date: Sun, 30 Oct 2016 13:28:31 +0000
Message-ID: <f81f9281-dfeb-306b-757a-2654c7eacc15@kernel.org>
References: <1477262381-7800-1-git-send-email-peda@axentia.se>
 <1477262381-7800-6-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477262381-7800-6-git-send-email-peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 23/10/16 23:39, Peter Rosin wrote:
> Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
I'm happy with this, but it's odd enough I'd like some devicetree maintainer
feedback ideally.

Thanks,

Jonathan
> ---
>  .../devicetree/bindings/iio/dac/dpot-dac.txt       | 41 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 ++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/dac/dpot-dac.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/dpot-dac.txt b/Documentation/devicetree/bindings/iio/dac/dpot-dac.txt
> new file mode 100644
> index 000000000000..fdf47a01bfef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/dpot-dac.txt
> @@ -0,0 +1,41 @@
> +Bindings for DAC emulation using a digital potentiometer
> +
> +It is assumed that the dpot is used as a voltage divider between the
> +current dpot wiper setting and the maximum resistance of the dpot. The
> +divided voltage is provided by a vref regulator.
> +
> +                  .------.
> +   .-----------.  |      |
> +   | vref      |--'    .---.
> +   | regulator |--.    |   |
> +   '-----------'  |    | d |
> +                  |    | p |
> +                  |    | o |  wiper
> +                  |    | t |<---------+
> +                  |    |   |
> +                  |    '---'       dac output voltage
> +                  |      |
> +                  '------+------------+
> +
> +Required properties:
> +- compatible: Should be "dpot-dac"
> +- vref-supply: The regulator supplying the voltage divider.
> +- io-channels: Channel node of the dpot to be used for the voltage division.
> +- io-channel-names: Should be "dpot".
> +
> +Example:
> +
> +	&i2c {
> +		dpot: mcp4651-503@28 {
> +			compatible = "microchip,mcp4651-503";
> +			reg = <0x28>;
> +			#io-channel-cells = <1>;
> +		};
> +	};
> +
> +	dac {
> +		compatible = "dpot-dac";
> +		vref-supply = <&reg_3v3>;
> +		io-channels = <&dpot 0>;
> +		io-channel-names = "dpot";
> +	};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7c65585e1230..6218010128dc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6111,6 +6111,12 @@ L:	linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>  S:	Maintained
>  F:	drivers/media/rc/iguanair.c
>  
> +IIO DIGITAL POTENTIOMETER DAC
> +M:	Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
> +L:	linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/iio/dac/dpot-dac.txt
> +
>  IIO SUBSYSTEM AND DRIVERS
>  M:	Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>  R:	Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
