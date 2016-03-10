From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH 30/30] ARM: dts: r8a7794: Reference both DMA controllers
 in QSPI node
Date: Thu, 10 Mar 2016 14:42:43 +0100
Message-ID: <20160310134243.GA24099@bigcity.dyn.berto.se>
References: <1457609782-24108-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
 <1457609782-24108-31-git-send-email-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdW_nMfWF-sQPFgtxmtA_1vxw_hFPsb1DkRp7TJtKrB2ig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdW_nMfWF-sQPFgtxmtA_1vxw_hFPsb1DkRp7TJtKrB2ig@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 2016-03-10 13:08:56 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
>=20
> On Thu, Mar 10, 2016 at 12:36 PM, Niklas S=F6derlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > R-Car Gen2 have two DMA controllers, which are equivalent. Add
> > references to both dmac0 and dmac1 so the driver can fallback to th=
e
> > later if the first one is unavailable.
> >
> > Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnate=
ch.se>
> > ---
> >  arch/arm/boot/dts/r8a7794.dtsi | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a=
7794.dtsi
> > index 76709ff..e098eab 100644
> > --- a/arch/arm/boot/dts/r8a7794.dtsi
> > +++ b/arch/arm/boot/dts/r8a7794.dtsi
> > @@ -605,8 +605,9 @@
> >                 reg =3D <0 0xee200000 0 0x80>;
> >                 interrupts =3D <0 169 IRQ_TYPE_LEVEL_HIGH>;
> >                 clocks =3D <&mstp3_clks R8A7794_CLK_MMCIF0>;
>=20
> This one has the wrong subject: QSPI vs. MMCIF.

Thanks for noticing, would have been embarrassing for me.

>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>=20
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
>                                 -- Linus Torvalds

--=20
Regards,
Niklas S=F6derlund
