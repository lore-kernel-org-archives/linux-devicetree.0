From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 05/10] ARM: bcm2835: Add the mailbox power channel driver.
Date: Mon, 02 Mar 2015 22:09 +0100
Message-ID: <2161376.WXTGbypp2V@wuerfel>
References: <1425329684-23968-1-git-send-email-eric@anholt.net> <1425329684-23968-6-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425329684-23968-6-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 02 March 2015 12:54:39 Eric Anholt wrote:
> +/*
> + * Submits a set of concatenated tags to the VPU firmware through the
> + * mailbox power interface.
> + *
> + * The buffer header and the ending tag are added by this function and
> + * don't need to be supplied, just the actual tags for your operation.
> + * See struct bcm_mbox_power_tag_header for the per-tag structure.
> + */
> +static int bcm_mbox_set_power(uint32_t power_enables)
> +{
> +       int ret;
> +
> +       reinit_completion(&mbox_power->c);
> +       ret = mbox_send_message(mbox_power->chan,
> +                               (void *)(power_enables << BCM_MBOX_DATA_SHIFT));
> +       if (ret >= 0)
> +               wait_for_completion(&mbox_power->c);
> +
> +       return ret;
> 

Please don't abuse the pointer argument to send an integer.

Instead, pass a pointer to the data argument as intended. As this
is a recurring problem, we may want to add a different interface
to pass fixed-length inline data, maybe

mbox_send_message_u32(struct mbox_chan *chan, u32 msg);

and possibly add a length argument to the existing mbox_send_message.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
