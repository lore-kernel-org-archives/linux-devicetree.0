From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Subject: Re: [PATCH 1/7] iio: adc: sun4i-gpadc: rework for support multiple
 thermal sensor
Date: Mon, 6 May 2019 19:55:25 +0200
Message-ID: <20190506175525.swc5u7j6ntry7v3g@core.my.home>
References: <20190503072813.2719-1-tiny.windzz@gmail.com>
 <20190503072813.2719-2-tiny.windzz@gmail.com>
 <20190505162215.3594f77d@archlinux>
 <20190506122807.4u323iys74jddcet@flea>
 <282ccf0979e6c58effd0e177917bdf824c32f64e.camel@aosc.io>
 <CAEExFWusPoxtkGCoA+3gXq69cXZEfjZW+UpHW_0UfrcjpLmaXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEExFWusPoxtkGCoA+3gXq69cXZEfjZW+UpHW_0UfrcjpLmaXg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Lee <tiny.windzz@gmail.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, lars@metafoo.de, Maxime Ripard <maxime.ripard@bootlin.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-iio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, robh+dt@kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, pmeerw@pmeerw.net, knaack.h@gmx.de, Lee Jones <lee.jones@linaro.org>, Jonathan Cameron <jic23@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, May 07, 2019 at 01:08:39AM +0800, Frank Lee wrote:
> On Tue, May 7, 2019 at 12:52 AM Icenowy Zheng <icenowy@aosc.io> wrote:
> >
> > 在 2019-05-06一的 14:28 +0200，Maxime Ripard写道：
> > > Hi,
> > >
> > > On Sun, May 05, 2019 at 04:22:15PM +0100, Jonathan Cameron wrote:
> > > > On Fri,  3 May 2019 03:28:07 -0400
> > > > Yangtao Li <tiny.windzz@gmail.com> wrote:
> > > >
> > > > > For some SOCs, there are more than one thermal sensor, and there
> > > > > are
> > > > > currently four sensors on the A80. So we need to do some work in
> > > > > order
> > > > > to support multiple thermal sensors:
> > > > >
> > > > >   1) add sensor_count in gpadc_data.
> > > > >   2) introduce sun4i_sensor_tzd in sun4i_gpadc_iio, to support
> > > > > multiple
> > > > >      thermal_zone_device and distinguish between different
> > > > > sensors.
> > > > >   3) modify read temperature and initialization function.
> > > >
> > > > This comment doesn't mention the devm change. If it had it would
> > > > have
> > > > raised immediate alarm bells.
> > > >
> > > > I'm also not keen on the web of pointers that this driver is
> > > > steadily
> > > > evolving.  I can't immediately see how to reduce that complexity
> > > > however.
> > >
> > > So I might be responsible for that, and looking back, this has been a
> > > mistake.
> > >
> > > This driver was initally put together to support a controller found
> > > in
> > > older (A10 up to A31) Allwinner SoCs. This controller had an ADC
> > > driver that could be operated as a touchscreen controller, and was
> > > providing a CPU temperature sensor and a general purpose ADC.
> > >
> > > However, we already had a driver for that controller in drivers/input
> > > to report the CPU temperature, and the one in IIO was introduced to
> > > support the general purpose ADC (and the CPU temperature). The long
> > > term goal was to add the touchscreen feature as well eventually so
> > > that we could remove the one in drivers/input. That didn't happen.
> > >
> > > At the same time, the Allwinner hardware slowly evolved to remove the
> > > touchscreen and ADC features, and only keep the CPU temperature
> > > readout. It then evolved further on to support multiple temperatures
> > > (for different clusters, the GPU, and so on).
> > >
> > > So, today, we're in a situation where I was pushing everything into
> > > that IIO drivers since there was similiraties between all the
> > > generations, but the fact that we have to support so many odd cases
> > > (DT bindings compatibility, controllers with and without ADC, etc)
> > > that it becomes a real mess.
> > >
> > > And that mess isn't really used by anybody, since we want to have the
> > > touchscreen.
> > >
> > > There's only one SoC that is supported only by that driver, which is
> > > the A33 that only had a CPU temperature readout, and is still pretty
> > > similar to the latest SoC from Allwinner (that is supported by this
> > > series).
> > >
> > > I guess, for everyone's sanity and in order to not stall this
> > > further,
> > > it would just be better to create an hwmon driver for the A33 (and
> > > onwards, including the H6) for the SoC that just have the temperature
> > > readout feature. And for the older SoC, we just keep the older driver
> > > under input/. Once the A33 is supported, we'll remove the driver in
> > > IIO (and the related bits in drivers/mfd).
> 
> a hwmon driver or a thermal driver？
> 
> >
> > I think a thermal driver is better.
> 
> This is what I hope to see a few months ago.
> 
> >
> > Other SoCs' thermal sensor drivers are all thermal drivers.
> >
> > >
> > > Armbian already has a driver for that they never upstreamed iirc, so
> > > it might be a good starting point, and we would add the support for
> > > the H6. How does that sound?
> >
> > I think the developer abandoned to upstream it because of the previous
> > problem ;-)
> >
> > Maybe it can be taken and add A33&H6 support.
> 
> If OK, I am going to start some thermal driver work this weekend.  : )

There are plenty of thermal drivers flying around, with varying levels
of support for various SoCs:

- H3/H5: https://megous.com/git/linux/commit/?h=ths-5.1&id=b8e20c5da7a00b3a3fa1b274fc8d5bea95872b0a
- A83T: https://megous.com/git/linux/commit/?h=ths-5.1&id=796dff9a946fd475cc1e4bb948a723ea841c640c
- H6: https://megous.com/git/linux/commit/?h=opi3-5.1&id=aeab762c19b4aa228a295258c9d6b2e1f143bf86

For H3/H5 Icenowy also tried to upstream some variant of my THS driver, with
better SID/calibration data reading support.

I'd suggest starting with the H6 driver above (as that implements the
calibration data readout correctly), and make it so that it can support multiple
SoCs.

regards,
	o.

> Cheers,
> Yangtao
> 
> >
> > >
> > > Sorry for wasting everybody's time on this.
> > >
> > > Maxime
> > >
> > > --
> > > Maxime Ripard, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> > > _______________________________________________
> > > linux-arm-kernel mailing list
> > > linux-arm-kernel@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
