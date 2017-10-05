From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 03/22] dt-bindings: arm: scmi: add ARM MHU specific
 mailbox client bindings
Date: Thu, 5 Oct 2017 18:20:31 -0500
Message-ID: <20171005232031.7373ni5ssln4wlpr@rob-hp-laptop>
References: <1506604306-20739-1-git-send-email-sudeep.holla@arm.com>
 <1506604306-20739-4-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1506604306-20739-4-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 28, 2017 at 02:11:27PM +0100, Sudeep Holla wrote:
> This patch adds ARM MHU specific mailbox client bindings to support
> SCMI. Since SCMI specification just requires doorbell mechanism from
> mailbox controllers, we add mailbox data to specify the doorbell bit(s).
> 
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>  .../devicetree/bindings/arm/arm,mhu-scmi.txt          | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,mhu-scmi.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,mhu-scmi.txt b/Documentation/devicetree/bindings/arm/arm,mhu-scmi.txt
> new file mode 100644
> index 000000000000..8c106f1cdeb8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,mhu-scmi.txt
> @@ -0,0 +1,19 @@
> +ARM MHU mailbox client bindings for SCMI Message Protocol
> +----------------------------------------------------------
> +
> +This binding is intended to define the ARM MHU specific extensions to
> +the generic SCMI bindings[2].
> +
> +Required properties:
> +
> +The scmi node with the following properties shall be under the /firmware/ node.
> +
> +- compatible : shall be "arm,scmi" and "arm,mhu-scmi"

Most specific first.

> +- mbox-data : For each phandle listed in mboxes property, an unsigned 32-bit
> +	      data as expected by the mailbox controller

Shouldn't that be cells as part of mboxes property?

> +
> +See [1] for details on all other required/optional properties of the generic
> +mailbox controller and [2] for generic SCMI bindings.
> +
> +[1] Documentation/devicetree/bindings/mailbox/mailbox.txt
> +[2] Documentation/devicetree/bindings/arm/arm,scmi.txt
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
