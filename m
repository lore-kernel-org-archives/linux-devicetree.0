From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: Add GPU operating points for H6
Date: Wed, 29 May 2019 17:37:23 +0200
Message-ID: <CAJiuCccFG1SATp7QuSOi11MmbjmgX0ZHsTv=4zuXqXMG+=-7Dw@mail.gmail.com>
References: <20190521161102.29620-1-peron.clem@gmail.com> <20190529153255.40038-1-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529153255.40038-1-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Tomeu,

On Wed, 29 May 2019 at 17:33, Tomeu Vizoso <tomeu.vizoso@collabora.com> wro=
te:
>
> The GPU driver needs them to change the clock frequency and regulator
> voltage depending on the load.

As requested by Maxime, I have dropped these OPP table as It's taken
from vendor and untested with Panfrost.

https://lore.kernel.org/patchwork/patch/1060374/

Regards,
Cl=C3=A9ment

>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>
> ---
>
> Feel free to pick up this patch if you are going to keep pushing this
> series forward.
>
> Thanks,
>
> Tomeu
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 66 ++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h6.dtsi
> index 6aad06095c40..decf7b56e2df 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -157,6 +157,71 @@
>                         allwinner,sram =3D <&ve_sram 1>;
>                 };
>
> +               gpu_opp_table: opp-table2 {
> +                       compatible =3D "operating-points-v2";
> +
> +                       opp00 {
> +                               opp-hz =3D /bits/ 64 <756000000>;
> +                               opp-microvolt =3D <1040000>;
> +                       };
> +                       opp01 {
> +                               opp-hz =3D /bits/ 64 <624000000>;
> +                               opp-microvolt =3D <950000>;
> +                       };
> +                       opp02 {
> +                               opp-hz =3D /bits/ 64 <576000000>;
> +                               opp-microvolt =3D <930000>;
> +                       };
> +                       opp03 {
> +                               opp-hz =3D /bits/ 64 <540000000>;
> +                               opp-microvolt =3D <910000>;
> +                       };
> +                       opp04 {
> +                               opp-hz =3D /bits/ 64 <504000000>;
> +                               opp-microvolt =3D <890000>;
> +                       };
> +                       opp05 {
> +                               opp-hz =3D /bits/ 64 <456000000>;
> +                               opp-microvolt =3D <870000>;
> +                       };
> +                       opp06 {
> +                               opp-hz =3D /bits/ 64 <432000000>;
> +                               opp-microvolt =3D <860000>;
> +                       };
> +                       opp07 {
> +                               opp-hz =3D /bits/ 64 <420000000>;
> +                               opp-microvolt =3D <850000>;
> +                       };
> +                       opp08 {
> +                               opp-hz =3D /bits/ 64 <408000000>;
> +                               opp-microvolt =3D <840000>;
> +                       };
> +                       opp09 {
> +                               opp-hz =3D /bits/ 64 <384000000>;
> +                               opp-microvolt =3D <830000>;
> +                       };
> +                       opp10 {
> +                               opp-hz =3D /bits/ 64 <360000000>;
> +                               opp-microvolt =3D <820000>;
> +                       };
> +                       opp11 {
> +                               opp-hz =3D /bits/ 64 <336000000>;
> +                               opp-microvolt =3D <810000>;
> +                       };
> +                       opp12 {
> +                               opp-hz =3D /bits/ 64 <312000000>;
> +                               opp-microvolt =3D <810000>;
> +                       };
> +                       opp13 {
> +                               opp-hz =3D /bits/ 64 <264000000>;
> +                               opp-microvolt =3D <810000>;
> +                       };
> +                       opp14 {
> +                               opp-hz =3D /bits/ 64 <216000000>;
> +                               opp-microvolt =3D <810000>;
> +                       };
> +               };
> +
>                 gpu: gpu@1800000 {
>                         compatible =3D "allwinner,sun50i-h6-mali",
>                                      "arm,mali-t720";
> @@ -168,6 +233,7 @@
>                         clocks =3D <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
>                         clock-names =3D "core", "bus";
>                         resets =3D <&ccu RST_BUS_GPU>;
> +                       operating-points-v2 =3D <&gpu_opp_table>;
>                         status =3D "disabled";
>                 };
>
> --
> 2.20.1
>
