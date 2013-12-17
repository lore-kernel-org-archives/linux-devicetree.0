From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v4 2/2] ARM: mach-moxart: add MOXA ART SoC device tree
 files
Date: Mon, 16 Dec 2013 16:09:52 -0800
Message-ID: <c68889e4-99be-44df-833d-c290f4a0592b@DB8EHSMHS009.ehs.local>
References: <1386945188-8316-1-git-send-email-jonas.jensen@gmail.com>
 <1386945188-8316-3-git-send-email-jonas.jensen@gmail.com>
 <CAEgOgz7=xZ8N+vGuaQ6L3n5SYpS3bS+xN88WXDH+A7m7JNLrcw@mail.gmail.com>
 <CACmBeS1H96Scr+ycHa-Ar_t72Q2x=LH-2vrbQXiLiuYHyH3S-Q@mail.gmail.com>
 <CAEgOgz6qz8ES_rQX8+UE-Ukh=G=_kHnAWJLQ-sUm6vkz=Xa7pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEgOgz6qz8ES_rQX8+UE-Ukh=G=_kHnAWJLQ-sUm6vkz=Xa7pg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Cc: Jonas Jensen <jonas.jensen@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "arm@kernel.org" <arm@kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Dec 17, 2013 at 09:53:27AM +1000, Peter Crosthwaite wrote:
> On Tue, Dec 17, 2013 at 6:05 AM, Jonas Jensen <jonas.jensen@gmail.com=
> wrote:
> > On 15 December 2013 05:27, Peter Crosthwaite
> > <peter.crosthwaite@xilinx.com> wrote:
> >>> +       sdhci: sdhci@98e00000 {
> >>> +               compatible =3D "moxa,moxart-sdhci";
> >>> +               reg =3D <0x98e00000 0x5C>;
> >>> +               interrupts =3D <5 0>;
> >>> +               clocks =3D <&clk_apb>;
> >>> +               dmas =3D  <&dma 5>,
> >>> +                       <&dma 5>;
> >>> +               dma-names =3D "tx", "rx";
> >>> +       };
> >>
> >> Is your SDHCI really implemented on the board level? The fact that=
 its
> >> reg property is within the same as the SoC range (for your dtsi)
> >> suggests the SDHCI is part of the SoC and should perhaps be in the
> >> dtsi?
> >
> >>> +       mac1: mac@92000000 {
> >>> +               compatible =3D "moxa,moxart-mac";
> >>> +               reg =3D <0x92000000 0x90>;
> >>> +               interrupts =3D <27 0>;
> >>> +               phy-handle =3D <&ethphy1>;
> >>> +               phy-mode =3D "mii";
> >>> +       };
> >>
> >> Same for MACs.
> >
> >>> +
> >>> +       uart0: uart@98200000 {
> >>> +               compatible =3D "ns16550a";
> >>> +               reg =3D <0x98200000 0x20>;
> >>> +               interrupts =3D <31 8>;
> >>> +               reg-shift =3D <2>;
> >>> +               reg-io-width =3D <4>;
> >>> +               clock-frequency =3D <14745600>;
> >>> +               status =3D "okay";
> >>> +       };
> >>> +
> >>
> >> And UARTs.
> >>
> >> Let me know if i'm misunderstanding dts/dtsi split but looking at =
some
> >> of the other SoCs this seems inconsistent to me.
> >
> >
> > It is likely to be true, that technically these are all part of the
> > SoC. By examining the hardware, there are no external chips (on eit=
her
> > base or main board) that looks capable of handling such functions:
> >
> > https://plus.google.com/photos/103371465418643926605/albums/5820634=
595801767953
> >
> > I made the split with some consideration to other MOXA ART machines=
,
> > that they can be added as a separate file including the same dtsi:
> >
> > MOXA ART hardware examples:
> >
> > UC-7112/UC-7110: "SD slot (UC-7112, and UC-7112 Plus only)":
> > http://www.moxa.com/product/UC-7112_UC-7110.htm
> >
> > IA241: "64 MB RAM":
> > http://www.moxa.com/product/IA241_IA240.htm
> >
> > UC-7101-LX: "One 10/100 Mbps Ethernet port":
> > http://www.moxa.com/product/UC-7101-LX.htm
> >
> >
> > UC-7112-LX has 32 MB RAM and two ethernet ports. This is why I thin=
k
> > MAC is good as is, RAM should move out from SoC?
> >
> > I don't know if they all have a debug UART (I only have access to
> > UC-7112-LX), and it's not obvious in specifications. UART can possi=
bly
> > be moved into SoC as you say.
> >
>=20
> I think its going to all be in the SoC. Having it board level would
> mean you have a system bus as copper which is not very SoC like (at
> least for UART anyway).
>=20
> > In cases where SD slot is missing but the register remains in the S=
oC,
> > how is that normally handled?
> >
>=20
> Soren Brinkmann's recent addition of ethernet to the Zynq SoC
> illustrates the concept for a MAC. The two MACs are added to the
> shared dtsi but disabled. The board level dts then enables it for the
> one which is board populated:
>=20
> https://lkml.org/lkml/2013/12/11/434
>=20
> I think its generally applicable to your SD MAC and UART cases. The
> tegra20 dtsi illustrates the status =3D "disabled" concept specifical=
ly
> for SDHCI.

I think it's less SoC vs. non-SoC parts. There are even platforms using
more than two levels of includes. IMHO, it's just to avoid duplication.
So, stuff that doesn't change ever goes into the lowest level dtsi and
then you work your way up. That way people bringing up a board with you=
r
part just have to enable the correct set of peripherals and provide
board specific properties. You don't want everybody to repeat the same
memory map (reg properties), clock references, etc. over and over again
in all dtses that use a specific SoC, right?

Long story short: I separate by: Properties that are statically defined
by the SOC =3D> dtsi. Properties that are defined by the PCB design =3D=
>
board level dts.

	S=C3=B6ren
