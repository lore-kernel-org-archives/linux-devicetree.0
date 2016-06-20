From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Mon, 20 Jun 2016 10:05:03 -0700
Message-ID: <20160620170503.GA33122@google.com>
References: <20160619130514.GB820@makrotopia.org>
 <20160619214820.GB1222@makrotopia.org>
 <c00ff150-9197-7bcf-8ea7-7ebba979d058@hauke-m.de>
 <6411961.soYuJ4Ixfs@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6411961.soYuJ4Ixfs@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

I'll take a moment to hijack this and solicit comments on this old
thread:

On Mon, Jun 20, 2016 at 10:09:50AM +0200, Arnd Bergmann wrote:
> - MTD partitioning unfortunately does not seem to have a widely used
>   method for identifying partitions from what's stored on the flash,
>   unlike block devices, so whatever we normally have in the partition
>   table has to be stored in DT. This really sucks, but I don't know
>   what else to do about it.

I got sidetracked, but I have attempted previously to at least diminish
the amount of MTD partitioning info that is stuck into DT:

http://lists.infradead.org/pipermail/linux-mtd/2015-December/064076.html

That series effectively accepts the fact that there isn't a single
standard or widely used method for identifying partitions, but it does
allow for a description that's at least more flexible than a static list
of partitions. I'd appreciate any thoughts on that. The main factors
that stalled that were that (a) there was some vague discomfort over the
use of the "compatible" property (I could probably have argued my case
better there) and (b) I didn't have more time to pursue that. I may pick
this up again when I get some time, especially if there are constructive
suggestions.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
