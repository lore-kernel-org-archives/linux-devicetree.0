From: Alexander Aring <alex.aring-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] rpi: add support to enable usb power domain
Date: Mon, 2 Nov 2015 09:46:02 +0100
Message-ID: <20151102084557.GA1342@omega>
References: <1446064810-5064-1-git-send-email-alex.aring@gmail.com>
 <87a8r1pkfz.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87a8r1pkfz.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Oct 29, 2015 at 12:02:24PM -0700, Eric Anholt wrote:
> Alexander Aring <alex.aring-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
> 
> > This patch adds support for RPi several Power Domains and enable support
> > to enable the USB Power Domain when it's not enabled before.
> >
> > This patch based on Eric Anholt's patch to support Power Domains. He had
> > an issue about -EPROBE_DEFER inside the power domain subsystem, this
> > issue was solved by commit <311fa6a> ("PM / Domains: Return -EPROBE_DEFER
> > if we fail to init or turn-on domain").
> >
> > It was tested with barebox and the following scripts before booting
...
> > Third:
> > The barebox regulator doesn't support right now to enable/disable
> > regulators at runtime but I want to bring this mainline in the next
> > days. So you can't check yourself if the above scripts working right
> > now. I describe it here to show you what exactly I tested.
> >
> > changes since Eric Anholts "power domain" patch:
> >  - add for me all known power domains of the RPi, it contains the domains
> >    0 - 9.
> 
> Note: None of the power domain enums other than the ones I'd had in my
> patch are actually connected to anything in the firmware.  I don't think
> we should be adding them, given that.

Okay. Then it makes sense that I still accessing UART and SDHC when I
turn off the power.

In you patch you had SDHC, USB, DSI. Are you sure that SDHC power domain
has any effect, because I don't see any effect and can still access the
sd card.

I using "... firmware from 2015-10-28 17:06".

I would add the power-domains where we have currently an use-case for it
and this USB at the moment. Is this okay for you?

- Alex
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
