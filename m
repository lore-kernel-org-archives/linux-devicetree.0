From: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH 5/6] dt-bindings: Add ANX6345 DP/eDP transmitter binding
Date: Thu, 23 May 2019 14:30:41 +0200
Message-ID: <20190523123041.GB15685@lst.de>
References: <20190523065013.2719D68B05@newverein.lst.de> <20190523065400.BD9EB68B05@newverein.lst.de> <20190523090540.nhxrjpz3scx6jt23@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190523090540.nhxrjpz3scx6jt23@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, May 23, 2019 at 11:05:40AM +0200, Maxime Ripard wrote:
> > +Optional properties:
> > +
> > + - Video ports for RGB input and eDP output using the DT bindings
> > +   defined in [1]
> 
> The output node can be optional, but the input one is probably going
> to be needed all the time, since otherwise you won't be able to fill
> the output port of the upstream device in the graph.

I guess so. A sibling product brief (anx9804)
https://www.analogix.com/en/ttlconvertersbridges
references it as
| LVTTL to DisplayPort 1.2 _transmitter_
so it will probably always be used on the output side.

	Torsten
