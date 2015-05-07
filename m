From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH  0/2] gpio: Allow userspace export from DT
Date: Thu, 7 May 2015 13:28:40 +0100
Message-ID: <20150507122840.GB2067@n2100.arm.linux.org.uk>
References: <20150413110515.9681.58848.stgit@localhost>
 <20150504084925.GB4047@localhost>
 <20150506112449.GQ2067@n2100.arm.linux.org.uk>
 <20150506124354.GA5302@localhost>
 <20150506125707.GV2067@n2100.arm.linux.org.uk>
 <20150506132520.GC5302@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150506132520.GC5302@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 06, 2015 at 03:25:20PM +0200, Johan Hovold wrote:
> On Wed, May 06, 2015 at 01:57:08PM +0100, Russell King - ARM Linux wrote:
> > There is *no* "firmware" on these devices.  The only thing you have is a
> > boot loader and a DT blob, and people will hate you if you tell them that
> > they have to change the DT blob and then reboot their systems to change
> > the functionality of a GPIO pin.
> >
> > It's also entirely reasonable to assume that people are going to want to
> > change the configuration at runtime, given their diverse range of
> > applications.
> 
> DT can be changed at run-time using overlays.

Yes, I'm aware of that, but that code is really not nice.  There is no
notification system to drivers that something has changed, and with a
GPIO driver, you really don't want the driver to be unbound and
re-bound just because something changed.  That has the very real
possibility to disrupt users of other GPIOs.

I'm not sure what kind of driver you'd attach userspace GPIO pinctrl
settings to other than the GPIO driver.

Sure, if you're wanting to configure a couple of GPIOs as I2C, then
yes, you certainly should put the binding in the I2C device block in
DT, but you don't always have a device to do that with.

> You also cut out the part in my reply about continuing to allow
> unrestricted access for such cases. That could still continue to be the
> default (e.g. when there are no pin function names defined in DT).

Yes, that's standard Internet email etiquette - cut everything from
the message you're replying to which is not part of the context of the
immediate reply.  I'd include a URL to that, but unfortunately google
seems broken (it's inserting a refresh into the results page which causes
elinks to continually refetch the same page, eventually triggering a
violation of googles terms of use... yea, quite funny that google is
instructing browsers to violate their own terms of use.)

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
