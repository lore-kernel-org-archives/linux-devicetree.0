From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/3] doc: dt: add cyclone-spi binding document
Date: Thu, 1 Dec 2016 09:41:29 -0800
Message-ID: <CAAtXAHd_krKPpXRw5NxWhS6kcQ_fJcuyZYDOretRfNn+Cpkn2A@mail.gmail.com>
References: <cover.1480551148.git.stillcompiling@gmail.com> <137f03de76e5f865430b17ca247e8f73e3315c8d.1480551148.git.stillcompiling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <137f03de76e5f865430b17ca247e8f73e3315c8d.1480551148.git.stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 1, 2016 at 9:04 AM, Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Describe a cyclonei-ps-spi devicetree entry, required features
>
> Signed-off-by: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>

> ---
>
>  .../bindings/fpga/cyclone-ps-spi-fpga-mgr.txt      | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fpga/cyclone-ps-spi-fpga-mgr.txt
>
> diff --git a/Documentation/devicetree/bindings/fpga/cyclone-ps-spi-fpga-mgr.txt b/Documentation/devicetree/bindings/fpga/cyclone-ps-spi-fpga-mgr.txt
> new file mode 100644
> index 0000000..3f515c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fpga/cyclone-ps-spi-fpga-mgr.txt
> @@ -0,0 +1,25 @@
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
> +- config-gpios : config pin (referred to as nCONFIG in the cyclone manual)
> +- status-gpios : status pin (referred to as nSTATUS in the cyclone manual)
> +
> +both gpio pins are normally active low open drain.
> +
> +Example:
> +       fpga_spi: evi-fpga-spi@0 {
> +               compatible = "altr,cyclone-ps-spi-fpga-mgr";
> +               spi-max-frequency = <20000000>;
> +               reg = <0>;
> +               config-gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
> +               status-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
> +       };
> --
> 2.9.3
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
