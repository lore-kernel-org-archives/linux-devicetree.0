From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC] pwm-backlight: Allow backlight to remain disabled on boot
Date: Thu, 07 Aug 2014 18:30:47 +0900
Message-ID: <009e01cfb222$4555d940$d0018bc0$%han@samsung.com>
References: <1406806970-12561-1-git-send-email-thierry.reding@gmail.com>
 <20140731115429.GA12627@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20140731115429.GA12627@ulmo>
Content-language: ko
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Thierry Reding' <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Bryan Wu' <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Lee Jones' <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: 'Rob Herring' <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, 'Mark Rutland' <mark.rutland-5wv7dgnIgG8@public.gmane.org>, 'Pawel Moll' <pawel.moll-5wv7dgnIgG8@public.gmane.org>, 'Ian Campbell' <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, 'Kumar Gala' <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, 'Jean-Christophe Plagniol-Villard' <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, 'Tomi Valkeinen' <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, 'Russell King' <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, 'Eric Miao' <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Ajay Kumar' <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday, July 31, 2014 8:55 PM, Thierry Reding wrote:
> On Thu, Jul 31, 2014 at 01:42:50PM +0200, Thierry Reding wrote:
> [...]
> > @@ -317,6 +319,12 @@ static int pwm_backlight_probe(struct platform_device *pdev)
> >  	}
> >
> >  	bl->props.brightness = data->dft_brightness;
> > +
> > +	if (data->boot_off)
> > +		bl->props.power = FB_BLANK_POWERDOWN;
> > +	else
> > +		bl->props.power = FB_BLANK_UNBLANK;
> > +
> >  	backlight_update_status(bl);
> 
> Looking at this again, perhaps a more sensible thing to do would be to
> not call backlight_update_status() in the first place. For example if
> the board defines that backlight should be kept off at boot, but the
> bootloader had already enabled it, then this would effectively turn off
> the backlight again.

(+cc Ajay Kumar)

Personally, I prefer not to call backlight_update_status(), when the
backlight was already turned on by bootloader. Also, it would be better
for subsystems such as DRM to handle the power of panel.

> 
> I think it's safe to assume that if the bootloader sets up the backlight
> then it would also set up the display. Therefore not touching the
> backlight state at all at probe time seems like the safest default.
> 
> Of course that doesn't help people who use some dumb framebuffer driver
> and therefore nothing explicitly enables the backlight. So it would
> still be changing behaviour for people for whom the bootloader doesn't
> set up the backlight at all and who therefore rely on the kernel to turn
> it on.
> 
> We could perhaps alleviate that pain a little by making this dependent
> on whether or not the board is booted using DT on the assumption that
> anything that uses DT would be "modern" enough to provide a means to
> automatically enable the backlight at the right moment.

I also agree with the way to use DT.

Best regards,
Jingoo Han

> 
> Thierry

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
