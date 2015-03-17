From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: BCM2835: Add a function for doing an rmb() between
 device reads.
Date: Mon, 16 Mar 2015 21:24:41 -0600
Message-ID: <55079E79.6030303@wwwdotorg.org>
References: <1426213936-4139-1-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426213936-4139-1-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/12/2015 08:32 PM, Eric Anholt wrote:
> Stephen Warren was concerned that the rmb() present in the new mailbox
> driver was unnecessary, and after seeing the docs, that it was just so
> surprising that somebody would come along and remove it later.  The
> explanation for the need for the rmb() is long enough that we won't
> want to place it at every callsite.  Make a wrapper with the whole
> explanation in it, so that anyone wondering what's going on sees the
> docs right there.

> diff --git a/include/soc/bcm2835/peripheral-workaround.h b/include/soc/bcm2835/peripheral-workaround.h

> +static inline void bcm2835_peripheral_read_workaround(void)
> +{
> +#ifdef CONFIG_ARCH_BCM2835

Would this header be included if that wasn't defined? Perhaps that'll be
answered by a later patch...

> +	/*
> +	 * The BCM2835 bus is unusual in that it doesn't guarantee
> +	 * ordering between reads from different peripherals (where
> +	 * peripherals roughly correspond to Linux devices).  From
> +	 * BCM2835 ARM Peripherals.pdf, page 7:

Many buses don't guarantee ordering; that's quite common. The issue is
that the CPU then doesn't match up the correct read request and
response, thus causing it to swap the results of read requests. That's
the unusual part. It would be useful to spell that out more explicitly
in this introduction, even though it is called out in the example below.

BTW, the ARM mailing list is linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org not
linux-arm-kernel-u79uwXL29TaiAVqoAR/hOA@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
