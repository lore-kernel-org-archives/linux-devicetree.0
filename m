From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 00/13] mtd: st_spi_fsm: Align with ST's internal
 development
Date: Thu, 5 Feb 2015 17:59:17 -0800
Message-ID: <20150206015917.GA18140@ld-irv-0074>
References: <1418644760-18773-1-git-send-email-lee.jones@linaro.org>
 <20150113051452.GR9759@ld-irv-0074>
 <20150121124930.GA22024@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150121124930.GA22024@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 21, 2015 at 12:49:30PM +0000, Lee Jones wrote:
> On Mon, 12 Jan 2015, Brian Norris wrote:
> > Typically "simpler" and "reducing the cost of having lots of extra DT
> > properties" aren't good enough reasons for immediately breaking an
> > existing DT binding. We usually expect to support both for some period
> > of time.
> 
> Only once a binding has became ABI.  As there are no users of this
> driver yet (this will change after this sync'ing patch-set has been
> applied), so we can safely consider this binding to be in-progress and
> as such, not yet ABI, thus we can do this ol' switch-aroo without the
> usual 6 month deprecation period.

OK, fine with me.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
