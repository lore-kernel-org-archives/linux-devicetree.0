Return-Path: <SRS0=+yaY=OT=verge.net.au=horms@kernel.org>
Date: Mon, 10 Dec 2018 13:15:58 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 4/4] ARM: dts: iwg23s-sbc: Enable RTC
Message-ID: <20181210121557.s5oyide2rimejfff@verge.net.au>
References: <1544086559-47141-1-git-send-email-biju.das@bp.renesas.com>
 <1544086559-47141-5-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdUp2yOiMFFqT5MWhbK=O4fEuTMzH21Wp7HqYBdaruJ1nw@mail.gmail.com>
 <OSBPR01MB210383AE5748C0E18A370C96B8A90@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdXfHZayA5E=M1GQkChsj6G-qQLdPHkycLf2Hnt-=vXvTA@mail.gmail.com>
 <20181210115209.vlhcwni2tkyn3hyv@verge.net.au>
 <CAMuHMdVnoJ2Oe1hXDGWoKa_4k4Ti6kx80Qr7eH5dd2EOJotPFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVnoJ2Oe1hXDGWoKa_4k4Ti6kx80Qr7eH5dd2EOJotPFQ@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Dec 10, 2018 at 12:56:11PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Mon, Dec 10, 2018 at 12:52 PM Simon Horman <horms@verge.net.au> wrote:
> > On Thu, Dec 06, 2018 at 01:59:58PM +0100, Geert Uytterhoeven wrote:
> > > On Thu, Dec 6, 2018 at 1:41 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > > > > Subject: Re: [PATCH v3 4/4] ARM: dts: iwg23s-sbc: Enable RTC
> > >
> > > > > On Thu, Dec 6, 2018 at 10:04 AM Biju Das <biju.das@bp.renesas.com> wrote:
> > > > > > Enable NXP pcf85263 real time clock for the iWave SBC based on RZ/G1C.
> > > > > >
> > > > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > > >
> > > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > >
> > > > > > --- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> > > > > > +++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> > > > > > @@ -84,12 +84,30 @@
> > > > > >         clock-frequency = <20000000>;
> > > > > >  };
> > > > > >
> > > > > > +&i2c3 {
> > > > > > +       pinctrl-0 = <&i2c3_pins>;
> > > > > > +       pinctrl-names = "default";
> > > > > > +
> > > > > > +       status = "okay";
> > > > > > +       clock-frequency = <400000>;
> > > > > > +
> > > > > > +       rtc@51 {
> > > > > > +               compatible = "nxp,pcf85263";
> > > > > > +               reg = <0x51>;
> > > > >
> > > > > You might want to enable the optional interrupt:
> > > >
> > > > I have enabled this but unfortunately it is generating 100000 of gpio interrupts during boot.
> > >
> > > Oh, the DT bindings claim interrupt support hasn't been implement yet ;-)
> > >
> > > > The reason is, by default this pin is configured as function(Power on reset/at u-boot).
> > > > Currently there is no function available in kernel to convert a pin from function to gpio (Similar to the issue Fab is facing for display hot plug interrupt)
> > > >
> > > > May be we can add optional interrupt at a later stage, once we have a solution for converting  pin from function to gpio.
> > > >
> > > > Please share your opinion on this.
> > >
> > > IC. In that case, please postpone describing the interrupt until the issue is
> > > fixed.
> >
> > It feels like this patch is ready to be accepted.
> > Geert, do you concur?
> 
> Yes, I agree.

Thanks, I have applied v4 (which is the same as v3).
