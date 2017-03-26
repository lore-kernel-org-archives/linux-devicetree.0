From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: update device tree
 binding for Allwinner PRCM CCUs
Date: Sun, 26 Mar 2017 15:10:37 +0200
Message-ID: <20170326131037.qkimsobykxxqgxee@lukather>
References: <20170315172808.64011-1-icenowy@aosc.xyz>
 <20170315172808.64011-2-icenowy@aosc.xyz>
 <20170321074117.vdfjynauuuv6fivp@lukather>
 <115431490120542@web34g.yandex.ru>
 <20170322200923.tcr7yqnfqj2zk2v7@lukather>
 <997781490224623@web30o.yandex.ru>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ux36ylmx6s73wmgm"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB45C4PDAKGQERMALBCQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <997781490224623-6UiXEAGCWRVxpj1cXAZ9Bg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ux36ylmx6s73wmgm
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2017 at 07:17:03AM +0800, Icenowy Zheng wrote:
>=20
>=20
> 23.03.2017, 04:09, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> > On Wed, Mar 22, 2017 at 02:22:22AM +0800, Icenowy Zheng wrote:
> >> =C2=A021.03.2017, 15:41, "Maxime Ripard" <maxime.ripard@free-electrons=
.com>:
> >> =C2=A0> On Thu, Mar 16, 2017 at 01:28:04AM +0800, Icenowy Zheng wrote:
> >> =C2=A0>> =C2=A0Many Allwinner SoCs after A31 have a CCU in PRCM block.
> >> =C2=A0>>
> >> =C2=A0>> =C2=A0Give the ones on H3 and A64 compatible strings.
> >> =C2=A0>>
> >> =C2=A0>> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> >> =C2=A0>> =C2=A0---
> >> =C2=A0>> =C2=A0Changes in v2:
> >> =C2=A0>> =C2=A0- Add iosc for R_CCU's on H3/A64. (A31, A23 and A33 see=
m to have different
> >> =C2=A0>> =C2=A0=C2=A0=C2=A0clock for mux 3 of ar100 clk. Investgations=
 are needed for them.)
> >> =C2=A0>>
> >> =C2=A0>> =C2=A0=C2=A0Documentation/devicetree/bindings/clock/sunxi-ccu=
.txt | 18 +++++++++++++++++-
> >> =C2=A0>> =C2=A0=C2=A01 file changed, 17 insertions(+), 1 deletion(-)
> >> =C2=A0>>
> >> =C2=A0>> =C2=A0diff --git a/Documentation/devicetree/bindings/clock/su=
nxi-ccu.txt b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
> >> =C2=A0>> =C2=A0index 68512aa398a9..4a4addff595d 100644
> >> =C2=A0>> =C2=A0--- a/Documentation/devicetree/bindings/clock/sunxi-ccu=
.txt
> >> =C2=A0>> =C2=A0+++ b/Documentation/devicetree/bindings/clock/sunxi-ccu=
.txt
> >> =C2=A0>> =C2=A0@@ -7,9 +7,11 @@ Required properties :
> >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun8i-a23-ccu"
> >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun8i-a33-ccu"
> >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun8i-h3-ccu"
> >> =C2=A0>> =C2=A0+ - "allwinner,sun8i-h3-r-ccu"
> >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun8i-v3s-ccu"
> >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun9i-a80-ccu"
> >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun50i-a64-ccu=
"
> >> =C2=A0>> =C2=A0+ - "allwinner,sun50i-a64-r-ccu"
> >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "allwinner,sun50i-h5-ccu"
> >> =C2=A0>>
> >> =C2=A0>> =C2=A0=C2=A0- reg: Must contain the registers base address an=
d length
> >> =C2=A0>> =C2=A0@@ -20,7 +22,11 @@ Required properties :
> >> =C2=A0>> =C2=A0=C2=A0- #clock-cells : must contain 1
> >> =C2=A0>> =C2=A0=C2=A0- #reset-cells : must contain 1
> >> =C2=A0>>
> >> =C2=A0>> =C2=A0-Example:
> >> =C2=A0>> =C2=A0+For the PRCM CCUs on H3/A64, one more clock is needed:
> >> =C2=A0>> =C2=A0+- "iosc": another frequency oscillator used for CPUS (=
usually at 32000Hz,
> >> =C2=A0>> =C2=A0+ not the same with losc)
> >> =C2=A0>
> >> =C2=A0> This is called the internal oscillator in the datasheet, it wo=
uld
> >> =C2=A0> probably make more sense to call it that way in the documentat=
ion too.
> >> =C2=A0>
> >> =C2=A0> This oscillator seems to be clocked at 16MHz, so we should rep=
resent
> >> =C2=A0> it as such.
> >> =C2=A0>
> >> =C2=A0> And I'm wondering, are you *sure* that it's fed directly from =
the
> >> =C2=A0> internal oscillator, or goes through the registers in the RTC,=
 with
