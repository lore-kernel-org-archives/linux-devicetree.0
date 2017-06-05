From: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v12 2/6] doc: dt: document altera-passive-serial binding
Date: Mon, 5 Jun 2017 10:11:34 -0500
Message-ID: <CANk1AXQTyBRw_BdWDPxqUcAnKESYNhmYMNRwzX+YeSF9-L69TQ@mail.gmail.com>
References: <20170525172911.11467-1-stillcompiling@gmail.com>
 <684ea151ba9aa2c6555a299daf56552ddc11f596.1496434383.git.stillcompiling@gmail.com>
 <4945d90535e701e4e0207c08a7543a7623b94aeb.1496434383.git.stillcompiling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4945d90535e701e4e0207c08a7543a7623b94aeb.1496434383.git.stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Bastian Stender <bst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 2, 2017 at 3:30 PM, Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Describe an altera-passive-serial devicetree entry, required features
>
> Signed-off-by: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Signed-off-by: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  .../bindings/fpga/altera-passive-serial.txt        | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fpga/altera-passive-serial.txt
>
> diff --git a/Documentation/devicetree/bindings/fpga/altera-passive-serial.txt b/Documentation/devicetree/bindings/fpga/altera-passive-serial.txt
> new file mode 100644
> index 000000000000..48478bc07e29
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fpga/altera-passive-serial.txt
> @@ -0,0 +1,29 @@
> +Altera Passive Serial SPI FPGA Manager
> +
> +Altera FPGAs support a method of loading the bitstream over what is
> +referred to as "passive serial".
> +The passive serial link is not technically SPI, and might require extra
> +circuits in order to play nicely with other SPI slaves on the same bus.
> +
> +See https://www.altera.com/literature/hb/cyc/cyc_c51013.pdf
> +
> +Required properties:
> +- compatible: Must be one of the following:
> +       "altr,fpga-passive-serial",
> +       "altr,fpga-arria10-passive-serial"
> +- reg: SPI chip select of the FPGA
> +- nconfig-gpios: config pin (referred to as nCONFIG in the manual)
> +- nstat-gpios: status pin (referred to as nSTATUS in the manual)
> +
> +Optional properties:
> +- confd-gpios: confd pin (referred to as CONF_DONE in the manual)
> +
> +Example:
> +       fpga: fpga@0 {
> +               compatible = "altr,fpga-passive-serial";
> +               spi-max-frequency = <20000000>;
> +               reg = <0>;
> +               nconfig-gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
> +               nstat-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
> +               confd-gpios = <&gpio4 12 GPIO_ACTIVE_LOW>;
> +       };
> --
> 2.11.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
