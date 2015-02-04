From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: silk: initial device tree
Date: Wed, 4 Feb 2015 09:28:59 +0900
Message-ID: <20150204002858.GB29128@verge.net.au>
References: <201404250239.39150.sergei.shtylyov@cogentembedded.com>
 <1608366.HtA9yBksdO@wasted.cogentembedded.com>
 <20150202110557.GC7459@leverpostej>
 <54CFE4CE.5090406@cogentembedded.com>
 <20150203003610.GA17629@verge.net.au>
 <CAMuHMdV1U9XV7diKYPwpxAqdzD7tst6e0k=bLgJQ27=YDndn=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdV1U9XV7diKYPwpxAqdzD7tst6e0k=bLgJQ27=YDndn=Q@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Mark Rutland <mark.rutland@arm.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 03, 2015 at 10:53:01AM +0100, Geert Uytterhoeven wrote:
> On Tue, Feb 3, 2015 at 1:36 AM, Simon Horman <horms@verge.net.au> wro=
te:
> > The only thing that stood out to me about "SILK" was that unlike
> > other renesas boards names in .dtsi files it is all-capitals.
> > Its not a bit deal but as we are on the topic: is that intentional?
>=20
> Seems like we can use some consistency:
>=20
> $ git grep -w model -- $(git grep -l renesas, -- arch/arm/boot/dts)
> arch/arm/boot/dts/emev2-kzm9d.dts:      model =3D "EMEV2 KZM9D Board"=
;
> arch/arm/boot/dts/r7s72100-genmai.dts:  model =3D "Genmai";
> arch/arm/boot/dts/r8a73a4-ape6evm.dts:  model =3D "APE6EVM";
> arch/arm/boot/dts/r8a7740-armadillo800eva.dts:  model =3D "armadillo =
800 eva";
> arch/arm/boot/dts/r8a7778-bockw-reference.dts:  model =3D "bockw";
> arch/arm/boot/dts/r8a7778-bockw.dts:    model =3D "bockw";
> arch/arm/boot/dts/r8a7779-marzen.dts:   model =3D "marzen";
> arch/arm/boot/dts/r8a7790-lager.dts:    model =3D "Lager";
> arch/arm/boot/dts/r8a7791-henninger.dts:        model =3D "Henninger"=
;
> arch/arm/boot/dts/r8a7791-koelsch.dts:  model =3D "Koelsch";
> arch/arm/boot/dts/r8a7794-alt.dts:      model =3D "Alt";
> arch/arm/boot/dts/sh73a0-kzm9g.dts:     model =3D "KZM-A9-GT";
> $
>=20
> ePAPR says:
>=20
> "The recommended format is: =E2=80=9Cmanufacturer,model=E2=80=9D, whe=
re manufacturer is a
>  string describing the name of the manufacturer (such as a stock tick=
er symbol),
>  and model specifies the model number.
>=20
>  Example:
>          model =3D =E2=80=9Cfsl,MPC8349EMITX=E2=80=9D;"

Agree we could use some consistency but before we start cooking up name=
s
do we expect this to have any effect on compatibility for users?
