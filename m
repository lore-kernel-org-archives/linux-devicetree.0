From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun8i: add opp-v2 table for A33
Date: Mon, 19 Dec 2016 23:10:06 +0800
Message-ID: <20161219181032.ARg4ISWD@smtp1h.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBB4XQ37BAKGQEDHOVZ2Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


2016=E5=B9=B412=E6=9C=8819=E6=97=A5 22:30=E4=BA=8E Quentin Schulz <quentin.=
schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>
> On 19/12/2016 15:06, Icenowy Zheng wrote:=20
> >=20
> >=20
> > 19.12.2016, 16:54, "Chen-Yu Tsai" <wens-jdAy2FN1RRM@public.gmane.org>:=20
> >> On Mon, Dec 19, 2016 at 4:46 PM, Maxime Ripard=20
> >> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:=20
> >>>=C2=A0 On Fri, Dec 16, 2016 at 02:27:54AM +0800, Icenowy Zheng wrote:=
=20
> >>>>=C2=A0 An operating point table is needed for the cpu frequency adjus=
ting to=20
> >>>>=C2=A0 work.=20
> >>>>=20
> >>>>=C2=A0 The operating point table is converted from the common value i=
n=20
> >>>>=C2=A0 extracted script.fex from many A33 board/tablets.=20
> >>>>=20
> >>>>=C2=A0 Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> >>>>=C2=A0 ---=20
> >>>>=C2=A0 Changes since v1:=20
> >>>>=C2=A0 - Fix format problem (blank lines).=20
> >>>>=C2=A0 - Removed the 1.344GHz operating point, as it's overvoltage an=
d overclocked.=20
> >>>>=20
> >>>>=C2=A0 This patch depends on the following patchset:=20
> >>>>=20
> >>>>=C2=A0 http://lists.infradead.org/pipermail/linux-arm-kernel/2016-Dec=
ember/473962.html=20
> >>>>=20
> >>>>=C2=A0 It's the v2 of the [PATCH 4/6] in this patchset.=20
> >>>>=20
> >>>>=C2=A0 I think this operating point table may also apply to A23, as t=
here's no=20
> >>>>=C2=A0 difference except the points over 1.2GHz between A23 and A33's=
 stock dvfs table.=20
> >>>>=20
> >>>>=C2=A0 But as A23 CCU may not have the necessary fixes, I won't add t=
he table to A23=20
> >>>>=C2=A0 now.=20
> >>>>=20
> >>>>=C2=A0 Chen-Yu, could you test the CCU fixes I described in the patch=
set above on A23,=20
> >>>>=C2=A0 then test this operating points table?=20
> >>>>=20
> >>>>=C2=A0 If it's necessary, you can send out the CCU fixes and add one =
more patch that=20
> >>>>=C2=A0 moves this opp-v2 table to sun8i-a23-a33.dtsi .=20
> >>>>=20
> >>>>=C2=A0=C2=A0 arch/arm/boot/dts/sun8i-a33.dtsi | 35 ++++++++++++++++++=
+++++++++++++++++=20
> >>>>=C2=A0=C2=A0 1 file changed, 35 insertions(+)=20
> >>>>=20
> >>>>=C2=A0 diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/=
dts/sun8i-a33.dtsi=20
> >>>>=C2=A0 index 504996cbee29..0f5b2af72981 100644=20
> >>>>=C2=A0 --- a/arch/arm/boot/dts/sun8i-a33.dtsi=20
> >>>>=C2=A0 +++ b/arch/arm/boot/dts/sun8i-a33.dtsi=20
> >>>>=C2=A0 @@ -46,7 +46,42 @@=20
> >>>>=C2=A0=C2=A0 #include <dt-bindings/dma/sun4i-a10.h>=20
> >>>>=20
> >>>>=C2=A0=C2=A0 / {=20
> >>>>=C2=A0 + cpu0_opp_table: opp_table0 {=20
> >>>>=C2=A0 + compatible =3D "operating-points-v2";=20
> >>>>=C2=A0 + opp-shared;=20
> >>>>=C2=A0 +=20
> >>>>=C2=A0 + opp@648000000 {=20
> >>>>=C2=A0 + opp-hz =3D /bits/ 64 <648000000>;=20
> >>>>=C2=A0 + opp-microvolt =3D <1040000>;=20
> >>>>=C2=A0 + clock-latency-ns =3D <244144>; /* 8 32k periods */=20
> >>>>=C2=A0 + };=20
> >>>>=C2=A0 +=20
> >>>>=C2=A0 + opp@816000000 {=20
> >>>>=C2=A0 + opp-hz =3D /bits/ 64 <816000000>;=20
> >>>>=C2=A0 + opp-microvolt =3D <1100000>;=20
> >>>>=C2=A0 + clock-latency-ns =3D <244144>; /* 8 32k periods */=20
> >>>>=C2=A0 + };=20
> >>>>=C2=A0 +=20
> >>>>=C2=A0 + opp@1008000000 {=20
> >>>>=C2=A0 + opp-hz =3D /bits/ 64 <1008000000>;=20
> >>>>=C2=A0 + opp-microvolt =3D <1200000>;=20
> >>>>=C2=A0 + clock-latency-ns =3D <244144>; /* 8 32k periods */=20
> >>>>=C2=A0 + };=20
> >>>>=C2=A0 +=20
> >>>>=C2=A0 + opp@1200000000 {=20
> >>>>=C2=A0 + opp-hz =3D /bits/ 64 <1200000000>;=20
> >>>>=C2=A0 + opp-microvolt =3D <1320000>;=20
> >>>>=C2=A0 + clock-latency-ns =3D <244144>; /* 8 32k periods */=20
> >>>>=C2=A0 + };=20
> >>>>=C2=A0 + };=20
> >>>>=C2=A0 +=20
>
> Also, there are a lot more operating points for the A33, see:=20
> https://github.com/QSchulz/linux/blob/v4.9-rc4_adc_a31_v7/cpufreq_a33/arc=
h/arm/boot/dts/sun8i-a33.dtsi#L323-L340=20
>
> They are present in the Allwinner Linux source code and in the fex of=20
> all A33-based boards.=20
>
> Is there a reason for not adding all opp?=20

I just didn't see them...

Will add them in a further patch.

>
> Quentin=20
>
> --=20
> Quentin Schulz, Free Electrons=20
> Embedded Linux and Kernel engineering=20
> http://free-electrons.com=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
