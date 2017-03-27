From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH v2 1/5] dt-bindings: update device tree
 binding for Allwinner PRCM CCUs
Date: Tue, 28 Mar 2017 03:13:26 +0800
Message-ID: <a165c713004a2d1186feceee780ee04d@aosc.io>
References: <20170327091147.6B24A7C19A5@relay.mailchannels.net>
 <20170327134719.g6l3hzbba6cxkhb7@lukather>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBY6I4XDAKGQET2H4UTA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170327134719.g6l3hzbba6cxkhb7@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-kernel-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017-03-27 21:47=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> On Mon, Mar 27, 2017 at 05:11:29PM +0800, Icenowy Zheng wrote:
>>=20
>> 2017=E5=B9=B43=E6=9C=8826=E6=97=A5 21:10=E4=BA=8E Maxime Ripard <maxime.=
ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>> >
>> > On Thu, Mar 23, 2017 at 07:17:03AM +0800, Icenowy Zheng wrote:
>> > >
>> > >
>> > > 23.03.2017, 04:09, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org=
>:
>> > > > On Wed, Mar 22, 2017 at 02:22:22AM +0800, Icenowy Zheng wrote:
>> > > >> =C2=A021.03.2017, 15:41, "Maxime Ripard" <maxime.ripard@free-elec=
trons.com>:
>> > > >> =C2=A0> On Thu, Mar 16, 2017 at 01:28:04AM +0800, Icenowy Zheng w=
rote:
>> > > >> =C2=A0>> =C2=A0Many Allwinner SoCs after A31 have a CCU in PRCM b=
lock.
>> > > >> =C2=A0>>
>> > > >> =C2=A0>> =C2=A0Give the ones on H3 and A64 compatible strings.
>> > > >> =C2=A0>>
>> > > >> =C2=A0>> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> > > >> =C2=A0>> =C2=A0---
>> > > >> =C2=A0>> =C2=A0Changes in v2:
>> > > >> =C2=A0>> =C2=A0- Add iosc for R_CCU's on H3/A64. (A31, A23 and A3=
3 seem to have different
>> > > >> =C2=A0>> =C2=A0=C2=A0=C2=A0clock for mux 3 of ar100 clk. Investga=
tions are needed for them.)
>> > > >> =C2=A0>>
>> > > >> =C2=A0>> =C2=A0=C2=A0Documentation/devicetree/bindings/clock/sunx=
i-ccu.txt | 18 +++++++++++++++++-
>> > > >> =C2=A0>> =C2=A0=C2=A01 file changed, 17 insertions(+), 1 deletion=
(-)
>> > > >> =C2=A0>>
>> > > >> =C2=A0>> =C2=A0diff --git a/Documentation/devicetree/bindings/clo=
ck/sunxi-ccu.txt b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
>> > > >> =C2=A0>> =C2=A0index 68512aa398a9..4a4addff595d 100644
>> > > >> =C2=A0>> =C2=A0--- a/Documentation/devicetree/bindings/clock/sunx=
i-ccu.txt
>> > > >> =C2=A0>> =C2=A0+++ b/Documentation/devicetree/bindings/clock/sunx=
i-ccu.txt
>> > > >> =C2=A0>> =C2=A0@@ -7,9 +7,11 @@ Required properties :
>> > > >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun8i-a2=
3-ccu"
>> > > >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun8i-a3=
3-ccu"
>> > > >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun8i-h3=
-ccu"
>> > > >> =C2=A0>> =C2=A0+ - "allwinner,sun8i-h3-r-ccu"
>> > > >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun8i-v3=
s-ccu"
>> > > >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun9i-a8=
0-ccu"
>> > > >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun50i-a=
64-ccu"
>> > > >> =C2=A0>> =C2=A0+ - "allwinner,sun50i-a64-r-ccu"
>> > > >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun50i-h=
5-ccu"
>> > > >> =C2=A0>>
>> > > >> =C2=A0>> =C2=A0=C2=A0- reg: Must contain the registers base addre=
ss and length
>> > > >> =C2=A0>> =C2=A0@@ -20,7 +22,11 @@ Required properties :
>> > > >> =C2=A0>> =C2=A0=C2=A0- #clock-cells : must contain 1
>> > > >> =C2=A0>> =C2=A0=C2=A0- #reset-cells : must contain 1
>> > > >> =C2=A0>>
>> > > >> =C2=A0>> =C2=A0-Example:
>> > > >> =C2=A0>> =C2=A0+For the PRCM CCUs on H3/A64, one more clock is ne=
eded:
>> > > >> =C2=A0>> =C2=A0+- "iosc": another frequency oscillator used for C=
PUS (usually at 32000Hz,
>> > > >> =C2=A0>> =C2=A0+ not the same with losc)
>> > > >> =C2=A0>
>> > > >> =C2=A0> This is called the internal oscillator in the datasheet, =
it would
>> > > >> =C2=A0> probably make more sense to call it that way in the docum=
entation too.
>> > > >> =C2=A0>
>> > > >> =C2=A0> This oscillator seems to be clocked at 16MHz, so we shoul=
d represent
>> > > >> =C2=A0> it as such.
>> > > >> =C2=A0>
>> > > >> =C2=A0> And I'm wondering, are you *sure* that it's fed directly =
from the
>> > > >> =C2=A0> internal oscillator, or goes through the registers in the=
 RTC, with
