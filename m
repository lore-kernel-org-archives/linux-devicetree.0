From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: Add DT bindings info for FlexRM ring
 manager
Date: Fri, 9 Dec 2016 12:01:32 -0600
Message-ID: <20161209180132.lnpvwybnij5uykuq@rob-hp-laptop>
References: <1480653536-5551-1-git-send-email-anup.patel@broadcom.com>
 <1480653536-5551-3-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480653536-5551-3-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pramod KUMAR <pramod.kumar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Rice <rob.rice-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 02, 2016 at 10:08:56AM +0530, Anup Patel wrote:
> This patch adds device tree bindings document for the FlexRM
> ring manager found on Broadcom iProc SoCs.
> 
> Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>  .../bindings/mailbox/brcm,iproc-flexrm-mbox.txt    | 60 ++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,iproc-flexrm-mbox.txt
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/brcm,iproc-flexrm-mbox.txt b/Documentation/devicetree/bindings/mailbox/brcm,iproc-flexrm-mbox.txt
> new file mode 100644
> index 0000000..e81f116
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/brcm,iproc-flexrm-mbox.txt
> @@ -0,0 +1,60 @@

[...]

> +Example:
> +--------
> +crypto_mbox: mbox@67000000 {
> +	compatible = "brcm,flexrm-mbox";
> +	reg = <0x67000000 0x200000>;
> +	msi-parent = <&gic_its 0x7f00>;
> +	#mbox-cells = <3>;
> +};
> +
> +crypto_client {
> +	...
> +	mboxes = <&crypto_mbox 0 0x1 0xffff>,
> +		 <&crypto_mbox 1 0x1 0xffff>,
> +		 <&crypto_mbox 16 0x1 0xffff>,
> +		 <&crypto_mbox 17 0x1 0xffff>,
> +		 <&crypto_mbox 30 0x1 0xffff>,
> +		 <&crypto_mbox 31 0x1 0xffff>;

The FlexRM part looks fine. I still don't understand what this node is. 
Is this a h/w block or just a list of mailboxes? What determines the 
mailbox channel numbers here? I need to see what the complete node looks 
like.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
