From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mtd: document linux-specific partition parser DT binding
Date: Fri, 23 Oct 2015 11:17:54 +0200
Message-ID: <CACRpkdYboyXQ7tz8gSTafVLJy26E3qLAbcKyjOsEhh8j=3S1bQ@mail.gmail.com>
References: <1444915191-28350-1-git-send-email-linus.walleij@linaro.org>
	<20151015162210.GA4545@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151015162210.GA4545@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Rafa?? Mi??ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 15, 2015 at 6:22 PM, Brian Norris
<computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Are you trying to use this binding, or is this just purely a mechanical
> documentation issue? I ask, because it seems that binding never really
> got reviewed at all, and others have recently tried to extend support
> for it generically [1], but a few objections came up [2][3].

I am using it in this devicetree patch:
http://marc.info/?l=linux-arm-kernel&m=144492610417605&w=2

And this devicetree patch:
http://marc.info/?l=linux-arm-kernel&m=144490455308758&w=2

Otherwise the AFS partition type will not be scanned.

The other option is to add "afs" to this list in
drivers/mtd/maps/physmap_of.c:

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 3e614e9119d5..6233473a55d6 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -110,7 +110,7 @@ static struct mtd_info *obsolete_probe(struct
platform_device *dev,
    default is use. These take precedence over other device tree
    information. */
 static const char * const part_probe_types_def[] = {
-       "cmdlinepart", "RedBoot", "ofpart", "ofoldpart", NULL };
+       "cmdlinepart", "RedBoot", "ofpart", "ofoldpart", "afs", NULL };

I can send a patch like this if you prefer?

> Unfortunately I/we dropped the ball a bit on that thread, but we'd
> ideally like to address those concerns in a new binding that is
> supported for all MTDs, and deprecate the old one. The new one would
> probably not directly use the parser name as used by Linux, but define
> some list of compatible strings that fit DT conventions better. Also, I
> don't want people including things like "cmdlinepart" in DT, but it
> should be available as an override if necessary. IOW, DT shouldn't
> supersede the kernel command line.

This is not for cmdlinepart, as AFS is an actual on-flash format.

> That's not to say we can't document the old one, but I'm curious if
> there are real users. I'd also like to encourage new users to avoid the
> old one if we can make that feasible.

I'm happy to do either patch, or define a new binding if you
prefer, like simply:

partition-type = <string>;

and then we define this as "arm,arm-flash-structure" or something,
and parse that to "afs" internally in physmap_of.c.

>> + - linux,part-probe: a flash partition type to look for, using the
>> +   Linux-internal partition naming scheme, e.g. "afs" for the ARM
>> +   Flash footers.
>
> IIUC, this property actually supports a list of parsers, not just a
> single partition type.

Ah it does. If we wanna go with this patch I'll fix it.

> Also, if we're really going to support this, we should list exactly what
> strings we support. And that's one of the problems with the existing
> binding; it supports any old string Linux supports, which doesn't match
> how we typically want to add bindings (i.e., via proposal + review).

OK that sounds like a case for "arm,arm-flash-structure" for this
specific binding.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
