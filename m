From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/7] drm/tinydrm: Add helper functions
Date: Tue, 7 Feb 2017 08:28:16 +1000
Message-ID: <CAPM=9tywXAt8v4VwjHA7OhsW6Xg=w8gDeY5s+fHjhdmuUUG7gg@mail.gmail.com>
References: <20170131160319.9695-1-noralf@tronnes.org> <20170131160319.9695-3-noralf@tronnes.org>
 <20170206085629.GD27607@ulmo.ba.sec> <20170206090918.6rqr6l7pd62znl5j@phenom.ffwll.local>
 <20170206093556.GF27607@ulmo.ba.sec> <CAKMK7uHgW15EPpPSU2se7r89JCGD_oTvn9ZJptYaNJAWMKb9Fg@mail.gmail.com>
 <20170206110847.GH27607@ulmo.ba.sec> <20170206155303.2fwihmlh6ln4eskt@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170206155303.2fwihmlh6ln4eskt-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>
> I definitely don't want that we don't attempt this. But brought from years
> of experience, I recommend to merge first (with pre-refactoring already
> applied, but helpers only extracted, not yet at the right spot), and then
> follow up with. Because on average, there's way too many trees with
> overloaded maintainers who maybe look at your patch once per kernel
> release cycle.
>
> If you know that backlight and spi isn't one of these areas (anything that
> goes through takashi/sound is a similar good experience for us on the i915
> side), then I guess we can try. But then Noralf has already written a few
> months worth of really great refactoring, and I'm seriously starting to
> feel guilty for volunteering him for all of this. Even though he seems to
> be really good at it, and seems to not mind, it's getting a bit silly.
> Given that I'd say up to Noralf.
>
> In short, there's always a balance.

I don't think we can make a rule for this, it will always depend on the
code. There is always going to be stuff we put in drm that should go
elsewhere, and stuff that is elsewhere that drm should use.

I think however if we do add stuff like this, someone should keep track
of them and try to make them get further into the kernel. In this case
I don't think the patches are too insane to keep in drm and refactor up
later, in other cases I'm sure it'll be lot more obvious (i.e. we could
make the same argument for chunks of DAL :-)

Dave.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
