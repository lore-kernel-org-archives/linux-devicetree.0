From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ARM: shmobile: silk: initial device tree
Date: Tue, 3 Feb 2015 10:53:01 +0100
Message-ID: <CAMuHMdV1U9XV7diKYPwpxAqdzD7tst6e0k=bLgJQ27=YDndn=Q@mail.gmail.com>
References: <201404250239.39150.sergei.shtylyov@cogentembedded.com>
	<1608366.HtA9yBksdO@wasted.cogentembedded.com>
	<20150202110557.GC7459@leverpostej>
	<54CFE4CE.5090406@cogentembedded.com>
	<20150203003610.GA17629@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20150203003610.GA17629@verge.net.au>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Mark Rutland <mark.rutland@arm.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 3, 2015 at 1:36 AM, Simon Horman <horms@verge.net.au> wrote=
:
> The only thing that stood out to me about "SILK" was that unlike
> other renesas boards names in .dtsi files it is all-capitals.
> Its not a bit deal but as we are on the topic: is that intentional?

Seems like we can use some consistency:

$ git grep -w model -- $(git grep -l renesas, -- arch/arm/boot/dts)
arch/arm/boot/dts/emev2-kzm9d.dts:      model =3D "EMEV2 KZM9D Board";
arch/arm/boot/dts/r7s72100-genmai.dts:  model =3D "Genmai";
arch/arm/boot/dts/r8a73a4-ape6evm.dts:  model =3D "APE6EVM";
arch/arm/boot/dts/r8a7740-armadillo800eva.dts:  model =3D "armadillo 80=
0 eva";
arch/arm/boot/dts/r8a7778-bockw-reference.dts:  model =3D "bockw";
arch/arm/boot/dts/r8a7778-bockw.dts:    model =3D "bockw";
arch/arm/boot/dts/r8a7779-marzen.dts:   model =3D "marzen";
arch/arm/boot/dts/r8a7790-lager.dts:    model =3D "Lager";
arch/arm/boot/dts/r8a7791-henninger.dts:        model =3D "Henninger";
arch/arm/boot/dts/r8a7791-koelsch.dts:  model =3D "Koelsch";
arch/arm/boot/dts/r8a7794-alt.dts:      model =3D "Alt";
arch/arm/boot/dts/sh73a0-kzm9g.dts:     model =3D "KZM-A9-GT";
$

ePAPR says:

"The recommended format is: =E2=80=9Cmanufacturer,model=E2=80=9D, where=
 manufacturer is a
 string describing the name of the manufacturer (such as a stock ticker=
 symbol),
 and model specifies the model number.

 Example:
         model =3D =E2=80=9Cfsl,MPC8349EMITX=E2=80=9D;"

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
