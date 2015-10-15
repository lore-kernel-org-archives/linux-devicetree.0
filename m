From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH] mtd: document linux-specific partition parser DT binding
Date: Thu, 15 Oct 2015 11:04:28 -0600
Message-ID: <20151015170428.GA9250@obsidianresearch.com>
References: <1444915191-28350-1-git-send-email-linus.walleij@linaro.org>
 <20151015162210.GA4545@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151015162210.GA4545@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Rafa?? Mi??ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 15, 2015 at 09:22:10AM -0700, Brian Norris wrote:

> Are you trying to use this binding, or is this just purely a mechanical
> documentation issue? I ask, because it seems that binding never really
> got reviewed at all, and others have recently tried to extend
> support

I wrote it before ARM started down the DT direction and all these
formalities were developed.

> That's not to say we can't document the old one, but I'm curious if
> there are real users. I'd also like to encourage new users to avoid the
> old one if we can make that feasible.

We continue to use it here, there is just no way to autodetect flash
partition layouts. I'm not fussed about having to change to something
else in future.

The reason the original patch exposed the cmdline parser is because
that is how the internal mechanisms work - but realistically, the
cmdline parser is a hack to get around the lack of DT partition
description. If the DT can describe the partitions it should supersede
and obsolete the old command line hack. IMHO

> Also, if we're really going to support this, we should list exactly what
> strings we support. And that's one of the problems with the existing
> binding; it supports any old string Linux supports, which doesn't match
> how we typically want to add bindings (i.e., via proposal + review).

That is why it is prefixed with linux, the review of the part parser name is
the responsibility of the MTD crew, not the DT folks.

bcm47xxpart seems like a terrible name for a partition scheme. Really,
almost any scheme can be used on any SOC, naming a partition parser
after a SOC family makes very little sense to me..

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
