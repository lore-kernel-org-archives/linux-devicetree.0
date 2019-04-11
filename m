From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Subject: Re: [PATCH 4/6] ARM: dts: sun8i: a83t: Add device node for CSI
 (Camera Sensor Interface)
Date: Thu, 11 Apr 2019 14:59:51 +0200
Message-ID: <20190411125951.zkbubk3kqmtiidkr@core.my.home>
References: <20190408165744.11672-1-wens@kernel.org>
 <20190408165744.11672-5-wens@kernel.org>
 <20190409075804.4zrwjil7ie2gjigu@flea>
 <CAGb2v64CYV68Q0a7x5p-XabS74vaQWP3paPopodmqQPTOrq2gQ@mail.gmail.com>
 <20190409082818.z33mq2qrxethldzf@flea>
 <20190409220040.3sx456gefmjq3t3g@core.my.home>
 <4c9aa6a850d76533ff693a44ef95b68241836751.camel@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4c9aa6a850d76533ff693a44ef95b68241836751.camel@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 11, 2019 at 02:47:52PM +0200, Paul Kocialkowski wrote:
> > > > > If we expect a single enpoint, then we don't need the address-cells
> > > > > and size-cells properties.
> > > > 
> > > > I wouldn't bet on anything. The way the Q8 tablets did front/back cameras
> > > > is kind of genius if not very hacky. They have two "identical" sensors
> > > > on the same I2C bus and CSI bus, with shared reset line but separate
> > > > shutdown lines. Since they are identical, they also have the same I2C
> > > > address. I haven't figured out how to model this in the device tree.
> > > > 
> > > > The point is, it's perfectly possible to have two or more sensors use
> > > > the same controller, provided only one be active at a time.
> > > 
> > > Right, but I guess the common case would be to have a single sensor,
> > > where that wouldn't be needed.
> > > 
> > > In odd cases, we can always specify it in the DTS, and if it becomes
> > > common enough, we can move it to the DTSI.
> > 
> > I'm planning on having two sensors there, in a less arcane setup,
> > though - no shared resets, and different I2C addresses.
> > 
> > Anyway, I can confirm that CSI driver works fine on A83T with just
> > a DTSI patch, even without the clock patch in this series. I've been
> > running it for quite a while that way without any issues (different
> > camera chip than the ones being used by wens).
> 
> That's quite nice to hear! I would be interested in getting some
> insight on which sensors are known to work and which are broken or have
> limitations.
> 
> Would you happen to have a list of the sensors that you tested and
> whether you encountered such issues with them?

I wrote the driver for the sensor I'm using, so the issues were mostly
during the development. It's Himax HM5065 sensor (not yet upstream).

If you try using other mainline sensors, the issues you'll face will mostly
be configuring the buses (CSI, I2C) correctly in DTS, or lack of support
for some VSYNC/HSYNC combinations on the sensor driver side. Luckily, CSI
controller is quite flexible, and will accomodate lack of configurability
on the sensor side.

regards,
  o.

> Cheers,
> 
> Paul
> 
> -- 
> Paul Kocialkowski, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
> 
