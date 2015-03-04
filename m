From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 04/10] dt/bindings: Add binding for BCM2835 mailbox power
 channel driver
Date: Tue, 03 Mar 2015 20:07:55 -0700
Message-ID: <54F6770B.9080808@wwwdotorg.org>
References: <1425329684-23968-1-git-send-email-eric@anholt.net> <1425329684-23968-5-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425329684-23968-5-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/02/2015 01:54 PM, Eric Anholt wrote:
> I was tempted to have the mailbox power channel support just be in the
> 2835 mailbox driver itself, but mbox_request_channel() wants its
> device to have the "mboxes" node, and that appears to be only intended
> for mailbox clients, not controllers.

> diff --git a/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox-power.txt b/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox-power.txt

> +Broadcom BCM2835 VideoCore mailbox power channel IPC
> +
> +Required properties:
> +
> +- compatible : Should be "brcm,bcm2835-mbox-power"
> +- mboxes: Single-entry list which specifies which mailbox controller
> +  and channel is the power channel.
> +
> +Example:
> +
> +mailbox-power {
> +	compatible = "brcm,bcm2835-mbox-power";
> +	mboxes = <&mailbox 0>
> +};

I think the driver for this device should provide its services to other
drivers using some standard in-kernel API (power domains, regulators?),
which in turn would presumably have some subsystem-level DT binding.

So, I would expect this DT node to implement the server-side of that
binding, and probably have a property like "#power-domain-cells = <1>",
and the client nodes to "consume" this service via a property like
"power-domain = <&mbox_power N>" where N is the ID of the client's power
domain within the firmware protocol.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
