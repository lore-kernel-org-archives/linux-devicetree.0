From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: update device tree
 binding for Allwinner PRCM CCUs
Date: Mon, 27 Mar 2017 15:47:19 +0200
Message-ID: <20170327134719.g6l3hzbba6cxkhb7@lukather>
References: <20170327091147.6B24A7C19A5@relay.mailchannels.net>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yaukvc7i6m76ilvo"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB2FP4TDAKGQELNK6B6I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170327091147.6B24A7C19A5-Y9/x5g2N/Tt0ykcd9G8QkxTxI0vvWBSX@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--yaukvc7i6m76ilvo
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2017 at 05:11:29PM +0800, Icenowy Zheng wrote:
>=20
> 2017=E5=B9=B43=E6=9C=8826=E6=97=A5 21:10=E4=BA=8E Maxime Ripard <maxime.r=
ipard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, Mar 23, 2017 at 07:17:03AM +0800, Icenowy Zheng wrote:=20
> > >=20
> > >=20
> > > 23.03.2017, 04:09, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=
:=20
> > > > On Wed, Mar 22, 2017 at 02:22:22AM +0800, Icenowy Zheng wrote:=20
> > > >> =C2=A021.03.2017, 15:41, "Maxime Ripard" <maxime.ripard@free-elect=
rons.com>:=20
> > > >> =C2=A0> On Thu, Mar 16, 2017 at 01:28:04AM +0800, Icenowy Zheng wr=
ote:=20
> > > >> =C2=A0>> =C2=A0Many Allwinner SoCs after A31 have a CCU in PRCM bl=
ock.=20
> > > >> =C2=A0>>=20
> > > >> =C2=A0>> =C2=A0Give the ones on H3 and A64 compatible strings.=20
> > > >> =C2=A0>>=20
> > > >> =C2=A0>> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> > > >> =C2=A0>> =C2=A0---=20
> > > >> =C2=A0>> =C2=A0Changes in v2:=20
> > > >> =C2=A0>> =C2=A0- Add iosc for R_CCU's on H3/A64. (A31, A23 and A33=
 seem to have different=20
> > > >> =C2=A0>> =C2=A0=C2=A0=C2=A0clock for mux 3 of ar100 clk. Investgat=
ions are needed for them.)=20
> > > >> =C2=A0>>=20
> > > >> =C2=A0>> =C2=A0=C2=A0Documentation/devicetree/bindings/clock/sunxi=
-ccu.txt | 18 +++++++++++++++++-=20
> > > >> =C2=A0>> =C2=A0=C2=A01 file changed, 17 insertions(+), 1 deletion(=
-)=20
> > > >> =C2=A0>>=20
> > > >> =C2=A0>> =C2=A0diff --git a/Documentation/devicetree/bindings/cloc=
k/sunxi-ccu.txt b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt=20
> > > >> =C2=A0>> =C2=A0index 68512aa398a9..4a4addff595d 100644=20
> > > >> =C2=A0>> =C2=A0--- a/Documentation/devicetree/bindings/clock/sunxi=
-ccu.txt=20
> > > >> =C2=A0>> =C2=A0+++ b/Documentation/devicetree/bindings/clock/sunxi=
-ccu.txt=20
> > > >> =C2=A0>> =C2=A0@@ -7,9 +7,11 @@ Required properties :=20
> > > >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun8i-a23-c=
cu"=20
> > > >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun8i-a33-c=
cu"=20
> > > >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun8i-h3-cc=
u"=20
> > > >> =C2=A0>> =C2=A0+ - "allwinner,sun8i-h3-r-ccu"=20
> > > >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun8i-v3s-c=
cu"=20
> > > >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun9i-a80-c=
cu"=20
> > > >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun50i-a64-=
ccu"=20
> > > >> =C2=A0>> =C2=A0+ - "allwinner,sun50i-a64-r-ccu"=20
> > > >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun50i-h5-c=
cu"=20
> > > >> =C2=A0>>=20
> > > >> =C2=A0>> =C2=A0=C2=A0- reg: Must contain the registers base addres=
s and length=20
> > > >> =C2=A0>> =C2=A0@@ -20,7 +22,11 @@ Required properties :=20
> > > >> =C2=A0>> =C2=A0=C2=A0- #clock-cells : must contain 1=20
> > > >> =C2=A0>> =C2=A0=C2=A0- #reset-cells : must contain 1=20
> > > >> =C2=A0>>=20
> > > >> =C2=A0>> =C2=A0-Example:=20
> > > >> =C2=A0>> =C2=A0+For the PRCM CCUs on H3/A64, one more clock is nee=
ded:=20
> > > >> =C2=A0>> =C2=A0+- "iosc": another frequency oscillator used for CP=
US (usually at 32000Hz,=20
> > > >> =C2=A0>> =C2=A0+ not the same with losc)=20
> > > >> =C2=A0>=20
> > > >> =C2=A0> This is called the internal oscillator in the datasheet, i=
t would=20
> > > >> =C2=A0> probably make more sense to call it that way in the docume=
ntation too.=20
> > > >> =C2=A0>=20
> > > >> =C2=A0> This oscillator seems to be clocked at 16MHz, so we should=
 represent=20
