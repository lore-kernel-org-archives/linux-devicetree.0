From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/3] of: Add Panasonic Corporation vendor prefix
Date: Tue, 24 Sep 2013 12:21:05 +0100
Message-ID: <20130924112105.GB32390@e106331-lin.cambridge.arm.com>
References: <1380012714-19073-1-git-send-email-treding@nvidia.com>
 <1380012714-19073-3-git-send-email-treding@nvidia.com>
 <20130924091729.GB31077@e106331-lin.cambridge.arm.com>
 <20130924093027.GC13971@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130924093027.GC13971@ulmo>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 24, 2013 at 10:30:29AM +0100, Thierry Reding wrote:
> On Tue, Sep 24, 2013 at 10:17:29AM +0100, Mark Rutland wrote:
> > On Tue, Sep 24, 2013 at 09:51:54AM +0100, Thierry Reding wrote:
> > > Panasonic is listed as PC on the stock exchange, so use that as the
> > > vendor prefix.
> > 
> > As I suspect this is going to lead to confusion, and there don't seem to
> > be any bindings using this yet, I'd prefer "panasonic" as the vendor
> > prefix.
> 
> There was some discussion a few months back where it was recommended to
> use the stock symbols for vendor prefixes where one existed. According
> to this[0], the symbol for Panasonic Corporation is "PC".

>From discussions I recall, either stock timers or full names are fine,
as long as they didn't change over time there was no real preference. I
do not recall a preference for stock ticker names, but perhaps I missed
something?

My only concern here is that "pc" may get abused elsewhere in bindings
as a prefix, and may lead to general confusion due to other meanings for
"pc". As "panasonic" is clear to any reader without looking in
vendor-prefixes.txt, and there are no panasonic device bidnings using
"pc" as a prefix, I think that "panasonic" is preferable as a vendor
prefix.

Thanks,
Mark.

> 
> Thierry
> 
> [0]: http://www.nyse.com/listed/pc.html


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
