From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: GIC_CPU_MASK_SIMPLE(8)" on big.LITTLE?
Date: Mon, 12 Jan 2015 14:45:14 +0000
Message-ID: <20150112144514.GL823@e106497-lin.cambridge.arm.com>
References: <CAMuHMdWQQBECdXT1pbChT31y8YdHzcjvTGR1A2HhtdtwpRmdPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWQQBECdXT1pbChT31y8YdHzcjvTGR1A2HhtdtwpRmdPQ@mail.gmail.com>
Content-Disposition: inline
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <Marc.Zyngier@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 05, 2015 at 10:37:47AM +0000, Geert Uytterhoeven wrote:
> A while ago, I wondered:
>=20
> | It's my understanding GIC_CPU_MASK_SIMPLE should reflect the actual=
 number
> | of CPU cores the interrupt is wired too. Is that correct?
> |
> | [Fixes for incorrect masks on shmobile]
> |
> | Should it be "GIC_CPU_MASK_SIMPLE(8)" on big.LITTLE configurations
> | with four Cortex-A15 cores and four Cortex-A7 cores?
> | Or should the interrupts be delivered to the four Cortex-A15 cores
> | only by default?
> |
> | Note that incorrect masks for GIC PPI interrupts are not limited to
> | shmobile. Presumably the interrupt specifiers got copied around a l=
ot,
> | cfr. the proliferation of "GIC_CPU_MASK_SIMPLE(4)" (and the older
> | hardcoded "0xf0x" variant) in various dtsi files, not always limite=
d to
> | quad-core CPUs.
>=20
> In the mean time, arch/arm64/boot/dts/arm/juno.dts got added, which h=
as 2 A57
> cores and 4 A53 cores, and uses GIC_CPU_MASK_SIMPLE(6), so it seems l=
ike
> my two RFC patches to use GIC_CPU_MASK_SIMPLE(8) for 4 A15 cores and =
4
> A7 cores are actually correct?
>=20
> Thanks for your comments!
>=20
> References:
>   1. Original RFC series:
>      [PATCH/RFC 0/4] ARM: shmobile: Correct masks for GIC PPI interru=
pts
>      http://lists.infradead.org/pipermail/linux-arm-kernel/2014-Novem=
ber/306743.html
>   2. RFC patches:
>        a. [PATCH/RFC 3/4] ARM: shmobile: r8a7790: Correct mask for GI=
C
> PPI interrupts
>           http://lists.infradead.org/pipermail/linux-arm-kernel/2014-=
November/306741.html
>        b. [PATCH/RFC 4/4] ARM: shmobile: r8a73a4: Correct mask for GI=
C
> PPI interrupts
>           http://lists.infradead.org/pipermail/linux-arm-kernel/2014-=
November/306740.html
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
>=20

Hi Geert,

Sorry for delay in responding, I'm just coming back online.

Your patches are correct, the mask should reflect the number of CPUs pr=
esent *and* they way
they are wired in the GIC. AFAIK, HW designers have been sane so far an=
d wired the CPUs
in sequence in the GIC, but I lack inside knowledge of the shmobile des=
ign.

Best regards,
Liviu

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF

