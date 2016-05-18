From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] drivers: nvmem: atmel-secumod: New driver for Atmel
 Secumod nvram
Date: Wed, 18 May 2016 11:42:59 -0500
Message-ID: <20160518164259.GA28954@rob-hp-laptop>
References: <alpine.LNX.2.00.1605121505320.21379@nippy.intranet>
 <1463429830-20539-1-git-send-email-davidm@egauge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1463429830-20539-1-git-send-email-davidm-haPfTeumbwasTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Mosberger-Tang <davidm-haPfTeumbwasTnJN9+BGXg@public.gmane.org>
Cc: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, May 16, 2016 at 02:17:10PM -0600, David Mosberger-Tang wrote:
> Signed-off-by: David Mosberger <davidm-haPfTeumbwasTnJN9+BGXg@public.gmane.org>
> ---
>  .../devicetree/bindings/nvmem/atmel-secumod.txt    |  46 ++++++++
>  drivers/nvmem/atmel-secumod.c                      | 125 +++++++++++++++++++++
>  2 files changed, 171 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/atmel-secumod.txt
>  create mode 100644 drivers/nvmem/atmel-secumod.c
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/atmel-secumod.txt b/Documentation/devicetree/bindings/nvmem/atmel-secumod.txt
> new file mode 100644
> index 0000000..85db709
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/atmel-secumod.txt
> @@ -0,0 +1,46 @@
> += Atmel Secumod device tree bindings =
> +
> +This binding is intended to represent Atmel's Secumod which is found
> +in SAMA5D2 and perhaps others.
> +
> +Required properties:
> +- compatible: should be "atmel,sama5d2-secumod"
> +- reg: Should contain registers location and length of the RAM, followed

registers or RAM location?

"Should contain RAM location and length, ..."

> +       by register location and length of the Secumod controller.
> +
> += Data cells =
> +Are child nodes of secumod, bindings of which as described in
> +bindings/nvmem/nvmem.txt
> +
> +Example:
> +
> +    secumod@fc040000 {
> +            compatible = "atmel,sama5d2-secumod";
> +            reg = <0xf8044000 0x1420
> +                   0xfc040000 0x4000>;

You are missing ranges property.

> +            status = "okay";
> +
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +
> +            secram_auto_erasable@0000 {

Use '-' rather than '_' and drop leading 0s.

> +                    reg = <0x0000 0x1000>;
> +            };
> +            secram@1000 {
> +                    reg = <0x1000 0x400>;
> +            };
> +            ram@1400 {
> +                    reg = <0x1400 0x20>;
> +            };
> +    };
> +
> += Data consumers =
> +Are device nodes which consume nvmem data cells.
> +
> +For example:
> +
> +	ram {
> +		...
> +		nvmem-cells = <&ram>;
> +		nvmem-cell-names = "RAM";
> +	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
