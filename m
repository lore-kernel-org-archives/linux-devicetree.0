From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun8i: add opp-v2 table for A33
Date: Mon, 19 Dec 2016 22:06:46 +0800
Message-ID: <11975791482156406@web2g.yandex.ru>
References: <20161215182754.33921-1-icenowy@aosc.xyz> <20161219084652.kiqdkiewu5tujlyd@lukather> <CAGb2v65YWntCrFHtSbxhtTWkt+UwkW3xoY-ae26MpH+-ULLXSQ@mail.gmail.com>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBB6GS37BAKGQEUEVP72Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v65YWntCrFHtSbxhtTWkt+UwkW3xoY-ae26MpH+-ULLXSQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



19.12.2016, 16:54, "Chen-Yu Tsai" <wens-jdAy2FN1RRM@public.gmane.org>:
> On Mon, Dec 19, 2016 at 4:46 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> =C2=A0On Fri, Dec 16, 2016 at 02:27:54AM +0800, Icenowy Zheng wrote:
>>> =C2=A0An operating point table is needed for the cpu frequency adjustin=
g to
>>> =C2=A0work.
>>>
>>> =C2=A0The operating point table is converted from the common value in
>>> =C2=A0extracted script.fex from many A33 board/tablets.
>>>
>>> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>>> =C2=A0---
>>> =C2=A0Changes since v1:
>>> =C2=A0- Fix format problem (blank lines).
>>> =C2=A0- Removed the 1.344GHz operating point, as it's overvoltage and o=
verclocked.
>>>
>>> =C2=A0This patch depends on the following patchset:
>>>
>>> =C2=A0http://lists.infradead.org/pipermail/linux-arm-kernel/2016-Decemb=
er/473962.html
>>>
>>> =C2=A0It's the v2 of the [PATCH 4/6] in this patchset.
>>>
>>> =C2=A0I think this operating point table may also apply to A23, as ther=
e's no
>>> =C2=A0difference except the points over 1.2GHz between A23 and A33's st=
ock dvfs table.
>>>
>>> =C2=A0But as A23 CCU may not have the necessary fixes, I won't add the =
table to A23
>>> =C2=A0now.
>>>
>>> =C2=A0Chen-Yu, could you test the CCU fixes I described in the patchset=
 above on A23,
>>> =C2=A0then test this operating points table?
>>>
>>> =C2=A0If it's necessary, you can send out the CCU fixes and add one mor=
e patch that
>>> =C2=A0moves this opp-v2 table to sun8i-a23-a33.dtsi .
>>>
>>> =C2=A0=C2=A0arch/arm/boot/dts/sun8i-a33.dtsi | 35 +++++++++++++++++++++=
++++++++++++++
>>> =C2=A0=C2=A01 file changed, 35 insertions(+)
>>>
>>> =C2=A0diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts=
/sun8i-a33.dtsi
>>> =C2=A0index 504996cbee29..0f5b2af72981 100644
>>> =C2=A0--- a/arch/arm/boot/dts/sun8i-a33.dtsi
>>> =C2=A0+++ b/arch/arm/boot/dts/sun8i-a33.dtsi
>>> =C2=A0@@ -46,7 +46,42 @@
>>> =C2=A0=C2=A0#include <dt-bindings/dma/sun4i-a10.h>
>>>
>>> =C2=A0=C2=A0/ {
>>> =C2=A0+ cpu0_opp_table: opp_table0 {
>>> =C2=A0+ compatible =3D "operating-points-v2";
>>> =C2=A0+ opp-shared;
>>> =C2=A0+
>>> =C2=A0+ opp@648000000 {
>>> =C2=A0+ opp-hz =3D /bits/ 64 <648000000>;
>>> =C2=A0+ opp-microvolt =3D <1040000>;
>>> =C2=A0+ clock-latency-ns =3D <244144>; /* 8 32k periods */
>>> =C2=A0+ };
>>> =C2=A0+
>>> =C2=A0+ opp@816000000 {
>>> =C2=A0+ opp-hz =3D /bits/ 64 <816000000>;
>>> =C2=A0+ opp-microvolt =3D <1100000>;
>>> =C2=A0+ clock-latency-ns =3D <244144>; /* 8 32k periods */
>>> =C2=A0+ };
>>> =C2=A0+
>>> =C2=A0+ opp@1008000000 {
>>> =C2=A0+ opp-hz =3D /bits/ 64 <1008000000>;
>>> =C2=A0+ opp-microvolt =3D <1200000>;
>>> =C2=A0+ clock-latency-ns =3D <244144>; /* 8 32k periods */
>>> =C2=A0+ };
>>> =C2=A0+
>>> =C2=A0+ opp@1200000000 {
>>> =C2=A0+ opp-hz =3D /bits/ 64 <1200000000>;
>>> =C2=A0+ opp-microvolt =3D <1320000>;
>>> =C2=A0+ clock-latency-ns =3D <244144>; /* 8 32k periods */
>>> =C2=A0+ };
>>> =C2=A0+ };
>>> =C2=A0+
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cpus {
>>> =C2=A0+ cpu0: cpu@0 {
>>
>> =C2=A0There's no need to duplicate the label here. I removed it and appl=
ied.
>
> I think using the label to directly reference cpu0 would be better,
> instead of duplicating the cpu@0 block.

After proper testing of A23 ccu, the operating points can also apply to A23=
.
(According to A23 devices' fex)

>
> ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
