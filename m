From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v9 0/4] drm/atmel-hlcdc: bus-width override support
Date: Mon, 27 Aug 2018 22:35:05 +0200
Message-ID: <20180827223505.7e2fe6f6@bbrezillon>
References: <20180825085620.10566-1-peda@axentia.se>
        <20180827212449.723bdc99@bbrezillon>
        <ca38bd82-09d2-8e55-a3a2-e0e559abdf7f@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ca38bd82-09d2-8e55-a3a2-e0e559abdf7f@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jyri Sarha <jsarha@ti.com>, Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Sakari Ailus <sakari.ailus@iki.fi>
List-Id: devicetree@vger.kernel.org

On Mon, 27 Aug 2018 22:31:22 +0200
Peter Rosin <peda@axentia.se> wrote:

> On 2018-08-27 21:24, Boris Brezillon wrote:
> > On Sat, 25 Aug 2018 10:56:16 +0200
> > Peter Rosin <peda@axentia.se> wrote:
> >   
> >> Hi!
> >>
> >> The background for these patches is that our PCB interface between
> >> the SAMA5D3 and the ds90c185 lvds encoder is only using 16 bits, and
> >> this has to be described somewhere, or the atmel-hlcdc driver have no
> >> chance of selecting the correct output mode. Since we have similar
> >> problems with a tda19988 HDMI encoder I added patches to override
> >> the atmel-hlcdc output format via DT properties compatible with the
> >> media video-interface binding and things start to play together.  
> > 
> > Queued to drm-misc-next.  
> 
> Thanks!
> 
> Minute issue, you seem to have some spell-check going on or something,
> because the subject of patch 1/4 has been "corrected" from
> "...add ti,ds90c185" to "...add ti, ds90c185"
> 
> You might want to evaluate if that auto-correction "feature" should be
> disabled/tweaked/whatever...

Hm, weird. I just downloaded the mbox from dri-devel's patchwork and
passed it to dim apply. dim tends to do a lot of things behind the
scene, so maybe it's also trying to fix typos :-).
