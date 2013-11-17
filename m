From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH 4/5 v2] input: tc3589x-keypad: support probing from
 device tree
Date: Sun, 17 Nov 2013 19:28:45 +0100
Message-ID: <20131117182845.GB30012@xo-6d-61-c0.localdomain>
References: <1384265618-10590-1-git-send-email-linus.walleij@linaro.org>
 <20131112153057.GA9683@earth.universe>
 <CACRpkdb_bryGJo7CKGP5tj3RFGv=Gh+Q5m9ucVKqJ068tjPC2g@mail.gmail.com>
 <20131112200514.GA15413@earth.universe>
 <CACRpkdaAaLjm_b+OLj3tobxBN8YGUcTPnXJ=qtBqd02=FTxhjQ@mail.gmail.com>
 <20131112204013.GA17674@earth.universe>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131112204013.GA17674-SfvFxonMDyemK9LvCR3Hrw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi!

> > > I could find two boards using "gpio-matrix-keypad" in the mainline
> > > kernel and not a single instance of "linux,no-autorepeat":
> > 
> > In things connected to GPIO, I don't expect the in-kernel
> > device trees to be a good way so survey the usage of these
> > bindings. Anyone doing device trees on any system with a
> > few GPIOs can be using this.
> > 
> > But maybe we're lucky and won't break anyone's setup if
> > we change this?
> 
> AFAIK Device Tree property names are considered as ABI, so existing
> property names must not be removed.
> 
> But I guess we can add the standardized property name in addition
> to the deprecated one. New drivers can use the standardized property
> name from the beginning.
> 
> Thus I guess we should not use the name, which has the most adopters
> in kernel (or out of kernel). Instead the most fitting name should
> be used. Current suggestions (taken from kernel) are:
> 
> * <<vendor>>,no-autorepeat
> * keypad,autorepeat
> * linux,keypad-no-autorepeat
> * linux,input-no-autorepeat
> * linux,no-autorepeat
> * autorepeat
> 
> I do not really care, which one is chosen, except for two things:
> 
> * <<vendor>> seems wrong. This is not vendor specific.
> * I would prefer "input-" over "keypad-", since then the same name
>   can be used for single keys, buttons, etc.

Hmm, and it is not Linux-specific, either. So can we stick with simple "autorepeat"?


-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
