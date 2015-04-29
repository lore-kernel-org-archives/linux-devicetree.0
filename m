From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/3 v5] dt/bindings: Add binding for the BCM2835 mailbox
 driver
Date: Tue, 28 Apr 2015 19:30:46 -0600
Message-ID: <55403446.1040207@wwwdotorg.org>
References: <1430173644-19099-2-git-send-email-eric@anholt.net> <1430253868-11138-1-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430253868-11138-1-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/28/2015 02:44 PM, Eric Anholt wrote:
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
> v5: Document that the mailbox cell should be 0 in clients, and add an
>     example of a client (changes by anholt, from review by Jassi).

Some mention of what you changed in the patch might be nice, since it
was originally authored by someone else, and there's quite a changelog.

> diff --git a/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt b/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt

> +- #mbox-cells:	Specifies the number of cells needed to encode a mailbox
> +		  channel. The value shall be 1.  Clients should supply a value
> +		  of 0 for the mailbox channel, because there is only one
> +		  exposed

Can't you use #mbox-cells = <0> if there's no data to provide?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