> >> =C2=A0> the 32 divider and 16 prescaler by default that makes it at ro=
ughly
> >> =C2=A0> the same rate (31.25kHz).
> >>
> >> =C2=A0In fact I know nothing about it -- I only represented the code i=
n BSP
> >> =C2=A0clock driver.
> >>
> >> =C2=A0The mux value 3 varies from SoC to SoC. For A64/H5 it's 32000,
> >> =C2=A0for A33 it's 667000 (seems to be directly the internal OSC, as t=
he
> >> =C2=A0user manual says the internal OSC is 600~700kHz; but it's named
> >> =C2=A0cpuosc rather than iosc in A33 BSP clock driver); for A80 it's e=
ven
> >> =C2=A0PLL_AUDIO.
> >
> > Where are you getting those info from?
> >
> > As far as I know, the A33 PRCM takes the hosc, losc, pll6 and CPU
> > (internal) oscillator:
> > https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/drivers/clk=
/sunxi/clk-sun8iw5.c#L508
> >
> > The H3 takes the hosc and losc:
> > https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/drivers/clk=
/sunxi/clk-sun8iw7.c#L379
> >
> > The A80 takes the hosc and losc:
> > https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/drivers/clk=
/sunxi/clk-sun9iw1.c#L281
> >
> > The A64 takes the hosc, losc, pll-periph0 and the iosc, which indeed
> > seems to be fed from the internal oscillator with the divider in the
> > RTC:
> > https://github.com/longsleep/linux-pine64/blob/lichee-dev-v3.10.65-bsp2=
.0/arch/arm64/boot/dts/sun50iw1p1-clk.dtsi#L19
> > https://github.com/longsleep/linux-pine64/blob/lichee-dev-v3.10.65-bsp2=
.0/drivers/clk/sunxi/clk-sun50iw1.c#L603
>=20
> But then in sunxi_init_clocks function, the iosc clock is initialized
> as a fixed clock with 32000Hz.
>=20
> The clock node in BSP device tree have a compatible of
> allwinner,fixed-clock, but not fixed-clock, which makes it not able
> to be really probed.

That clock is registered:
https://github.com/longsleep/linux-pine64/blob/lichee-dev-v3.10.65-bsp2.0/d=
rivers/clk/sunxi/clk-sun50iw1.c#L1193

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

--ux36ylmx6s73wmgm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY173FAAoJEBx+YmzsjxAgy7kP/3zhZpf2dfg6vF/Ny3nbmou5
SBQqqpOd1l4HbvxN4M/zYXTZVDULFyMpda3vnzfiNfYmBF7TQvPXPGVfVrCUAepg
B3P9OEyjjxS8FxpR4depSDlFkXakvNtkffQeEpqv4jeQ19FwyI2sXPEmjvI0NsDg
9ocYS3/quUPyhuuJuDihlU14MabMisUwAMz+GYa0UDagp5BqnW4OL2k2U6KuGJ+4
hfh8ie4XSSgkgL2BVa/lzKvFpyErfAa7Uw27tFyPYQKdJjCF+aK4n+jKdqD7H6Yf
hM6oeatHpelJA9OhD5DdJKN5l1mLvxRtjOZYY4DD3Q209CqKGiYPSklOliyPSAWX
tF4iAHdEzWiunncGTmO9R56Rddz5pe+4LzN4S+RxCIP/QnZdFzSlRt7JRaNs1ds9
cXUJo9GgAP7QUg2Oq4ZdnNhzKZFLrwVY5GkAQCNKFS5S8q5QPfe6SlZ151bkkyFs
/9zQxL7XDjPIEkRQWHGS17dITqeZUgZ45MFKpQwvPEqkh6tmXUtMkQ0zJq6D+8kp
GCN1dnqvU3wbyuDbgHqE1INh22dXTP2yHHNTWeN7M7/VGd9Aan220Ib1njXOdzoA
NwDA8YSr5lNFNBLgvPEjpcczBQt0YQhtJMHGJIfsSu25oUTxowjBhr+QxdljeoE9
rPHf7JsfaZsGp+B+hS9f
=AlEq
-----END PGP SIGNATURE-----

--ux36ylmx6s73wmgm--
