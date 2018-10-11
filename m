Return-Path: <SRS0=r4N+=MX=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <90934111-8cc5-482d-8a78-5ccc1113e42d@cogentembedded.com> <20181010221142.GG24305@bigcity.dyn.berto.se>
In-Reply-To: <20181010221142.GG24305@bigcity.dyn.berto.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Oct 2018 09:02:22 +0200
Message-ID: <CAMuHMdU5=CQPopwBspBgngLnMxTSJ3f=DsUOGT94q9fMx55HLA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a77980: add thermal support
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Niklas,

On Thu, Oct 11, 2018 at 12:11 AM Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2018-10-10 22:18:11 +0300, Sergei Shtylyov wrote:
> > Describe THS/CIVM in the R8A77980 device trees.
> >
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> > --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> > +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> > @@ -330,6 +330,19 @@
> >                       #power-domain-cells =3D <1>;
> >               };
> >
> > +             tsc: thermal@e6198000 {
> > +                     compatible =3D "renesas,r8a77980-thermal";
> > +                     reg =3D <0 0xe6198000 0 0x100>,
> > +                           <0 0xe61a0000 0 0x100>;
> > +                     interrupts =3D <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&cpg CPG_MOD 522>;
> > +                     power-domains =3D <&sysc R8A77980_PD_ALWAYS_ON>;
> > +                     resets =3D <&cpg 522>;
> > +                     #thermal-sensor-cells =3D <1>;
>
> The status property is missing but as you told me in v1 it should not
> matter. I will leave it for Simon to decide if he wants it to keep it
> consistent with other SoC or if we should remove it from the other dtsi
> files. In any case with or without the status property.

Forgot to review commit c79661eb5060e2bf ("arm64: dts: renesas: Remove
unneeded status from thermal nodes")? ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
