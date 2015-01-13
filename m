From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v5 1/3] gpio: Cygnus: define Broadcom Cygnus GPIO binding
Date: Tue, 13 Jan 2015 11:41:01 +0000
Message-ID: <20150113114101.GO12302@n2100.arm.linux.org.uk>
References: <1418342706-14755-2-git-send-email-rjui@broadcom.com>
 <1918116.UxUgDPTmcq@wuerfel>
 <CAAVeFuL2MKRA7YLm_wsyftNy-sxgEYPrmqBm8XTRZQb66YF-qw@mail.gmail.com>
 <1628217.66frkAqHMc@wuerfel>
 <CAAVeFuJhiten-eVLCa2sMG-nsRwjPMiZap8UJM1kNCuRyK-b1w@mail.gmail.com>
 <20141217104428.GV11285@n2100.arm.linux.org.uk>
 <CACRpkdZbGjNecrggrFr_18zjobXMBpkrSjBMAUfyfs2ZCebB0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZbGjNecrggrFr_18zjobXMBpkrSjBMAUfyfs2ZCebB0w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 13, 2015 at 09:06:15AM +0100, Linus Walleij wrote:
> On Wed, Dec 17, 2014 at 11:44 AM, Russell King - ARM Linux
> <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> > On Wed, Dec 17, 2014 at 11:45:01AM +0900, Alexandre Courbot wrote:
> >> Actually we are not that far from being able to do completely without
> >> any GPIO number, and maybe that's what we should aim for. I think the
> >> only remaining offender is the sysfs interface.
> >
> > And that is a user API, and there's lots of users of it (eg, on Raspberry
> > Pi platforms.)  So changing it isn't going to be easy - I'd say that it's
> > impractical.
> >
> > What you're suggesting would be like re-numbering Linux syscalls.
> 
> The problem is that right now if we set the .base of a gpio_chip
> to -1 for dynamic allocation of GPIO numbers and we have more
> than one GPIO chip in the system, the numbers basically depend
> on probe order, and may theoretically even differ between two boots.
> 
> So in these cases preserving the ABI means preserving the
> unpredictability of these assigned numbers or something.
> 
> For the old usecases with a single GPIO controller and a fixed
> base offset of e.g. 0 (which I suspect was implicit in the initial
> design of the subsystem) things work fine as always, it's these new
> dynamic use cases that destabilize the ABI.

Since GPIOs are exported through sysfs into userland by GPIO number,
and we know that there are users of it (see
https://github.com/pilight/wiringX) which hard encode GPIO numbers,
so this is *really* something that we as kernel developers can't
change without breaking such users.

So, what I'm saying is be very careful about moving to a fully
dynamic space: you could end up breaking userspace if you do.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
