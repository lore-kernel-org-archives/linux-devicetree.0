From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V7 2/6] mtd: partitions: remove sysfs files when deleting
 all master's partitions
Date: Fri, 23 Jun 2017 10:57:35 -0700
Message-ID: <20170623175735.GA55942@google.com>
References: <20170526131415.27186-1-zajec5@gmail.com>
 <20170621062647.6072-1-zajec5@gmail.com>
 <20170621062647.6072-3-zajec5@gmail.com>
 <20170622210533.GD14148@google.com>
 <CACna6rw3B5=48qbRK+vQ1gsxsZtCtJfNa=kORZY6FrCko5PJFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACna6rw3B5=48qbRK+vQ1gsxsZtCtJfNa=kORZY6FrCko5PJFg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, Dan Ehrenberg <dehrenberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 22, 2017 at 11:40:47PM +0200, Rafał Miłecki wrote:
> On 22 June 2017 at 23:05, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Side note: this patch series sort of massages the definition of this
> > "offset" file. Now, IIUC, subpartitions will have an "offset" file
> > relative to their parent partition, not the master flash device. I'm not
> > sure which way is expected.
> 
> I didn't think about this. I should be able to easily get an absolute
> offset if needed (a simple recursion), but I'm not sure what behavior
> is actually expected. Since we use a tree struct in the sysfs now,
> maybe relative offsets are actually correct ones?

Yeah, that seems OK to me. The only holdup is that the current
description uses the term "master", where perhaps it should just mean
say "parent" now:

Documentation/ABI/testing/sysfs-class-mtd:

What:           /sys/class/mtd/mtdX/offset
Date:           March 2015
KernelVersion:  4.1
Contact:        linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Description:
                For a partition, the offset of that partition from the start
                of the master device in bytes. This attribute is absent on
                main devices, so it can be used to distinguish between
                partitions and devices that aren't partitions.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
