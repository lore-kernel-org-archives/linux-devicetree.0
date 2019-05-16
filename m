From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 4/4] arm64: DTS: allwinner: a64: enable ANX6345 bridge on Teres-I
Date: Thu, 16 May 2019 11:26:45 -0700
Message-ID: <CA+E=qVdxvU5t9MB447Zd+-MO7rw+qBxxaZApjp4fgDx=W47r-g@mail.gmail.com>
References: <20190514155911.6C0AC68B05@newverein.lst.de> <20190514160241.9EAC768C7B@newverein.lst.de>
 <CA+E=qVfuKBzWK7dpM_eabjU8mLdzOw3zCnYk6Tc1oXdavH7CNA@mail.gmail.com>
 <20190515093141.41016b11@blackhole.lan> <CA+E=qVf6K_0T0x2Hsfp6EDqM-ok6xiAzeZPvp6SRg0yt010pKA@mail.gmail.com>
 <20190516154820.GA10431@lst.de> <CA+E=qVe5NkAvHXPvVc7iTbZn5sKeoRm0166zPW_s83c2gk7B+g@mail.gmail.com>
 <20190516164859.GB10431@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516164859.GB10431@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Torsten Duwe <duwe@lst.de>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>, Harald Geyer <harald@ccbib.org>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 16, 2019 at 9:49 AM Torsten Duwe <duwe@lst.de> wrote:
>
> On Thu, May 16, 2019 at 09:06:41AM -0700, Vasily Khoruzhick wrote:
> >
> > Driver can talk to the panel over AUX channel only after t1+t3, t1 is
> > up to 10ms, t3 is up to 200ms.
>
> This is after power-on. The boot loader needs to deal with this.

Actually panel driver has to deal with it and not bootloader.

> > It works with older version of driver
> > that keeps panel always on because it takes a while between driver
> > probe and pipeline start.
>
> No lid switch, no USB, no WiFi, no MMC. If you disable DCDC1 you'll
> run out of wakeup-sources ;-) IOW: I see no practical way any OS
> driver can switch this panel voltage off and survive...

Ouch, looks like someone made a huge mistake in HW design?

> > All in all - you don't need panel timings since there's EDID but you
> > still need panel delays. Anyway, it's up to you and maintainers.
>
> Let's give it a try.
>
>         Torsten
>
