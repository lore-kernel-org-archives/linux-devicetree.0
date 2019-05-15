From: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH 4/4] arm64: DTS: allwinner: a64: enable ANX6345 bridge
 on Teres-I
Date: Wed, 15 May 2019 09:31:41 +0200
Message-ID: <20190515093141.41016b11@blackhole.lan>
References: <20190514155911.6C0AC68B05@newverein.lst.de>
        <20190514160241.9EAC768C7B@newverein.lst.de>
        <CA+E=qVfuKBzWK7dpM_eabjU8mLdzOw3zCnYk6Tc1oXdavH7CNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+E=qVfuKBzWK7dpM_eabjU8mLdzOw3zCnYk6Tc1oXdavH7CNA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>, Harald Geyer <harald@ccbib.org>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 14 May 2019 10:48:40 -0700
Vasily Khoruzhick <anarsoul@gmail.com> wrote:

> > +       anx6345: anx6345@38 {
> > +               compatible = "analogix,anx6345";
> > +               reg = <0x38>;
> > +               reset-gpios = <&pio 3 24 GPIO_ACTIVE_LOW>; /* PD24
> > */
> > +               dvdd25-supply = <&reg_dldo2>;
> > +               dvdd12-supply = <&reg_dldo3>;
> > +
> > +               port {
> > +                       anx6345_in: endpoint {
> > +                               remote-endpoint =
> > <&tcon0_out_anx6345>;
> > +                       };
> > +               };
> 
> It doesn't comply with bindings document. You need to add out endpoint

It does comply with the bindings. The ports are all optional.
As far as DT is concerned, the signal path ends here. This is also the
final component _required_ to get the Linux kernel DRI up and running.

> as well, and to do so you need to add bindings for eDP connector first
> and then implement panel driver.
> See Rob's suggestions here: http://patchwork.ozlabs.org/patch/1042593/

Well, one *could* extend the hardware description down to the actual
panel if necessary, but on the Teres-I it is not. I assume the panel
they ship provides proper EDID to the anx6345, because the display
works fine here with this DT.

Do I understand this correctly that the (3 different?) pinebook panels
are not that easy to handle? I try to include the pinebook wherever
possible, just because it's so similar, but here I'm a bit lost, so I
had to omit these parts.

Should I also have added a Tested-by: ? ;-)

	Torsten
