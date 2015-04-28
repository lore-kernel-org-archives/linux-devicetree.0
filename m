From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3 v4] dt/bindings: Add binding for the BCM2835 mailbox driver
Date: Tue, 28 Apr 2015 10:51:49 +0530
Message-ID: <CABb+yY0JX0G2E5UNaNbtzG7GFY8Xi3wnLK+h8Pmf0uf6NrfzcQ@mail.gmail.com>
References: <1430173644-19099-1-git-send-email-eric@anholt.net>
	<1430173644-19099-2-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430173644-19099-2-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 28, 2015 at 3:57 AM, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:
> From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
>
> Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
> Signed-off-by: Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>
> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> ---
>
> v2: Split into a separate patch for submitting to the devicetree list.
>     Consistently start node docs with a capital letter. device's
>     address in the example shouldn't have "0x". Drop machine-specific
>     interrupt numbers from the docs.  (changes by anholt).
>
> v3: Move the file to just bcm2835-mbox.txt, clean up formatting
>     (changes by anholt, from review by Lee Jones).
>
> v4: Move file back by consensus from various Broadcom platform
>     maintainers (changes by anholt, acked by Lee Jones).
>
>  .../devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt
>
> diff --git a/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt b/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt
> new file mode 100644
> index 0000000..0bb2b9d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt
> @@ -0,0 +1,19 @@
> +Broadcom BCM2835 VideoCore mailbox IPC
> +
> +Required properties:
> +
> +- compatible:  Should be "brcm,bcm2835-mbox"
> +- reg:         Specifies base physical address and size of the registers
> +- interrupts:  The interrupt number
> +                 See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
> +- #mbox-cells: Specifies the number of cells needed to encode a mailbox
> +                 channel. The value shall be 1
>
Probably also specify what that one-cell value would stand for.

> +
> +Example:
> +
> +mailbox: mailbox@7e00b800 {
> +       compatible = "brcm,bcm2835-mbox";
> +       reg = <0x7e00b880 0x40>;
> +       interrupts = <0 1>;
> +       #mbox-cells = <1>;
> +};
Usually it comes with an example user node as well.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
