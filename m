From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH 4/5 v2] input: tc3589x-keypad: support probing from
 device tree
Date: Mon, 2 Dec 2013 12:54:42 +0100
Message-ID: <20131202115442.GA4725@amd.pavel.ucw.cz>
References: <1384265618-10590-1-git-send-email-linus.walleij@linaro.org>
 <20131112153057.GA9683@earth.universe>
 <CACRpkdb_bryGJo7CKGP5tj3RFGv=Gh+Q5m9ucVKqJ068tjPC2g@mail.gmail.com>
 <20131112200514.GA15413@earth.universe>
 <CACRpkdaAaLjm_b+OLj3tobxBN8YGUcTPnXJ=qtBqd02=FTxhjQ@mail.gmail.com>
 <20131112204013.GA17674@earth.universe>
 <20131113142406.GH21713@e106331-lin.cambridge.arm.com>
 <20131117182852.GC30012@xo-6d-61-c0.localdomain>
 <20131202113720.GF12952@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131202113720.GF12952-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon 2013-12-02 11:37:20, Mark Rutland wrote:
> On Sun, Nov 17, 2013 at 06:28:52PM +0000, Pavel Machek wrote:
> > 
> > > > Thus I guess we should not use the name, which has the most adopters
> > > > in kernel (or out of kernel). Instead the most fitting name should
> > > > be used. Current suggestions (taken from kernel) are:
> > > > 
> > > > * <<vendor>>,no-autorepeat
> > > > * keypad,autorepeat
> > > > * linux,keypad-no-autorepeat
> > > > * linux,input-no-autorepeat
> > > > * linux,no-autorepeat
> > > > * autorepeat
> > > > 
> > > > I do not really care, which one is chosen, except for two things:
> > > > 
> > > > * <<vendor>> seems wrong. This is not vendor specific.
> > > > * I would prefer "input-" over "keypad-", since then the same name
> > > >   can be used for single keys, buttons, etc.
> > > 
> > > Both of those sound valid to me, but I think it may make sense to keep
> > > the "linux," prefix. As I understand it this is really telling the Linux
> > > input subsystem to react to a device acting in a certain way, rather
> > > than describing or configuring the device in a certain way.
> > 
> > I'd say it is very much configuring device in certain way, and yes, other
> > operating systems will want to do autorepeat, too.
> 
> Nothing is handled differently at the device with respect to this flag.
> The Linux input subsystem behaves differently. Thus this is
> configuration of the Linux input subsysytem, not the device.

This flag says "this is device where autorepeat makes sense". It does
make sense for qwerty keyboard, it does not make sense for power
button. There's nothing Linux specific here.

> > I believe we don't want to end up with
> > 
> > linux,input-no-autorepeat
> > bsd,keypad-autorepeat
> > windows-phone,disable-autorepeat
> 
> I do not see a problem with this. This is only as bad as the current

Not a problem? DTS bloat? Code bloat for the drivers? (Because that
way, we'll need to handle "windows-phone,disable-autorepeat" DTS for
compatibility one day).

> situation, but has the benefit that the madness is constrained to
> particular vendor prefixes, which we can uniquely identify and handle
> differently if required.

Madness? We want to avoid madness and improve current situation where
different driver use different attributes.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
