From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: Document Broadcom iProc mailbox
 controller driver
Date: Sat, 21 Jan 2017 14:40:46 -0600
Message-ID: <20170121204046.4trovvzfxdnfevns@rob-hp-laptop>
References: <1484789980-6812-1-git-send-email-jonathan.richardson@broadcom.com>
 <1484789980-6812-2-git-send-email-jonathan.richardson@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1484789980-6812-2-git-send-email-jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Vikram Prakash <vikram.prakash-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 18, 2017 at 05:39:38PM -0800, Jonathan Richardson wrote:

Changelog?

> Reviewed-by: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Tested-by: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Vikram Prakash <vikram.prakash-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Shreesha Rajashekar <shreesha.rajashekar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/mailbox/brcm,iproc-mailbox.txt     | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,iproc-mailbox.txt
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/brcm,iproc-mailbox.txt b/Documentation/devicetree/bindings/mailbox/brcm,iproc-mailbox.txt
> new file mode 100644
> index 0000000..f4c4f96
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/brcm,iproc-mailbox.txt
> @@ -0,0 +1,14 @@
> +* Broadcom's iProc Mailbox Controller
> +
> +Required properties:
> +- compatible: Must be "brcm,iproc-mailbox"
> +- reg: Defines the base address of the mailbox controller.
> +- #mbox-cells: Must be 1.
> +
> +Example:
> +
> +	mailbox: mailbox@03024024 {

Drop the leading 0.

> +		compatible = "brcm,iproc-mailbox";
> +		reg = <0x03024024 0x8>;
> +		#mbox-cells = <1>;
> +	};
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
