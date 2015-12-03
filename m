From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v9 1/3] dt-bindings: binding for jz4780-{nand,bch}
Date: Thu, 3 Dec 2015 14:38:01 -0800
Message-ID: <20151203223801.GA64180@google.com>
References: <1449144142-24004-1-git-send-email-harvey.hunt@imgtec.com>
 <1449144142-24004-2-git-send-email-harvey.hunt@imgtec.com>
 <20151203213812.GA32235@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151203213812.GA32235@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alex Smith <alex.smith-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 03, 2015 at 03:38:12PM -0600, Rob Herring wrote:
> On Thu, Dec 03, 2015 at 12:02:20PM +0000, Harvey Hunt wrote:
> > v8 -> v9:
> >  - Document that partitions are represented as a child node of a NAND chip.
> 
> Don't multiple flash chips typically get interleaved in order to get 
> parallelism needed for performance? Then the view of the partitions 
> would apply across all chips.

Not in MTD so far. We have mtdconcat to do some combination of flash,
but it's not too easy to use right now. There are also some "MTD RAID"
patches submitted recently that might cover what you're talking about,
but that's brand new and unreviewed, and I don't think anyone has
considered trying to handle partitions for such a thing yet.
Partitioning of this kind isn't even that useful for NAND flash,
actually, since fixed assignment of flash ranges restricts the
flexibility of UBI's wear-leveling algorithms.

It probably makes more sense to deal with UBI volumes instead of MTD
partitions when talking about NAND flash. And those aren't specified in
DT.

> Anyway, it's optional, so:
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
