From: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH v3 5/7] drm/bridge: Add Analogix anx6345 support
Date: Thu, 25 Jul 2019 17:26:49 +0200
Message-ID: <20190725152649.GB4820@lst.de>
References: <20190722151154.8344568BFE@verein.lst.de> <CA+E=qVeSjE1i-ngJWv=GTQDM6HL-VEZWjXH_p_BXy+eP7SvWhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+E=qVeSjE1i-ngJWv=GTQDM6HL-VEZWjXH_p_BXy+eP7SvWhg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>, Harald Geyer <harald@ccbib.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 22, 2019 at 11:49:48AM -0700, Vasily Khoruzhick wrote:
> On Mon, Jul 22, 2019 at 8:11 AM Torsten Duwe <duwe@lst.de> wrote:
> >
> > +module_i2c_driver(anx6345_driver);
> > +
> > +MODULE_DESCRIPTION("ANX6345 eDP Transmitter driver");
> > +MODULE_AUTHOR("Enric Balletbo i Serra <enric.balletbo@collabora.com>");
> 
> I believe Icenowy is the author of this driver. If you think otherwise
> please add Enric to CC and get his Signed-off-by.

This has already been questioned, and consequently I had a closer look.
Icenowy did the work of finding and splitting the common parts, and copied
and modified those that needed adaption.

Please read the change log(s) in the cover letter(s).

I guess Enric already did sign off his code, which only got moved, copied
and modified.

	Torsten
