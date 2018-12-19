From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: allwinner: a64-amarula-relic: Add OV5640
 camera node
Date: Wed, 19 Dec 2018 09:58:19 -0600
Message-ID: <20181219155819.GA22708@bogus>
References: <20181203100747.16442-1-jagan@amarulasolutions.com>
 <20181203100747.16442-6-jagan@amarulasolutions.com>
 <CAGb2v6441wV7PM6q=vF2cpJtP9BGdYjQQqNU54rqELNJ5YcmdQ@mail.gmail.com>
 <CAMty3ZBBcum5CF1xQ_ePNUkcMoBPXngbiwf2V7hWHrH7-k3xuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMty3ZBBcum5CF1xQ_ePNUkcMoBPXngbiwf2V7hWHrH7-k3xuQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, linux-media <linux-media@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 06, 2018 at 04:43:33PM +0530, Jagan Teki wrote:
> On Mon, Dec 3, 2018 at 3:55 PM Chen-Yu Tsai <wens@csie.org> wrote:
> >
> > On Mon, Dec 3, 2018 at 6:08 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > Amarula A64-Relic board by default bound with OV5640 camera,
> > > so add support for it with below pin information.
> > >
> > > - PE13, PE12 via i2c-gpio bitbanging
> > > - CLK_CSI_MCLK as external clock
> > > - PE1 as external clock pin muxing
> > > - DLDO3 as vcc-csi supply
> > > - DLDO3 as AVDD supply
> > > - ALDO1 as DOVDD supply
> > > - ELDO3 as DVDD supply
> > > - PE14 gpio for reset pin
> > > - PE15 gpio for powerdown pin
> > >
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > ---
> > >  .../allwinner/sun50i-a64-amarula-relic.dts    | 54 +++++++++++++++++++
> > >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  5 ++
> > >  2 files changed, 59 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> > > index 6cb2b7f0c817..9ac6d773188b 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> > > @@ -22,6 +22,41 @@
> > >                 stdout-path = "serial0:115200n8";
> > >         };
> > >
> > > +       i2c-csi {
> > > +               compatible = "i2c-gpio";
> > > +               sda-gpios = <&pio 4 13 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> > > +               scl-gpios = <&pio 4 12 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> >
> > FYI our hardware doesn't do open drain.
> 
> True, but the kernel is enforcing it seems, from the change from [1].
> does that mean Linux use open drain even though hardware doens't have?
> or did I miss anything?

It's forced because you can't do I2C without open drain. Things like the 
slave doing clock stretching won't work.

Rob
