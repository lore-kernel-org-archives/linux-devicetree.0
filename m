From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 07/15] arm64: dts: allwinner: h5: Add system-control
 node with SRAM C1
Date: Wed, 5 Dec 2018 17:49:57 +0800
Message-ID: <CAGb2v67tgp_tD_Pkx1Qkc=d__saZUMwwmE44uCCeLgVM2HWmUQ@mail.gmail.com>
References: <20181205092444.29497-1-paul.kocialkowski@bootlin.com>
 <20181205092444.29497-8-paul.kocialkowski@bootlin.com>
 <CAGb2v66JwZ_RkEdk6sz-0Z7EJx7ieG3zBT6yr-95X6guxUkKTg@mail.gmail.com>
 <edf44a24633ecaf59a7d5bea1f4acffdd0ae01a3.camel@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <edf44a24633ecaf59a7d5bea1f4acffdd0ae01a3.camel@bootlin.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: devel@driverdev.osuosl.org, devicetree <devicetree@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 5, 2018 at 5:48 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> Hi,
>
> On Wed, 2018-12-05 at 17:45 +0800, Chen-Yu Tsai wrote:
> > On Wed, Dec 5, 2018 at 5:25 PM Paul Kocialkowski
> > <paul.kocialkowski@bootlin.com> wrote:
> > > Add the H5-specific system control node description to its device-tree
> > > with support for the SRAM C1 section, that will be used by the video
> > > codec node later on.
> > >
> > > The CPU-side SRAM address was obtained empirically while the size was
> > > taken from the documentation. They may not be entirely accurate.
> > >
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi | 22 ++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
> > > index b41dc1aab67d..42bfb560b367 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
> > > @@ -94,6 +94,28 @@
> > >         };
> > >
> > >         soc {
> > > +               system-control@1c00000 {
> > > +                       compatible = "allwinner,sun50i-h5-system-control";
> > > +                       reg = <0x01c00000 0x1000>;
> > > +                       #address-cells = <1>;
> > > +                       #size-cells = <1>;
> > > +                       ranges;
> > > +
> > > +                       sram_c1: sram@1d00000 {
> > > +                               compatible = "mmio-sram";
> > > +                               reg = <0x00018000 0x1c000>;
> >
> > 0x1d00000 or 0x18000?
>
> For the H5, I found the VE SRAM area to be mapped to 0x18000 on the CPU
> side (when testing with devmem), unlike the A64, H3 and others. I was
> rather surprised about this as well!

I'm actually referring to the node name that still says 1d00000.

ChenYu

>
> > > +                               #address-cells = <1>;
> > > +                               #size-cells = <1>;
> > > +                               ranges = <0 0x00018000 0x1c000>;
> >
> > Same here.
> >
> > > +
> > > +                               ve_sram: sram-section@0 {
> > > +                                       compatible = "allwinner,sun50i-h5-sram-c1",
> > > +                                                    "allwinner,sun4i-a10-sram-c1";
> > > +                                       reg = <0x000000 0x1c000>;
> > > +                               };
> > > +                       };
> > > +               };
> > > +
> > >                 mali: gpu@1e80000 {
> > >                         compatible = "allwinner,sun50i-h5-mali", "arm,mali-450";
> > >                         reg = <0x01e80000 0x30000>;
> > > --
> > > 2.19.2
>
> Cheers,
>
> Paul
>
> --
> Paul Kocialkowski, Bootlin (formerly Free Electrons)
> Embedded Linux and kernel engineering
> https://bootlin.com
>
