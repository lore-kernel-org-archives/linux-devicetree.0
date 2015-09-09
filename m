From: Alban <albeu-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v2 2/2] MIPS: ath79: add irq chip ar7240-misc-intc
Date: Wed, 9 Sep 2015 15:54:39 +0200
Message-ID: <20150909155439.11ecab81@avionic-0020>
References: <1441790178-9573-1-git-send-email-lynxis@fe80.eu>
	<1441790178-9573-3-git-send-email-lynxis@fe80.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441790178-9573-3-git-send-email-lynxis-qyMx1GtpvWw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Couzens <lynxis-qyMx1GtpvWw@public.gmane.org>
Cc: Alban <albeu-GANU6spQydw@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed,  9 Sep 2015 11:16:18 +0200
Alexander Couzens <lynxis-qyMx1GtpvWw@public.gmane.org> wrote:

> The ar7240 misc irq chip use ack handler
> instead of ack_mask handler. All new ath79 chips use
> the ar7240 misc irq chip
> 
> Signed-off-by: Alexander Couzens <lynxis-qyMx1GtpvWw@public.gmane.org>
> ---
>  .../interrupt-controller/qca,ath79-misc-intc.txt     | 20 ++++++++++++++++++--
>  arch/mips/ath79/irq.c                                | 10 ++++++++++
>  2 files changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt
> index 391717a..ec96b1f 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt
> @@ -4,8 +4,8 @@ The MISC interrupt controller is a secondary controller for lower priority
>  interrupt.
>  
>  Required Properties:
> -- compatible: has to be "qca,<soctype>-cpu-intc", "qca,ar7100-misc-intc"
> -  as fallback
> +- compatible: has to be "qca,<soctype>-cpu-intc", "qca,ar7100-misc-intc" or
> +  "qca,<soctype>-cpu-intc", "qca,ar7240-misc-intc"
>  - reg: Base address and size of the controllers memory area
>  - interrupt-parent: phandle of the parent interrupt controller.
>  - interrupts: Interrupt specifier for the controllers interrupt.
> @@ -13,6 +13,9 @@ Required Properties:
>  - #interrupt-cells : Specifies the number of cells needed to encode interrupt
>  		     source, should be 1
>  
> +Compatible fallback depends on the SoC. Use ar7100 for ar71xx and ar913x,
> +use ar7240 for all other SoCs.
> +
>  Please refer to interrupts.txt in this directory for details of the common
>  Interrupt Controllers bindings used by client devices.
>  
> @@ -28,3 +31,16 @@ Example:
>  		interrupt-controller;
>  		#interrupt-cells = <1>;
>  	};
> +
> +Another example:
> +
> +	interrupt-controller@18060010 {
> +		compatible = "qca,ar9331-misc-intc", qca,ar7240-misc-intc";
> +		reg = <0x18060010 0x4>;
> +
> +		interrupt-parent = <&cpuintc>;
> +		interrupts = <6>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +	};
> diff --git a/arch/mips/ath79/irq.c b/arch/mips/ath79/irq.c
> index c9c0124..fd58f8b 100644
> --- a/arch/mips/ath79/irq.c
> +++ b/arch/mips/ath79/irq.c
> @@ -319,6 +319,16 @@ static int __init ar7100_misc_intc_of_init(
>  IRQCHIP_DECLARE(ar7100_misc_intc, "qca,ar7100-misc-intc",
>  		ar7100_misc_intc_of_init);
>  
> +static int __init ar7240_misc_intc_of_init(
> +	struct device_node *node, struct device_node *parent)
> +{
> +	ath79_misc_irq_chip.irq_ack = ar724x_misc_irq_ack;
> +	return ath79_misc_intc_of_init(node, parent);
> +}
> +
> +IRQCHIP_DECLARE(ar7240_misc_intc, "qca,ar7240-misc-intc",
> +		ar7240_misc_intc_of_init);
> +
>  static int __init ar79_cpu_intc_of_init(
>  	struct device_node *node, struct device_node *parent)
>  {

Acked-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