>> > > >> =C2=A0> the 32 divider and 16 prescaler by default that makes it =
at roughly
>> > > >> =C2=A0> the same rate (31.25kHz).
>> > > >>
>> > > >> =C2=A0In fact I know nothing about it -- I only represented the c=
ode in BSP
>> > > >> =C2=A0clock driver.
>> > > >>
>> > > >> =C2=A0The mux value 3 varies from SoC to SoC. For A64/H5 it's 320=
00,
>> > > >> =C2=A0for A33 it's 667000 (seems to be directly the internal OSC,=
 as the
>> > > >> =C2=A0user manual says the internal OSC is 600~700kHz; but it's n=
amed
>> > > >> =C2=A0cpuosc rather than iosc in A33 BSP clock driver); for A80 i=
t's even
>> > > >> =C2=A0PLL_AUDIO.
>> > > >
>> > > > Where are you getting those info from?
>> > > >
>> > > > As far as I know, the A33 PRCM takes the hosc, losc, pll6 and CPU
>> > > > (internal) oscillator:
>> > > > https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/driver=
s/clk/sunxi/clk-sun8iw5.c#L508
>> > > >
>> > > > The H3 takes the hosc and losc:
>> > > > https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/driver=
s/clk/sunxi/clk-sun8iw7.c#L379
>> > > >
>> > > > The A80 takes the hosc and losc:
>> > > > https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/driver=
s/clk/sunxi/clk-sun9iw1.c#L281
>> > > >
>> > > > The A64 takes the hosc, losc, pll-periph0 and the iosc, which inde=
ed
>> > > > seems to be fed from the internal oscillator with the divider in t=
he
>> > > > RTC:
>> > > > https://github.com/longsleep/linux-pine64/blob/lichee-dev-v3.10.65=
-bsp2.0/arch/arm64/boot/dts/sun50iw1p1-clk.dtsi#L19
>> > > > https://github.com/longsleep/linux-pine64/blob/lichee-dev-v3.10.65=
-bsp2.0/drivers/clk/sunxi/clk-sun50iw1.c#L603
>> > >
>> > > But then in sunxi_init_clocks function, the iosc clock is initialize=
d
>> > > as a fixed clock with 32000Hz.
>> > >
>> > > The clock node in BSP device tree have a compatible of
>> > > allwinner,fixed-clock, but not fixed-clock, which makes it not able
>> > > to be really probed.
>> >
>> > That clock is registered:
>> > https://github.com/longsleep/linux-pine64/blob/lichee-dev-v3.10.65-bsp=
2.0/drivers/clk/sunxi/clk-sun50iw1.c#L1193
>> >
>>=20
>> Oh yes, but conflicts exist between the iosc registered in
>> clk-sun50iw1.c and described in sun50iw1p1-clk.dtsi . The former is
>> 32000, and the latter is 16000000.
>=20
> No, it is 16MHz / 32 / 16 =3D 31.25 kHz
>=20
>> What should we do then?
>>=20
>> (Maybe it will be better to temporarily ignore this mux, as it's
>> difficult to finally find out this correct mux...)
>=20
> That is not an option, we will not be able to fix it afterwards.
>=20
> What we should do is getting an actual idea of what's going on, and
> not just hacking something together hoping it will work.
>=20
> You can start by figuring out how the Allwinner clock driver actually
> works and / or by trying the various muxing options with something you
> can measure the frequency with. The i2c or uart coupled with a scope
> or logical analyzer would be a great fit for that.
>=20
> Using the PRCM timer is another option and you can measure the
> frequency it counts at.

The MUX 3 of AR100 is surely Internal OSC on A64/H3/H5.

Some measurement done with AR100 (all in Hz):

H5 (Orange Pi PC2):
16351952
16347120
16343624

A64 (Pine64+):
11192560
11174128
11174992

H3 (Orange Pi One):
15676016
15625088
15600144

H2+ (Orange Pi Zero):
15907560
15823768
15805144

Seems that on H3/H5 the IOSC is ~16MHz, but on A64 it's... ~12MHz?
(Although the usermanual says 16Mhz in the chapter of RTC)

Maybe some further investigations should be done on more boards.

A fork of ar100-info is at
https://github.com/Icenowy/ar100-info/tree/hz-test ,
which contains IOSC frequency calculation and show in Hz. (and of
course H5/A64 support)

>=20
> Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
