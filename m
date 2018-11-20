From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 08/16] arm: dts: rda8810pl: Add interrupt controller
 support
Date: Wed, 21 Nov 2018 00:58:42 +0530
Message-ID: <20181120192842.GA16122@Mani-XPS-13-9360>
References: <20181119170939.19153-1-manivannan.sadhasivam@linaro.org>
 <20181119170939.19153-9-manivannan.sadhasivam@linaro.org>
 <CAL_JsqL3B3y3hYv-yf3wzXiUsvnM9pCYE7u_Y0i4zT7wFti5GA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqL3B3y3hYv-yf3wzXiUsvnM9pCYE7u_Y0i4zT7wFti5GA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, zhao_steven@263.net, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Mon, Nov 19, 2018 at 12:29:07PM -0600, Rob Herring wrote:
> On Mon, Nov 19, 2018 at 11:11 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > Add interrupt controller support for RDA Micro RDA8810PL SoC.
> 
> There's no point in splitting this to a separate patch. Without it,
> the DT is not functional.
> 

Okay. Will merge this patch with SoC DT patch.

> > Signed-off-by: Andreas Färber <afaerber@suse.de>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  arch/arm/boot/dts/rda8810pl.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/rda8810pl.dtsi b/arch/arm/boot/dts/rda8810pl.dtsi
> > index 7f1ff2021eff..093d6980bfbd 100644
> > --- a/arch/arm/boot/dts/rda8810pl.dtsi
> > +++ b/arch/arm/boot/dts/rda8810pl.dtsi
> > @@ -9,6 +9,7 @@
> >
> >  / {
> >         compatible = "rda,8810pl";
> > +       interrupt-parent = <&intc>;
> >         #address-cells = <1>;
> >         #size-cells = <1>;
> >
> > @@ -49,6 +50,13 @@
> >                         #address-cells = <1>;
> >                         #size-cells = <1>;
> >                         ranges = <0x0 0x20800000 0x100000>;
> > +
> > +                       intc: interrupt-controller {
> 
> 
> unit-address?
> 

Will add it.

Thanks,
Mani

> > +                               compatible = "rda,8810pl-intc";
> > +                               reg = <0x0 0x1000>;
> > +                               interrupt-controller;
> > +                               #interrupt-cells = <2>;
> > +                       };
> >                 };
> >
> >                 apb@20900000 {
> > --
> > 2.17.1
> >
