From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH v8] reset: Add driver for gpio-controlled reset pins
Date: Thu, 18 Jul 2013 13:25:55 +0200
Message-ID: <20130718112555.GB1021@amd.pavel.ucw.cz>
References: <1369904940-716-1-git-send-email-p.zabel@pengutronix.de>
 <20130716015038.GD28375@S2101-09.ap.freescale.net>
 <51E4BF98.8030604@wwwdotorg.org>
 <20130716041056.GA30067@S2101-09.ap.freescale.net>
 <51E56AA7.7020103@wwwdotorg.org>
 <20130717030246.GA4541@S2101-09.ap.freescale.net>
 <51E6CCE4.20705@wwwdotorg.org>
 <20130717213836.GA13324@amd.pavel.ucw.cz>
 <51E719A6.6070105@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <51E719A6.6070105@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Marek Vasut <marex@denx.de>, Fabio Estevam <fabio.estevam@freescale.com>, Mike Turquette <mturquette@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Len Brown <len.brown@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Grant Likely <grant.likely@secretlab.ca>, "Rafael J. Wysocki" <rjw@sisk.pl>, Philipp Zabel <p.zabel@pengutronix.de>, Olof Johansson <olof@lixom.net>, Shawn Guo <shawn.guo@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi!

> >>> I do not quite follow the argument here.  I agree with you that
> >>> deferred probe is the approach to solve dependencies.  But it does not
> >>> necessarily mean that initcall can not be used to help it save some
> >>> nasty or nested deferring.  Deferred probe and initcalls are not two
> >>> mutually exclusive mechanisms but two which can help each other.
> >>
> >> My understanding is that deferred probe was implemented specifically to
> >> avoid having to, or allowing, the use of initcall levels to determine
> >> probe order.
> >>
> >> However, if someone closely associated with the implementation of
> >> deferred probe (e.g. Grant, or a device core maintainer) is willing to
> >> step up and say I'm wrong, I'll drop my objection.
> > 
> > AFAIR, defered probing is known to be a "hack" by its authors. We
> > should still try to get initcall levels right...
> 
> I don't /think/ it was the concept of deferred probe that was considered
> hacky, but perhaps just the first proof-of-concept implementation, and
> any hackiness was presumably solved before the feature was merged.

Well...

http://lwn.net/Articles/485194/

From:		Grant Likely <grant.likely@secretlab.ca>
To:		      linux-kernel@vger.kernel.org
Subject:		[PATCH] drivercore: Add driver probe deferral
mechanism
Date:		Mon, 5 Mar 2012 08:47:41 -0700
Message-ID:
<1330962461-9061-1-git-send-email-grant.likely@secretlab.ca>
...

I know that not everybody is happy with this approach, but I've yet to
see a better alternative.  However, it is *really easy* to find all
the
users of deferred probe since any user must return -EPROBE_DEFER
explicitly.
If/when a better approach is found, all the users will be easy to find
and modify.

...

It sound to me like keeping ammount of -EPROBE_DEFER to minimum is
still preferred.

							Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
