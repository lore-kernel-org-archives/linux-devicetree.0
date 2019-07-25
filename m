From: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH v3 5/7] drm/bridge: Add Analogix anx6345 support
Date: Thu, 25 Jul 2019 17:53:28 +0200
Message-ID: <20190725155328.GC4820@lst.de>
References: <20190722151154.8344568BFE@verein.lst.de> <CA+E=qVeSjE1i-ngJWv=GTQDM6HL-VEZWjXH_p_BXy+eP7SvWhg@mail.gmail.com> <CAFqH_50s0J_NEevV9b5o-wq-bw+xGaUZ3WyhVDRZKyM2Yn-iVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFqH_50s0J_NEevV9b5o-wq-bw+xGaUZ3WyhVDRZKyM2Yn-iVg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, arm-linux <linux-arm-kernel@lists.infradead.org>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 25, 2019 at 05:45:15PM +0200, Enric Balletbo Serra wrote:
> Hi,
> 
> Missatge de Vasily Khoruzhick <anarsoul@gmail.com> del dia dl., 22 de
> jul. 2019 a les 20:50:
> >
> > On Mon, Jul 22, 2019 at 8:11 AM Torsten Duwe <duwe@lst.de> wrote:
> > >
> > > +module_i2c_driver(anx6345_driver);
> > > +
> > > +MODULE_DESCRIPTION("ANX6345 eDP Transmitter driver");
> > > +MODULE_AUTHOR("Enric Balletbo i Serra <enric.balletbo@collabora.com>");
> >
> > I believe Icenowy is the author of this driver. If you think otherwise
> > please add Enric to CC and get his Signed-off-by.
> >
> 
> I think that the only reason my name appears here is because is a
> copy/paste from analogix-anx78xx.c (probably this driver took that

Yes, this is the case.
You wrote / authored 500 lines of it, Icenowy about 300.

> file as a reference?). Indeed I am not the author of this driver, so
> Icenowy should be here, not me.

Very well. Thanks for this clear statement!

	Torsten
