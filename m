From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/5] doc: dt: add cyclone-spi binding document
Date: Mon, 31 Oct 2016 01:16:28 -0500
Message-ID: <20161031061628.focirubj6qmxwyn3@rob-hp-laptop>
References: <cover.1477669744.git.stillcompiling@gmail.com>
 <2de74f6d2f2689b8ef090a9017db2ffb3bd319cb.1477669745.git.stillcompiling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2de74f6d2f2689b8ef090a9017db2ffb3bd319cb.1477669745.git.stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 28, 2016 at 09:56:39AM -0700, Joshua Clayton wrote:
> Describe a cyclonei-ps-spi devicetree entry, required features
> 
> Signed-off-by: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../bindings/fpga/cyclone-ps-spi-fpga-mgr.txt      | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fpga/cyclone-ps-spi-fpga-mgr.txt
> 
> diff --git a/Documentation/devicetree/bindings/fpga/cyclone-ps-spi-fpga-mgr.txt b/Documentation/devicetree/bindings/fpga/cyclone-ps-spi-fpga-mgr.txt
> new file mode 100644
> index 0000000..c942281
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fpga/cyclone-ps-spi-fpga-mgr.txt
> @@ -0,0 +1,23 @@
> +Altera Cyclone Passive Serial SPI FPGA Manager
> +
> +Altera Cyclone FPGAs support a method of loading the bitstream over what is
> +referred to as "passive serial".
> +The passive serial link is not technically spi, and might require extra
> +circuits in order to play nicely with other spi slaves on the same bus.
> +
> +See https://www.altera.com/literature/hb/cyc/cyc_c51013.pdf
> +
> +Required properties:
> +- compatible  : should contain "altr,cyclone-ps-spi-fpga-mgr"
> +- reg         : spi slave id of the fpga
> +- config-gpio : config pin (referred to as nCONFIG in the cyclone manual)
> +- status-gpio : status pin (referred to as nSTATUS in the cyclone manual)

'-gpios' is the preferred form.

Looks like active low to me with nXXXX, but the example says active 
high. Please be specific here.

> +
> +Example:
> +	fpga_spi: evi-fpga-spi@0 {
> +		compatible = "altr,cyclone-ps-spi-fpga-mgr";
> +		spi-max-frequency = <20000000>;
> +		reg = <0>;
> +		config-gpio = <&gpio4 9 GPIO_ACTIVE_HIGH>;
> +		status-gpio = <&gpio4 11 GPIO_ACTIVE_HIGH>;
> +	};
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
