From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 4/5] mtd: ofpart: document the lock flag.
Date: Mon, 26 Oct 2015 18:47:05 -0700
Message-ID: <20151027014705.GO13239@google.com>
References: <cover.1439911625.git.hramrach@gmail.com>
 <83fbf31ad895446837f8e01f77a1ff7c63d62251.1439911625.git.hramrach@gmail.com>
 <20151011200412.GF3696@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151011200412.GF3696@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Oct 11, 2015 at 01:04:12PM -0700, Brian Norris wrote:
> On Tue, Aug 18, 2015 at 03:34:08PM -0000, Michal Suchanek wrote:
> > The lock flag of ofpart is undocumented. Add to binding doc.
> 
> Good catch. There are a lot of small corners of very old code that never
> really got reviewed properly, I expect...
> 
> (And the flag looks very odd. Why exactly is it in the partitions?)
> 
> And now that I'm looking further...does this flag even *do* anything?
> AFAICT, it doesn't set the master device flags -- only the partition
> flags. But MTD drivers currently never see the partition flags -- they
> only see the master struct mtd_info. I think the only way anyone could
> observe the effect of this flag is to read the MTD flags from sysfs. And
> that's pretty useless.
> 
> If my understanding is correct, then I'd rather completely remove the
> code that "handles" this flag, rather than codify it in the docs.

I've tested and confirmed: this only sets the flags for the partition
(*NOT* for the master device), so the only visible effect of this
property is to change sysfs flags. I'll send out a patch to kill this
property entirely.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
