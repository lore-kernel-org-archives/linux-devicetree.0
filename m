From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 00/11] ARM: Versatile irq and clock DT support
Date: Thu, 26 Jun 2014 14:52:28 +0200
Message-ID: <CACRpkdZseHTwh7cL_phG51+XefJ-T-oLNkFSbnShfVhCihhWKQ@mail.gmail.com>
References: <1401403221-27523-1-git-send-email-robherring2@gmail.com>
	<CACRpkdZhtAG7ThDvzTi6UBrF=ALd3huHquWQ+t-aaSBZOAfy6g@mail.gmail.com>
	<20140621021044.GC21711@titan.lakedaemon.net>
	<CACRpkdYncrY2Ne2UoayEmYD6cg52umEJ0SgU9ZHO4PretgjWrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYncrY2Ne2UoayEmYD6cg52umEJ0SgU9ZHO4PretgjWrg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 23, 2014 at 1:08 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Sat, Jun 21, 2014 at 4:10 AM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
>> On Fri, May 30, 2014 at 11:41:51AM +0200, Linus Walleij wrote:
>>> On Fri, May 30, 2014 at 12:40 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>
>>> > Linus, This could use testing again on Versatile.
>>>
>>> OK I should probably test on Versatile *and* the Integrators since
>>> these are also affected. Do you have a branch I can pull?
>>
>> Did you get a chance to test this series?
>
> Sadly not yet :-(
>
> I'm snowed under by regressions FTM.

Tested now and it works like a charm on Versatile/AB.

Also sent a Tested-by tag to Rob's pull request.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
