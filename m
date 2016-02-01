From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/3] Documentation: gpio: Update description for
 X-Gene standby GPIO controller DTS binding
Date: Mon, 1 Feb 2016 09:35:02 -0600
Message-ID: <20160201153502.GA19725@rob-hp-laptop>
References: <1454041735-8434-1-git-send-email-qnguyen@apm.com>
 <1454041735-8434-3-git-send-email-qnguyen@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1454041735-8434-3-git-send-email-qnguyen-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Quan Nguyen <qnguyen-qTEPVZfXA3Y@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Y Vo <yvo-qTEPVZfXA3Y@public.gmane.org>, Phong Vo <pvo-qTEPVZfXA3Y@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>, Duc Dang <dhdang-qTEPVZfXA3Y@public.gmane.org>, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 29, 2016 at 11:28:54AM +0700, Quan Nguyen wrote:
> Update description for X-Gene standby GPIO controller DTS binding to
> support GPIO line configuration as input, output or external IRQ pin.
> 
> Signed-off-by: Y Vo <yvo-qTEPVZfXA3Y@public.gmane.org>
> Signed-off-by: Quan Nguyen <qnguyen-qTEPVZfXA3Y@public.gmane.org>
> ---
>  .../devicetree/bindings/gpio/gpio-xgene-sb.txt     | 47 ++++++++++++++++++----
>  1 file changed, 40 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt b/Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt
> index dae1300..7b8b4cb 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt
> @@ -1,10 +1,20 @@
>  APM X-Gene Standby GPIO controller bindings
>  
> -This is a gpio controller in the standby domain.
> -
> -There are 20 GPIO pins from 0..21. There is no GPIO_DS14 or GPIO_DS15,
> -only GPIO_DS8..GPIO_DS13 support interrupts. The IRQ mapping
> -is currently 1-to-1 on interrupts 0x28 thru 0x2d.
> +This is a gpio controller in the standby domain. It also supports interrupt in
> +some particular pins which are sourced to its parent interrupt controller
> +as diagram below:
> +                           +-----------------+
> +                           | X-Gene standby  |
> +                           | GPIO controller +--------- GPIO_0
> ++------------+             |                 | ...
> +| Parent IRQ |             |                 +--------- GPIO_8/EXT_INT_0
> +| controller |  EXT_INT_0  |                 | ...
> +| (GICv2)    +-------------+                 +--------- GPIO_[N+8]/EXT_INT_N
> +|            |  ...        |                 |
> +|            |  EXT_INT_N  |                 +--------- GPIO_[N+9]
> +|            +-------------+                 | ...
> +|            |             |                 +--------- GPIO_MAX
> ++------------+             +-----------------+
>  
>  Required properties:
>  - compatible: "apm,xgene-gpio-sb" for the X-Gene Standby GPIO controller
> @@ -15,10 +25,18 @@ Required properties:
>  		0 = active high
>  		1 = active low
>  - gpio-controller: Marks the device node as a GPIO controller.
> -- interrupts: Shall contain exactly 6 interrupts.
> +- interrupts: The EXT_INT_0 parent interrupt resource must be listed first.
> +- interrupt-parent: Phandle of the parent interrupt controller.
> +- interrupt-cells: Should be two.
> +       - first cell is 0-N coresponding for EXT_INT_0 to EXT_INT_N.
> +       - second cell is used to specify flags.
> +- interrupt-controller: Marks the device node as an interrupt controller.
> +- apm,nr-gpios: Optional, specify number of gpios pin.
> +- apm,nr-irqs: Optional, specify number of interrupt pins.

When is this not 6?

> +- apm,irq-start: Optional, specify lowest gpio pin support interrupt.

What determines this value? What value is assumed if not present?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
