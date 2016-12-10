From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [RFC PATCH] ARM: dts: Add support for Turris Omnia
Date: Sat, 10 Dec 2016 09:16:04 +0100
Message-ID: <20161210081604.GA8273@xo-6d-61-c0.localdomain>
References: <1479851991.26813.2@smtp.gmail.com>
 <1479859770-9375-1-git-send-email-tmshlvck@gmail.com>
 <20161123003505.GL2691@lunn.ch>
 <4e3f9628-dbf8-27c1-abea-d0ef58a67e51@kleine-koenig.org>
 <20161124150700.GD7155@lunn.ch>
 <1480078151.381.4@smtp.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480078151.381.4-TAvD023jEQEN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomas Hlavacek <tmshlvck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

> >Yes. That is fine. It is just unusual. Most boards have gpio-led and
> >gpio-keys, which are easy to add. That is why i asked. Adding an LED
> >driver which talks to this M0 can be added later.
> 
> Actually the WiP driver for MCU LED interface, that we use in our
> kernel is here: https://github.com/tmshlvck/omnia-linux/commit/2121afd8fbd2e4c720edcdd472b11b5303bc0dfb
> 
> It definitely needs some cleanup and it adds non-standard features
> (main PWM for all LEDs, autonomous blink mode, colors) via custom
> /sys files, which I suspect that is not going to be acceptable for
> upstream. Let's keep it for the next iteration.

Actually, LEDs that can do PWM intensity on their own are common and
supported.

LEDs that can do PWM pretty advanced patterns are common in the cellphones,
as is the color. Unfortunately, good support in kernel is missing. It
would be good to change that.

In n900, I have a LED that can compute prime numbers then blink them,
autonomously. We probably don't need to support _that_, but common
support for patterns would be good.

Best regards,
								Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
