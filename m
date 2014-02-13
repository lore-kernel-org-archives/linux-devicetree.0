From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH RFC v7 4/6] dma: mpc512x: add device tree binding document
Date: Thu, 13 Feb 2014 01:21:50 +0100
Message-ID: <20140213002150.GJ4524@book.gsilab.sittig.org>
References: <1392211508-23615-1-git-send-email-a13xp0p0v88@gmail.com>
 <1392211508-23615-5-git-send-email-a13xp0p0v88@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392211508-23615-5-git-send-email-a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 12, 2014 at 17:25 +0400, Alexander Popov wrote:
> 
> From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
> 
> introduce a device tree binding document for the MPC512x DMA controller
> 
> Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
> [ a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org: turn this into a separate patch ]

As stated in the previous iteration, this one no longer is good
enough.  As time has passed, we have moved forward and learned
something.  We would not write a binding like this today.
Admittedly I went dormant (did not provide an update) since v6.

There are several issues.
- The MPC512x DMA completely lacks a binding document, so one
  should get added.
- The MPC8308 hardware is similar and can re-use the MPC512x
  binding, which should be stated.
- The Linux implementation currently has no OF based channel
  lookup support, so '#dma-cells' is "a future feature".  I guess
  the binding can and should already discuss the feature,
  regardless of whether all implementations support it.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office-ynQEQJNshbs@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
