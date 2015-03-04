From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 02/10] mailbox: Enable BCM2835 mailbox support
Date: Wed, 04 Mar 2015 10:48:44 +0100
Message-ID: <2241453.IVZx9NW1xt@wuerfel>
References: <1425329684-23968-1-git-send-email-eric@anholt.net> <1425329684-23968-3-git-send-email-eric@anholt.net> <54F675F1.60205@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54F675F1.60205-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 03 March 2015 20:03:13 Stephen Warren wrote:
> > +
> > +/*
> > + * Mailbox registers. We basically only support mailbox 0 & 1. We
> > + * deliver to the VC in mailbox 1, it delivers to us in mailbox 0. See
> > + * BCM2835-ARM-Peripherals.pdf section 1.3 for an explanation about
> > + * the placement of memory barriers.
> > + */
> > +#define MAIL0_RD     (ARM_0_MAIL0 + 0x00)
> > +#define MAIL0_POL    (ARM_0_MAIL0 + 0x10)
> > +#define MAIL0_STA    (ARM_0_MAIL0 + 0x18)
> > +#define MAIL0_CNF    (ARM_0_MAIL0 + 0x1C)
> > +#define MAIL1_WRT    (ARM_0_MAIL1 + 0x00)
> 
> That implies there are more mailboxes. I wonder if we should
> parameterize which to use via some DT properties? I guess we can defer
> that though; we can default to the current values and add properties
> later if we want to use something else.

How about changing #mbox-cells to <2> and using the first cell to
identify the mailbox and the second to identify the channel?

The binding isn't very clear on the meaning of the one argument
cell for the mailbox reference, but I assume it's used for the
mailbox channel rather than the mailbox id.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
