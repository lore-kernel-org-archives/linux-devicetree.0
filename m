From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 3/3] pinctrl: mvebu: silence WARN to dev_warn
Date: Fri, 7 Mar 2014 08:46:16 -0500
Message-ID: <20140307134616.GR1872@titan.lakedaemon.net>
References: <1393977790-29110-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1393977790-29110-4-git-send-email-sebastian.hesselbarth@gmail.com>
 <20140306201803.GL1872@titan.lakedaemon.net>
 <CACRpkda0JCLZUv_KPmwucDh3ko2YbtG2ukMMscSodAbBpiY+zw@mail.gmail.com>
 <20140307035056.GQ1872@titan.lakedaemon.net>
 <CACRpkdbEQSj7jLWT2BFR22m7phwmyKCByhQuFFgHvHoKvQFD5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbEQSj7jLWT2BFR22m7phwmyKCByhQuFFgHvHoKvQFD5g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 07, 2014 at 11:56:11AM +0800, Linus Walleij wrote:
> On Fri, Mar 7, 2014 at 11:50 AM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> > On Fri, Mar 07, 2014 at 11:48:25AM +0800, Linus Walleij wrote:
> >> On Fri, Mar 7, 2014 at 4:18 AM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> >> > On Wed, Mar 05, 2014 at 01:03:10AM +0100, Sebastian Hesselbarth wrote:
> >> >> Pinctrl will WARN on missing DT resources, which is a little bit too
> >> >> noisy. Use dev_warn with FW_BUG instead.
> >> >>
> >> >> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> >> ---
> >> >> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> >> >> Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> >> >> Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> >> >> Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >> >> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> >> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >> >> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> >> >> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >> >> ---
> >> >>  drivers/pinctrl/mvebu/pinctrl-dove.c | 3 ++-
> >> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >> >
> >> > Applied to mvebu/pinctrl
> >>
> >> So are you carrying this patch, or shall I apply it to my tree?
> >>
> >> In the former case: Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >
> > I'll send you a pull tomorrow.
> 
> For a single patch?

Well, just the doc change and WARN change.  I've already taken the dts
change into mvebu/dt (for arm-soc).

There should be no need for these two to be in mvebu's for-next, so if
it's easier for you to pick them, please do so.

I'll drop them from mvebu/pinctrl and update mvebu's for-next right now.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
