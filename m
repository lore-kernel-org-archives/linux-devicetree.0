From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 09/10] ARM: bcm2835: Add the mailbox property channel
 driver.
Date: Tue, 03 Mar 2015 21:00:18 -0700
Message-ID: <54F68352.5080108@wwwdotorg.org>
References: <1425329684-23968-1-git-send-email-eric@anholt.net> <1425329684-23968-10-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425329684-23968-10-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/02/2015 01:54 PM, Eric Anholt wrote:
> Many of the operations with the firmware are done through this mailbox
> channel pair with a specific packet format.  Notably, it's used for
> clock control, which is apparently not actually totally possible to do
> from the ARM side (some regs aren't addressable).  I need clock
> control for the VC4 DRM driver, to turn on the 3D engine.

> diff --git a/drivers/mailbox/bcm2835-mailbox-property.c b/drivers/mailbox/bcm2835-mailbox-property.c
> +int bcm_mbox_property(void *data, size_t tag_size)

> +	buf = dma_alloc_coherent(NULL, PAGE_ALIGN(size), &bus_addr, GFP_ATOMIC);
> +	if (!buf)
> +		return -ENOMEM;

Can't the driver (this one or the client) maintain some persistent
buffer rather than allocating/freeing a new one each time. It seems like
the alloc/free might introduce quite some overhead?

> +	writel(size, buf);
> +	writel(bcm_mbox_status_request, buf + 4);
> +	memcpy_toio(buf + 8, data, tag_size);
> +	writel(bcm_mbox_property_end, buf + size - 4);

Since this is just a regular chunk of RAM, can't the code just use
regular memory writes and memcpy()?

> +static int bcm2835_mbox_property_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int ret = 0;
> +
> +	mbox_property = devm_kzalloc(dev, sizeof(*mbox_property),
> +				       GFP_KERNEL);
> +	if (!mbox_property) {
> +		dev_err(dev, "Failed to allocate device memory\n");

Duplicate error message.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
