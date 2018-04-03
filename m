From: =?UTF-8?B?TXlsw6huZQ==?= Josserand <mylene.josserand@bootlin.com>
Subject: Re: [PATCH v5 05/13] ARM: dts: sun8i: Add R_CPUCFG device node for
 the A83T dtsi
Date: Tue, 3 Apr 2018 21:52:02 +0200
Message-ID: <20180403215202.2892baae@dell-desktop.home>
References: <20180403061836.3926-1-mylene.josserand@bootlin.com>
        <20180403061836.3926-6-mylene.josserand@bootlin.com>
        <CAGb2v66w3349h0b+xRD8seHhqMNoue8AzAFr-UPKvzZAtvoV5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGb2v66w3349h0b+xRD8seHhqMNoue8AzAFr-UPKvzZAtvoV5g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@bootlin.com>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, quentin.schulz@bootlin.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, 3 Apr 2018 17:07:06 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

> On Tue, Apr 3, 2018 at 2:18 PM, Mylène Josserand
> <mylene.josserand@bootlin.com> wrote:
> > The R_CPUCFG is a collection of registers needed for SMP bringup
> > on clusters and cluster's reset.
> > For the moment, documentation about this register is found in
> > Allwinner's code only.
> >
> > Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>
> > ---
> >  arch/arm/boot/dts/sun8i-a83t.dtsi | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
> > index 32992afa0b12..85f14f4ebeed 100644
> > --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> > +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> > @@ -933,6 +933,11 @@
> >                         #reset-cells = <1>;
> >                 };
> >
> > +               r_cpucfg@1f01c00 {
> > +                       compatible = "allwinner,sun8i-a83t-r-cpucfg";
> > +                       reg = <0x1f01c00 0x100>;  
> 
> The memory map says that its size is 0x400.
> 
> ChenYu

True, thank you for the correction.

Best regards,

-- 
Mylène Josserand, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
