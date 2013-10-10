From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] spi: xilinx: Add DT binding documentation for
 spi/spi-xilinx.c
Date: Thu, 10 Oct 2013 17:03:26 +0100
Message-ID: <20131010160326.GK26954@e106331-lin.cambridge.arm.com>
References: <5256C6B6.9090604@efe-gmbh.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5256C6B6.9090604-Xf229rFC5gsb1SvskN2V4Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Renner <renner-Xf229rFC5gsb1SvskN2V4Q@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 10, 2013 at 04:24:38PM +0100, Jens Renner wrote:
> Add device tree binding documentation for the driver in spi/spi-xilinx.c.
> 
> Signed-off-by: Jens Renner <renner-Xf229rFC5gsb1SvskN2V4Q@public.gmane.org>
> ---
> diff --git a/Documentation/devicetree/bindings/spi/spi-xilinx.txt b/Documentation/devicetree/bindings/spi/spi-xilinx.txt
> new file mode 100644
> index 0000000..768a1ea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/spi-xilinx.txt
> @@ -0,0 +1,32 @@
> +Xilinx SPI controller:
> +
> +Required properties:
> +- compatible : Must be "xlnx,axi-1.02.a" or "xlnx,xps-spi-2.00.a"

s/Must be/Should contain/

> +- interrupt-parent : reference to parent interrupt controller

Is this required in all situations? I don't think it is...

> +- interrupts : SPI controller interrupt

Is there a single interrupt:

- interrupts: interrupt-specifier for the SPI controller interrupt.

> +- reg : SPI register location and length

There's a single register? The example looks a bit bigger than that:

- reg: offset and length of the SPI registers.

> +
> +Optional properties:
> +- xlnx,num-ss-bits : # of slave select bits

- xlnx,num-ss-bits: a single u32 cell describing the number of slave
                    select bits.

> +- xlnx,num-transfer_bits : # of data transfer bits (defaults to 8)

Bindings should use '-' rather than '_' in property names, and I don't
see this being used by the driver in mainline. Please fix this:

xlnx,num-transfer-bits: a single u32 cell describing the number of data
                        transfer bits, if not 8.

Why is this needed? I am not familiar with SPI.

> +- xlnx,... : not considered by kernel module

Huh? kernel details shouldn't leak into the dt binding description, but
I can't even tell what this is supposed to mean...

> +		xlnx,family = "spartan6";
> +		xlnx,fifo-exist = <0x1>;
> +		xlnx,instance = "axi_spi_0";

These were not defined. Why are they here?

> +		xlnx,sck-ratio = <0x4>;

This too. Huh?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
