From: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH v2 6/7] dt-bindings: Add ANX6345 DP/eDP transmitter
 binding
Date: Wed, 12 Jun 2019 16:59:26 +0200
Message-ID: <20190612145926.GA28426@lst.de>
References: <20190604122150.29D6468B05@newverein.lst.de> <CGME20190604122333epcas2p2f2c750e19a363901c83abb83354f55d4@epcas2p2.samsung.com> <20190604122305.07B9068B05@newverein.lst.de> <354de37d-57bb-6b06-c81a-a2081ea4f222@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <354de37d-57bb-6b06-c81a-a2081ea4f222@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 12, 2019 at 10:16:37AM +0200, Andrzej Hajda wrote:
> > +The ANX6345 is an ultra-low power Full-HD eDP transmitter designed for
> > +portable devices.
> > +
> > +Required properties:
> > +
> > + - compatible		: "analogix,anx6345"
> > + - reg			: I2C address of the device
> > + - reset-gpios		: Which GPIO to use for reset
> 
> 
> You have not specified it's active state, since in driver's code you
> named it RESETN I guess it should be active low.

Yes. The chip's reset is active low.
> 
> > + - dvdd12-supply	: Regulator for 1.2V digital core power.
> > + - dvdd25-supply	: Regulator for 2.5V digital core power.
> > + - Video port for LVTTL input, using the DT bindings defined in [1].
> 
> 
> Please assign port number for input (I guess 0).

True.

> 
> > +
> > +Optional properties:
> > +
> > + - Video port for eDP output (panel or connector) using the DT bindings
> > +   defined in [1].
> 
> 
> Shouldn't it be also required?

See previous discussion. Surely there should be _something_ connected to
the output side, but that something might not be relevant for the software
side, so it might be omitted from the device tree.

In fact, I'll submit v3 with the SPDX changes and without exactly this
output port spec which had caused the heated discussion.

	Torsten
