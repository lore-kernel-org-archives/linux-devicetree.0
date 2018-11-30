Return-Path: <SRS0=qqZh=OJ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com>
 <1543319795-48325-20-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVhON=3hgZAdeeP9zwebVaZQNG=wsvqX3W3MVmQOWanbw@mail.gmail.com> <OSBPR01MB21038E1B2F3E83248DCCD298B8D30@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB21038E1B2F3E83248DCCD298B8D30@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Nov 2018 11:46:16 +0100
Message-ID: <CAMuHMdX7ghhyZcvrgit_zrNwTyVcizB0nbySYNeL-38ux9VJQw@mail.gmail.com>
Subject: Re: [PATCH 19/22] ARM: dts: r8a7744-iwg20m: Add SPI NOR support
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Fri, Nov 30, 2018 at 11:34 AM Biju Das <biju.das@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 19/22] ARM: dts: r8a7744-iwg20m: Add SPI NOR support
> > On Tue, Nov 27, 2018 at 1:05 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > > Add support for the SPI NOR device used to boot up the system to the
> > > iWave RZ/G1N Qseven System On Module DT.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm/boot/dts/r8a7744-iwg20m.dtsi
> > > +++ b/arch/arm/boot/dts/r8a7744-iwg20m.dtsi
> >
> > > @@ -53,6 +58,27 @@
> > >         status = "okay";
> > >  };
> > >
> > > +&qspi {
> > > +       pinctrl-0 = <&qspi_pins>;
> > > +       pinctrl-names = "default";
> > > +
> > > +       status = "okay";
> > > +
> > > +       /* WARNING - This device contains the bootloader. Handle with care.
> > */
> > > +       flash: flash@0 {
> > > +               #address-cells = <1>;
> > > +               #size-cells = <1>;
> > > +               compatible = "sst,sst25vf016b", "jedec,spi-nor";
> >
> > According to the schematics, this is an ISSI IS25LP016D?
> > ISSI was acquired by GigaDevice, according to Wikipedia.
> > While SST is now MicroChip.
>
> As per the schematic and BoM,  it is.
> IC FLASH 16MBIT 50MHZ 8SOIC SST25VF016B-50-4I-S2AF Microchip Technology 1 U1

Oh, this seems to differ for different revisions of the schematics.
R5.1 has the ISSI part, R3.4 has the SST part.

Due to "jedec,spi-nor", it will auto-detect, but IIRC, the driver will warn
if the compatible doesn't match the detected part, which thus may happen
for some boards.

> > > +               reg = <0>;
> > > +               spi-max-frequency = <50000000>;
> > > +               spi-tx-bus-width = <1>;
> > > +               spi-rx-bus-width = <1>;
> >
> > <1> is the default, but it's indeed good to make this explicit, as this is a QSPI
> > device with 2 unwired data pins.
> > However, as the device seems to support dual transfers, and dual mode uses
> > the standard MOSI/MISO pins, you should use <2> for both.
> > The RSPI driver supports this.
> >
> > The same applies to the RZ/G1M version.
>
> SST25VF016B this doesn't support dual mode.

OK.

So some boards have a dual-capable part, others don't.

I'm not 100% sure, but I think writing <2> will still work, as the driver
won't use dual mode on the SST25VF016B part, due to lack of
SPI_NOR_DUAL_READ in the entry in the spi-nor driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
