From: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4 v3] dt/bindings: Add binding for BCM2835 mailbox
 driver
Date: Tue, 17 Mar 2015 17:27:58 +0000
Message-ID: <20150317172758.GC3318@x1>
References: <1426213936-4139-1-git-send-email-eric@anholt.net>
 <1426213936-4139-2-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426213936-4139-2-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 12 Mar 2015, Eric Anholt wrote:

> From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
> 
> Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
> Signed-off-by: Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>
> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> ---
> 
> 
> v2: Split into a separate patch for submitting to the devicetree list.
>     Consistently start node docs with a capital letter. device's
>     address in the example shouldn't have "0x". Drop machine-specific
>     interrupt numbers from the docs.  (changes by anholt).
> 
> v3: Move the file to just bcm2835-mbox.txt, clean up formatting
>     (changes by anholt, from review by Lee Jones).

Thanks for fixing up.

> .../devicetree/bindings/mailbox/bcm2835-mbox.txt      | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/bcm2835-mbox.txt

I don't see any unruliness or causes of controversy.

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> diff --git a/Documentation/devicetree/bindings/mailbox/bcm2835-mbox.txt b/Documentation/devicetree/bindings/mailbox/bcm2835-mbox.txt
> new file mode 100644
> index 0000000..0bb2b9d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/bcm2835-mbox.txt
> @@ -0,0 +1,19 @@
> +Broadcom BCM2835 VideoCore mailbox IPC
> +
> +Required properties:
> +
> +- compatible:	Should be "brcm,bcm2835-mbox"
> +- reg:		Specifies base physical address and size of the registers
> +- interrupts:	The interrupt number
> +		  See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
> +- #mbox-cells:	Specifies the number of cells needed to encode a mailbox
> +		  channel. The value shall be 1
> +
> +Example:
> +
> +mailbox: mailbox@7e00b800 {
> +	compatible = "brcm,bcm2835-mbox";
> +	reg = <0x7e00b880 0x40>;
> +	interrupts = <0 1>;
> +	#mbox-cells = <1>;
> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