> > > >> =C2=A0> it as such.=20
> > > >> =C2=A0>=20
> > > >> =C2=A0> And I'm wondering, are you *sure* that it's fed directly f=
rom the=20
> > > >> =C2=A0> internal oscillator, or goes through the registers in the =
RTC, with=20
> > > >> =C2=A0> the 32 divider and 16 prescaler by default that makes it a=
t roughly=20
> > > >> =C2=A0> the same rate (31.25kHz).=20
> > > >>=20
> > > >> =C2=A0In fact I know nothing about it -- I only represented the co=
de in BSP=20
> > > >> =C2=A0clock driver.=20
> > > >>=20
> > > >> =C2=A0The mux value 3 varies from SoC to SoC. For A64/H5 it's 3200=
0,=20
> > > >> =C2=A0for A33 it's 667000 (seems to be directly the internal OSC, =
as the=20
> > > >> =C2=A0user manual says the internal OSC is 600~700kHz; but it's na=
med=20
> > > >> =C2=A0cpuosc rather than iosc in A33 BSP clock driver); for A80 it=
's even=20
> > > >> =C2=A0PLL_AUDIO.=20
> > > >=20
> > > > Where are you getting those info from?=20
> > > >=20
> > > > As far as I know, the A33 PRCM takes the hosc, losc, pll6 and CPU=
=20
> > > > (internal) oscillator:=20
> > > > https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/drivers=
/clk/sunxi/clk-sun8iw5.c#L508=20
> > > >=20
> > > > The H3 takes the hosc and losc:=20
> > > > https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/drivers=
/clk/sunxi/clk-sun8iw7.c#L379=20
> > > >=20
> > > > The A80 takes the hosc and losc:=20
> > > > https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/drivers=
/clk/sunxi/clk-sun9iw1.c#L281=20
> > > >=20
> > > > The A64 takes the hosc, losc, pll-periph0 and the iosc, which indee=
d=20
> > > > seems to be fed from the internal oscillator with the divider in th=
e=20
> > > > RTC:=20
> > > > https://github.com/longsleep/linux-pine64/blob/lichee-dev-v3.10.65-=
bsp2.0/arch/arm64/boot/dts/sun50iw1p1-clk.dtsi#L19=20
> > > > https://github.com/longsleep/linux-pine64/blob/lichee-dev-v3.10.65-=
bsp2.0/drivers/clk/sunxi/clk-sun50iw1.c#L603=20
> > >=20
> > > But then in sunxi_init_clocks function, the iosc clock is initialized=
=20
> > > as a fixed clock with 32000Hz.=20
> > >=20
> > > The clock node in BSP device tree have a compatible of=20
> > > allwinner,fixed-clock, but not fixed-clock, which makes it not able=
=20
> > > to be really probed.=20
> >
> > That clock is registered:=20
> > https://github.com/longsleep/linux-pine64/blob/lichee-dev-v3.10.65-bsp2=
.0/drivers/clk/sunxi/clk-sun50iw1.c#L1193=20
> >
>=20
> Oh yes, but conflicts exist between the iosc registered in
> clk-sun50iw1.c and described in sun50iw1p1-clk.dtsi . The former is
> 32000, and the latter is 16000000.

No, it is 16MHz / 32 / 16 =3D 31.25 kHz=20

> What should we do then?
>=20
> (Maybe it will be better to temporarily ignore this mux, as it's
> difficult to finally find out this correct mux...)

That is not an option, we will not be able to fix it afterwards.

What we should do is getting an actual idea of what's going on, and
not just hacking something together hoping it will work.

You can start by figuring out how the Allwinner clock driver actually
works and / or by trying the various muxing options with something you
can measure the frequency with. The i2c or uart coupled with a scope
or logical analyzer would be a great fit for that.

Using the PRCM timer is another option and you can measure the
frequency it counts at.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--yaukvc7i6m76ilvo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY2RfjAAoJEBx+YmzsjxAg0XEP/3e7oGvfZtFBmkSFUL15CWtI
qpjrwEOuRrKvD4JoEED4lCYt46al0Flr1Y3J4xBy+ivDuA20mQxaUYwRMogDEiaX
If9fV2M67my8nnql1omJQWP+9wPBwmKpXueWrEWRLcQMbhXwJsgbrz1xP26crKbA
DapY7NV19KJVsZjaBFN+TTipSQ5BSuzEme8I7W5wf3CDaqMr2V+0cSA/44O+wzzT
+lHbZ5wqZAQJJ59SXi59J4+y/DUT2QNBIOHGnONXQYhs4n5eu8NzRSl7w1+6rO0r
bi5fOrUn6A/TkTrvE9YO8En0GVHsexBplw5E37tZUNHF4JlEMyn8zFEVWrZadgBB
MkZfGAHKDkTY8DRKr2FR9qd3QM1ODCdGzS5BmWh2sWMU3vXnxCRJthQydf7V43jz
z5ZqlnD+Qsh+hI7BtweeqBOYqxAqwN/jV8eHTkbH5t1v+Z3bp2qA6/wnuL/ag81j
J4RFnHdg1LQoR4A9f2fWggF0JWfhlWUqUQb9EB2b3Cz6C8gsVaGQ3z3UV6UHSrs3
R+6ZAi08kH9aBGtJTMmeDG+mnd6rAFYUc7wJILmcnvq9j/xnt65ZseOTkVNsP8op
bbsp9b6NxKg+gbsRDQXWb86EodWYK+25Cw1bPbmOhNZcwoga3kBUjPAfvgFRoRit
ucandP47f5JvPTLpGBaQ
=8fqg
-----END PGP SIGNATURE-----

--yaukvc7i6m76ilvo--
