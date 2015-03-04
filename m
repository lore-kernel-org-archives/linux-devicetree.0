From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 05/10] ARM: bcm2835: Add the mailbox power channel driver.
Date: Tue, 03 Mar 2015 20:15:17 -0700
Message-ID: <54F678C5.6090203@wwwdotorg.org>
References: <1425329684-23968-1-git-send-email-eric@anholt.net> <1425329684-23968-6-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425329684-23968-6-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/02/2015 01:54 PM, Eric Anholt wrote:
> This just enables the power to the USB controller, so that DWC2 can
> initialize.
> 
> The downstream tree has an interface to this channel for tracking
> enables from multiple clients, except it doesn't have any clients as
> far as I can see.  For now, just make the simplest thing that gets USB
> working.

>  drivers/mailbox/Makefile                |   1 +
>  drivers/mailbox/bcm2835-mailbox-power.c | 127 ++++++++++++++++++++++++++++++++

Along the lines of my comments on the previous patch, I would expect
this driver to show up within the directory for the subsystem/API that
it implements (power domains, regulators?)

> diff --git a/drivers/mailbox/bcm2835-mailbox-power.c b/drivers/mailbox/bcm2835-mailbox-power.c

> +#define BCM_POWER_USB (1 << 3)

I'd expect that to be encoded in DT, in the manner I mentioned in reply
to patch 4, so that this driver can work for arbitrary clients.

> +#define BCM_MBOX_DATA_SHIFT 4

I'd expect that to be defined in some public header that's part of patch
2, so that clients don't have to duplicate the definition.

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
> +	int ret;
> +
> +	reinit_completion(&mbox_power->c);
> +	ret = mbox_send_message(mbox_power->chan,
> +				(void *)(power_enables << BCM_MBOX_DATA_SHIFT));
> +	if (ret >= 0)
> +		wait_for_completion(&mbox_power->c);
> +
> +	return ret;
> +}

The comment sounds more like the property mailbox interface/channel,
whereas the code appears to be using the non-property channel. In
particular, the code only appears to be sending one "tag"/message,
without the header or ending tag mentioned in the comment.

> +static int bcm2835_mbox_power_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int ret = 0;
> +
> +	mbox_power = devm_kzalloc(dev, sizeof(*mbox_power),
> +				       GFP_KERNEL);
> +	if (!mbox_power) {
> +		dev_err(dev, "Failed to allocate device memory\n");

Duplicate error message.

> +	/* Enable power to the USB phy. */
> +	if (IS_ENABLED(CONFIG_USB_DWC2)) {
> +		bcm_mbox_set_power(BCM_POWER_USB);
> +		bcm2835_mbox_power_initialized = true;
> +	}

Hmm. Shouldn't the DWC2 driver make a call to do that?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
