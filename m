From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCHv2 0/4] ARM: mvebu/kirkwood: NETGEAR ReadyNAS .dts files
 cleanup
Date: Sun, 1 Dec 2013 18:34:54 -0500
Message-ID: <20131201233454.GE2879@titan.lakedaemon.net>
References: <cover.1385756371.git.arno@natisbad.org>
 <20131201221710.GB2879@titan.lakedaemon.net>
 <87eh5wmanc.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87eh5wmanc.fsf-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 02, 2013 at 12:09:11AM +0100, Arnaud Ebalard wrote:
> 
> Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> writes:
> 
> >> Arnaud Ebalard (4):
> >>   ARM: kirkwood: NETGEAR ReadyNAS Duo v2 .dts cleanup
> >>   ARM: mvebu: NETGEAR ReadyNAS 102 .dts cleanup
> >>   ARM: mvebu: NETGEAR ReadyNAS 104 .dts cleanup
> >>   ARM: Fix whitespaces in NETGEAR ReadyNAS .dts files
> >> 
> >>  arch/arm/boot/dts/armada-370-netgear-rn102.dts     | 82 ++++++++++--------
> >>  arch/arm/boot/dts/armada-370-netgear-rn104.dts     | 68 +++++++--------
> >>  .../boot/dts/kirkwood-netgear_readynas_duo_v2.dts  | 99 +++++++++++++---------
> >>  3 files changed, 141 insertions(+), 108 deletions(-)
> >
> > whole series applied to mvebu/dt.  There was a small conflict with
> > Sebastian's pinctrl work.  Please double check and let me know if
> > anything is amiss.
> 
> All three .dts files look as they should in your branch.

Great!

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
