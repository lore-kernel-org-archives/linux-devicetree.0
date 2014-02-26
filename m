From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 00/10] pinctrl: mvebu: remove hard-coded addresses from
 Dove pinctrl
Date: Wed, 26 Feb 2014 09:53:45 -0500
Message-ID: <20140226145345.GG1872@titan.lakedaemon.net>
References: <1393231382-11078-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <20140224181023.GA1010@titan.lakedaemon.net>
 <CACRpkdZ+YGTyDj6i8c198MdRtz3GY-YBmVO9LysPCcmT4EC0cg@mail.gmail.com>
 <20140226000940.GF1872@titan.lakedaemon.net>
 <CACRpkdYQa2BG_qxf5zY=7rks6O31ZF-BX0af3_u1MOgwfwxFSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYQa2BG_qxf5zY=7rks6O31ZF-BX0af3_u1MOgwfwxFSQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 26, 2014 at 10:43:45AM +0100, Linus Walleij wrote:
> On Wed, Feb 26, 2014 at 1:09 AM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> 
> > Sebastian has now re-organized the branches as I asked, and I confirmed
> > that the final result is the exact same as mine (diff is null).
> 
> Okay!
> 
> > Usually when I submit pull requests to arm-soc, they like to see the
> > branches.  That way if there is an error in one of them, they just drop
> > the one branch and the others remain.
> >
> > Would you like them the same way?  If so, I'll send the pulls to you
> > tomorrow.
> 
> Send me one big branch with everything on it.

Sure.

> Actually, I'd prefer to pull it in, rebase and sign off each patch
> individually in my tree if that is not causing you problems.

Actually, that would mess us up pretty badly. :(  One of the reasons we
take the effort to base off of -rc1 and create stable topic branches is
so that the commit IDs don't change.  This way, all the patches needed
to boot the new mvebu SoCs (code intended for v3.15) can be boot tested
from the mvebu/for-next branch, which is merge-tested and randconfig
tested in linux-next.  This all happens _before_ the merge window for
v3.15.

There have been huge benefits since we started doing this.  In fact,
just yesterday I committed three patches to fix issues discovered as a
result of this process:

  edd9d3cffc90 watchdog: orion_wdt: Use %pa to print 'phys_addr_t'
  1b82af4f1749 ARM: kirkwood: select dtbs based on SoC
  a02dd0271d01 ARM: mvebu: select dtbs from MACH_ARMADA_*

The first was discovered by Olof's autobuilder, and the last two were
discovered by Kevin's boot farm.

If you rebase the branch, I'll have to drop it from our for-next tree to
prevent conflicts in linux-next with your -next branch.  Which means no
one will be able to boot test the new SoCs without going through a lot
of hunting to re-collect all the branches.

The advantage of having mvebu/for-next in addition to linux-next is that
should there be a boot failure, we can quickly determine whether it is a
result of the mvebu code (mvebu/for-next fails) or something outside of
mvebu (only linux-next fails).

By keeping the commit IDs the same, the same branch can be in multiple
trees all getting merged into linux-next.  Currently, mvebu does this
with arm-soc, clk, and irqchip.  In those cases, those maintainers are
the ones who send the pull requests to Linus, not us.

> That way it is visible that the patches were funneled through pin
> control.

I'm a little confused by this.  Once you merge the branch into one of
yours, that merge commit is a part of the history.  In fact, the branch
is still intact for eternity.  So by merging the branch, adding other
patches, and signing the tip of the result, it should be clear it came
through pinctrl, no?

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
