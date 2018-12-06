From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: a64: Add pinmux setting for
 CSI MCLK on PE1
Date: Thu, 6 Dec 2018 21:48:34 +0530
Message-ID: <CAMty3ZB0rvZ8kwcOmXT2oLUqDLc5w8VBshMQirXfUAVG=042kw@mail.gmail.com>
References: <20181206132306.11843-1-jagan@amarulasolutions.com>
 <20181206132306.11843-3-jagan@amarulasolutions.com> <20181206153532.6c756gccmpuj4wdw@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181206153532.6c756gccmpuj4wdw@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-amarula@amarulasolutions.com, Michael Trimarchi <michael@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 6, 2018 at 9:05 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Thu, Dec 06, 2018 at 06:53:06PM +0530, Jagan Teki wrote:
> > Some camera modules have the SoC feeding a master clock to the sensor
> > instead of having a standalone crystal. This clock signal is generated
> > from the clock control unit and output from the CSI MCLK function of
> > pin PE1.
> >
> > Add a pinmux setting for it for camera sensors to reference.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v2:
> > - new patch
> >
> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > index d7ab0006ebce..902b5238f1dd 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > @@ -538,6 +538,11 @@
> >                               function = "csi0";
> >                       };
> >
> > +                     csi_mclk_pin: csi-mclk {
> > +                             pins = "PE1";
> > +                             function = "csi0";
> > +                     };
> > +
>
> We're not merging nodes that have no users.

Yes, v1 [1] has a consumer for this. Since it's under discussion about
PE group supply, opendrain I hold it. will send once the discussion
done, I even tested on top-of your ov5640 changes.

[1] https://patchwork.kernel.org/patch/10709077/
