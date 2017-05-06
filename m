From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 3/3] gpiolib: Add GPIO initialization
Date: Sat, 6 May 2017 22:32:30 +0200
Message-ID: <20170506203230.7ogwvdrzogvvlu67@pengutronix.de>
References: <1440920686-6892-1-git-send-email-mpa@pengutronix.de>
 <1440920686-6892-4-git-send-email-mpa@pengutronix.de>
 <20170207110950.zy5pzo2hq6hrvmr5@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170207110950.zy5pzo2hq6hrvmr5-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Arun Bharadwaj <arun-EiDWdcs9+yZBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, Feb 07, 2017 at 12:09:50PM +0100, Uwe Kleine-König wrote:
> as far as I see, this topic isn't closed yet. I want something similar,
> maybe even a bit more than this patch achieves:
> 
> Some gpios should get a fixed direction. If such a gpio is configured as
> output, a value should be specified. This is already working today with
> gpio-hogs.
> 
> Now additionally I want to initialize some gpios but allow them to be
> grabbed later. IMHO there are the following new cases:
> 
> It should be possible to:
> 
>  a) change the value of a gpio initially configured as output
>  b) change the direction of a gpio initially configured as output
>  c) change the direction of a gpio initially configured as input
> 
> IMHO the dts should describe which case should be applied to a given
> gpio.
> 
> Is it a valid assumption that a gpio that can change direction is also
> allowed to change value when configured as output? I assume this in the
> following discussion, some details need to change if this shouldn't be
> implied. (I think we need a d) then, not sure how this should look
> though.)
> 
> I'd suggest the following description for these cases:
> 
>  a)
>  	/*
> 	 * initially configured as low output. Consumer can do
> 	 * gpio_set_value(..., 1); but not gpio_direction_input(...);
> 	 */
>  	nodename {
> 		gpio-hog;
> 		gpios = <...>;
> 		output-low-init;
> 	};
> 
>  b)
>  	/*
> 	 * initially configured as low output. Consumer can do
> 	 * gpio_set_value(..., 1); and gpio_direction_input(...);
> 	 */
>  	nodename {
> 		gpio-hog;
> 		gpios = <...>;
> 		output-init-low;
> 	};
> 
>  c)
>  	/*
> 	 * initially configured as input. Consumer can do
> 	 * gpio_direction_output(..., ...) and then set the value
> 	 * freely.
> 	 */
> 	 nodename {
> 	 	gpio-hog;
> 		gpios = <...>;
> 		input-init;
> 	};

I thought a bit more about this and the changes that would be necessary
to achieve this:

 - introduce new flags IS_FIXED_DIR and IS_FIXED_VALUE for struct
   gpio_desc::flags and error out accordingly in gpiod_set_direction_*
   and gpiod_set_value respectively. Then we have:

   	- already existing hogs: IS_FIXED_DIR | IS_FIXED_VALUE
	- a) IS_FIXED_DIR
	- b)+c) 0
	- d) (if desired) IS_FIXED_VALUE
 
   d) might need additional bookkeeping to remember the configured value
   when the direction is changed to input.
   These flags must be passed to gpiod_hog, via lflags should work.

 - don't auto-request hogged pins
   Currently hogged pins are not available for consumers to be
   requested. This needs to be changed at least for the three (or four)
   new cases.
   IMHO it is sensible to allow requesting a gpio that is completely
   hogged and just prevent changing direction and (if it's an output)
   value.
   TODO: review places that use IS_REQUESTED for need of adaption
   TODO: race between hog and consumer?

 - teach of_parse_own_gpio about IS_FIXED_DIR and IS_FIXED_VALUE

 - expand gpiolib_dbg_show to show IS_FIXED_DIR and IS_FIXED_VALUE

@Linus: I'd like to have an ok from your side that you like the approach
before working on implementing this. So it would be great if you shared
your thoughts about my ideas.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
