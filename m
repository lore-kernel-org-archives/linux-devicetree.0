From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: Strange location and name for platform  devices when device-tree
 is used.
Date: Fri, 1 Nov 2013 13:48:53 -0700
Message-ID: <20131101204853.GB19662@kroah.com>
References: <20131101145925.66e22f73@notabene.brown>
 <1383279744.28909.26.camel@pasglop>
 <1383280054.28909.30.camel@pasglop>
 <20131101160329.37f3707b@notabene.brown>
 <1383282516.28909.36.camel@pasglop>
 <20131101180459.81793C40A28@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131101180459.81793C40A28-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 01, 2013 at 11:04:59AM -0700, Grant Likely wrote:
> Second, I expect there is going to be userspace breakage to move them.
> I've considered moving them before, but so far have felt that being
> tidier hasn't been worth the potential breakage. Userspace /shouldn't/
> be relying on the node name, but we all know that userspace always does
> what it should, right?

Userspace should _never_ rely on where in the /sys/devices/ tree a
device is, if so, it's _really_ broken.  They should be iterating and
getting to the device from within the bus and class section of the tree
as devices move all over the place when the box boots different times.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
