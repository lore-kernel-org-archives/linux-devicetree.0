From: One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Subject: Re: [PATCH 3/3] TTY/slave: add driver for w2sg0004 GPS
Date: Thu, 11 Dec 2014 23:11:00 +0000
Message-ID: <20141211231100.05782a30@lxorguk.ukuu.org.uk>
References: <20141211214801.4127.93914.stgit@notabene.brown>
	<20141211215944.4127.57146.stgit@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141211215944.4127.57146.stgit-wvvUuzkyo1EYVZTmpyfIwg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, NeilBrown <neil-+NVA1uvv1dVBDLzU/O5InQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> +w2sg0004 UART-attached GPS receiver
> +

I'm wondering why it's tied to the w2sg0004


> +struct w2sg_data {
> +	int		gpio;
> +	int		irq;	/* irq line from RX pin when pinctrl
> +				 * set to 'idle' */
> +	struct regulator *reg;
> +
> +	unsigned long	last_toggle;	/* jiffies when last toggle completed. */
> +	unsigned long	backoff;	/* jiffies since last_toggle when
> +					 * we try again
> +					 */
> +	enum {Idle, Down, Up} state;	/* state-machine state. */
> +	bool		requested, is_on;
> +	bool		suspended;
> +	bool		reg_enabled;
> +
> +	struct delayed_work work;
> +	spinlock_t	lock;
> +	struct device	*dev;
> +
> +	struct rfkill	*rfkill;

So its
- a regulator (optional)
- an irq (optional)
- a gpio  (could be optional)
- an optional rfkill
- a pulse time (10ms fixed)
- a backoff time (1 second fixed)


It looks identical to half a dozen other widgets that are found in
Android phones. Would it perhaps be better to make the tiny tweaks to
make it generic

- make the timers configurable
- make the pulse time or high/low selectable for on/off
- make the gpio optional

and just have one driver with the right DT for all similar devices?

Am I missing some w2sg004 specific bits here ?


I think the general model is right, and there will be other slaves that
don't fit the pattern but I do think this one could be generalised.

Alan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
