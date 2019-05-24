From: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH 6/6] arm64: dts: allwinner: a64: enable ANX6345 bridge
 on Teres-I
Date: Fri, 24 May 2019 14:13:59 +0200
Message-ID: <20190524121359.GE15685@lst.de>
References: <20190523065013.2719D68B05@newverein.lst.de> <20190523065404.BB60F68B20@newverein.lst.de> <CA+E=qVdh-=C5zOYWYj95jLN51EaXFS6B+CQ101-f64q5QmgN3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+E=qVdh-=C5zOYWYj95jLN51EaXFS6B+CQ101-f64q5QmgN3g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>, Harald Geyer <harald@ccbib.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 23, 2019 at 07:48:03AM -0700, Vasily Khoruzhick wrote:
> On Wed, May 22, 2019 at 11:54 PM Torsten Duwe <duwe@lst.de> wrote:
> >
> >
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> > @@ -65,6 +65,21 @@
> >                 };
> >         };
> >
> > +       panel: panel {
> > +               compatible ="innolux,n116bge", "simple-panel";
> 
> IIRC Rob wanted it to be edp-connector, not simple-panel. Also you
> need to introduce edp-connector binding.

This line is identically found in
arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi and
arch/arm64/boot/dts/nvidia/tegra132-norrin.dts

> > +               status = "okay";
> > +               power-supply = <&reg_dcdc1>;
> > +               backlight = <&backlight>;
> > +
> > +               ports {
> > +                       panel_in: port {
> > +                               panel_in_edp: endpoint {
> > +                                       remote-endpoint = <&anx6345_out>;
> > +                               };
> > +                       };
> > +               };

The whole node is the same as in rk3288-veyron-chromebook.dtsi; I only adapted
the power-supply and remote-endpoint properties.

Is there anything wrong with that?

	Torsten
