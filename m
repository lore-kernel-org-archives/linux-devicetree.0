From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 3/6] ARM: sun4i: Convert to CCU
Date: Wed, 13 Dec 2017 14:44:46 +0100
Message-ID: <20171213134446.6q3iyajqtdg7px2z@flea.lan>
References: <cover.a58841efb571d44013658505f3fa140536a89d1c.1490545262.git-series.plaes@plaes.org>
 <4357a69da97f46a324eec4c766f4bc9d9e7733ff.1490545262.git-series.plaes@plaes.org>
 <CAOi56cUjqjcZRz6VSwUWcrW=4RQyqyZHtm1vuM3HT2ypdPJ78g@mail.gmail.com>
 <20171212172635.2utwz3koyo5iwglt@plaes.org>
 <CAOi56cUeRrKQnJ-akJPB160-60aBzy64bDgFeoqMpHRJSCnDeQ@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o4ghp3lngrezczob"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBWO5YTIQKGQEYMAC23A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAOi56cUeRrKQnJ-akJPB160-60aBzy64bDgFeoqMpHRJSCnDeQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--o4ghp3lngrezczob
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Dec 12, 2017 at 01:24:52PM -0800, Kevin Hilman wrote:
> On Tue, Dec 12, 2017 at 9:26 AM, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org> wrote:
> > On Mon, Dec 11, 2017 at 02:22:30PM -0800, Kevin Hilman wrote:
> >> On Sun, Mar 26, 2017 at 10:20 AM, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org> wrote:
> >> > Convert sun4i-a10.dtsi to new CCU driver.
> >> >
> >> > Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
> >>
> >> I finally got around to bisecting a mainline boot failure on
> >> sun4i-a10-cubieboard that's been happening for quite a while.  Based
> >> on on kernelci.org, it showed up sometime during the v4.15 merge
> >> window[1].  It bisected down to this commit (in mainline as commit
> >> 41193869f2bdb585ce09bfdd16d9482aadd560ad).
> >>
> >> When it fails, there is no output on the serial console, so I don't
> >> know exactly how it's failing, just that it no longer boots.
> >
> > We tried out latest 4.15 with various compilers and it works:
> > - gcc version 7.1.1 20170622 (Red Hat Cross 7.1.1-3) (GCC) - A10 Gemei G9 tablet
> > - gcc 7.2.0-debian - A10 Cubieboard
> 
> And you can reproduce the bug with gcc5 or gcc6?
> 
> Very strange that a DT only patch would cause a gcc related regression
> and if it does, it should be investigated.  I don't think requiring
> gcc7 is an appropriate solution.
> 
> @Chen-Yu, @Maxime: are you guys OK with requiring gcc7 for working
> upstream boot for A10?

I'd rather not set that kind of constraints and fix the issue instead.

Priit, can you test with an older compiler?
You can find one here:
http://toolchains.free-electrons.com/

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--o4ghp3lngrezczob--
