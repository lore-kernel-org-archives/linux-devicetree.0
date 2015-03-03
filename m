From: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/10] dt/bindings: Add binding for BCM2835 mailbox driver
Date: Tue, 3 Mar 2015 08:05:50 +0000
Message-ID: <20150303080550.GF6976@x1>
References: <1425329684-23968-1-git-send-email-eric@anholt.net>
 <1425329684-23968-2-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425329684-23968-2-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 02 Mar 2015, Eric Anholt wrote:

> From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
> 
> v2: Split into a separate patch for submitting to the devicetree list.

When you say that you've split them, do you mean each DT doc, as I
don't think this is the way to go.  I'm happy to listen to other
people's opinions, but I think all of the .../mailbox/brcm,bcm2835-
files should be amalgamated.

>     Consistently start node docs with a capital letter. device's
>     address in the example shouldn't have "0x". Drop machine-specific
>     interrupt numbers from the docs.  (changes by anholt).
> 
> Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
> Signed-off-by: Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>
> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> ---
>  .../devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt b/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt
> new file mode 100644
> index 0000000..f5741a0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt

Rename these files to conform to the current naming convention.  In
-next we currently have 'altera-mailbox.txt' and 'omap-mailbox.txt',
so 'bcm2835-mbox.txt' seems appropriate.

> @@ -0,0 +1,19 @@
> +Broadcom BCM2835 VideoCore mailbox IPC
> +
> +Required properties:
> +
> +- compatible : Should be "brcm,bcm2835-mbox"
> +- reg : Specifies base physical address and size of the registers.
> +- interrupts : The interrupt number. See
> +  bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
> +- #mbox-cells : Specifies the number of cells needed to encode a
> +  mailbox channel. The value shall be 1.

Binding documents are much easier to read if the property names and
descriptions are seperated with tabs.

- compatible		: Should be "brcm,bcm2835-mbox"
- reg			: Specifies base physical address and size of the registers
- interrupts 		: The interrupt number
			  [See ../interrupt-controller/brcm,bcm2835-armctrl-ic.txt]
- #mbox-cells		: Specifies the number of cells needed to encode a
			  mailbox channel. The value shall be 1

... don't you think?  Also notice the consistency of no '.'s and the
bracketing of the [See ...] statement.

> +Example:
> +
> +mailbox: mailbox@7e00b800 {
> +	compatible = "brcm,bcm2835-mbox";
> +	reg = <0x7e00b880 0x40>;
> +	interrupts = <0 1>;
> +	#mbox-cells = <1>;
> +};

It would be good to see the client examples here as well.  Please consider
pulling in brcm,bcm2835-mbox-power.txt and brcm,bcm2835-mbox-property.txt.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
