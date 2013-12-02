From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v6 02/17] dts: mpc512x: introduce dt-bindings/clock/
 header
Date: Mon, 2 Dec 2013 15:25:37 +0100
Message-ID: <20131202142537.GS2982@book.gsilab.sittig.org>
References: <1385851897-23475-1-git-send-email-gsi@denx.de>
 <1385851897-23475-3-git-send-email-gsi@denx.de>
 <20131202094656.GA12952@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131202094656.GA12952-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Detlev Zundel <dzu-ynQEQJNshbs@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 02, 2013 at 09:46 +0000, Mark Rutland wrote:
> 
> On Sat, Nov 30, 2013 at 10:51:22PM +0000, Gerhard Sittig wrote:
> > introduce a dt-bindings/ header file for MPC512x clocks,
> > providing symbolic identifiers for those SoC clocks which
> > clients will reference from their device tree nodes
> 
> There should be a binding document update to go with this, pointing out
> that this include file defines the set of clock IDs for the MPC512x
> clocks.

It turns out the Freescale MPC512x did not have a separate clocks
binding document, but "just did the usual" and followed the
common bindings.

I've sent a separate doc update patch which becomes applicable
after the CCF implementation got accepted.

> Otherwise, this looks fine to me.

So I take this as a "reviewed by" of yours for this dt-bindings
header file patch, shall I have to re-submit the series.  Thanks!


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
