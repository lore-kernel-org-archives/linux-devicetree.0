From: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH 4/4] arm64: DTS: allwinner: a64: enable ANX6345 bridge
 on Teres-I
Date: Thu, 16 May 2019 17:48:20 +0200
Message-ID: <20190516154820.GA10431@lst.de>
References: <20190514155911.6C0AC68B05@newverein.lst.de> <20190514160241.9EAC768C7B@newverein.lst.de> <CA+E=qVfuKBzWK7dpM_eabjU8mLdzOw3zCnYk6Tc1oXdavH7CNA@mail.gmail.com> <20190515093141.41016b11@blackhole.lan> <CA+E=qVf6K_0T0x2Hsfp6EDqM-ok6xiAzeZPvp6SRg0yt010pKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+E=qVf6K_0T0x2Hsfp6EDqM-ok6xiAzeZPvp6SRg0yt010pKA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>, Harald Geyer <harald@ccbib.org>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 15, 2019 at 08:08:57AM -0700, Vasily Khoruzhick wrote:
> On Wed, May 15, 2019 at 12:32 AM Torsten Duwe <duwe@lst.de> wrote:
> >
> > It does comply with the bindings. The ports are all optional.
> > As far as DT is concerned, the signal path ends here. This is also the
> > final component _required_ to get the Linux kernel DRI up and running.
> 
> Ugh, then bindings should be fixed. It's not optional. It may work if
> bootloader enables power for you, but it won't if you disable display
> driver in u-boot.

I double-checked. On the Teres-I, mentioning the panel _is_ optional.
PD23 powers down panel and backlight as much as possible, see
24bd5d2cb93bc arm64: dts: allwinner: a64: teres-i: enable backlight
(currently only in Maxime's repo) and the Teres-I schematics...

And the driver in your repo neatly guards all accesses with
"if (anx6345->panel)" -- good!
But I found the Vdds are required, so I added them as such.

> I guess you're testing it with older version of anx6345. Newer version
> that supports power management [1] needs startup delay for panel.
> Another issue that you're seeing is that backlight is not disabled on
> DPMS events. All in all, you need to describe panel in dts.
> 
> [1] https://github.com/anarsoul/linux-2.6/commit/2fbf9c242419c8bda698e8331a02d4312143ae2c

> > Should I also have added a Tested-by: ? ;-)
> 
> I don't have Teres, so I haven't tested these.

*I* have one, and this works. I'll retest with your newer driver,
just in case. Nonetheless, the changes in this series should be fine.
Sending out v2 in a moment...

	Torsten
