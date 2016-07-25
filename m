From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 06/14] ARM: dts: sun8i: Add cpu0 label to sun8i-h3.dtsi
Date: Mon, 25 Jul 2016 10:51:23 +0200
Message-ID: <20160725085123.GH7419@lukather>
References: <20160623192104.18720-1-megous@megous.com>
 <20160623192104.18720-7-megous@megous.com>
 <CAGb2v66eskVAxdz8VtjBJBCO7VV9WL4bdFDVrPWrSmxk4RASCw@mail.gmail.com>
 <adaf7f61-af80-cc02-8c47-af721b86f81e@megous.com>
 <CAGb2v665O75vQEfo5WdWtWJSbKEbLi6MBAHbgZC7pyrOCOu+6g@mail.gmail.com>
 <20160625070208.GA4000@lukather>
 <49ce09ae-052a-bb2b-ce66-f0aa0d0024e3@megous.com>
 <e57eb018-ef31-408e-84b2-b329510352d0@googlegroups.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pfTAc8Cvt8L6I27a"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBDFG266AKGQE5SYPWCQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <e57eb018-ef31-408e-84b2-b329510352d0-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Thomas Kaiser <thomas.kaiser-HBiBh4CdNZE5WgrkcBd8vg@public.gmane.org>
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, wens-jdAy2FN1RRM@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--pfTAc8Cvt8L6I27a
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2016 at 07:10:54AM -0700, Thomas Kaiser wrote:
> Hi,
>=20
> Ond=C5=99ej Jirman wrote:
> >
> > We have boards that have 1.1/1.3V switching, only 1.3V, fine tuned=20
> > voltage regulation and every such board will need it's own set of=20
> > operating points.=20
> >
>=20
> Yes, and Allwinner's current BSP kernel code might encourage board makers=
=20
> to implement a forth variant: switching between 4 different voltages=20
> through GPIOs.
>=20
> Currently we have 4 boards that rely on the simple '2 voltage regulation'=
=20
> all using 1.1V/1.3V: Orange Pi One and Lite and NanoPi M1 and NEO. Then=
=20
> there are 2 devices with (legacy) Linux support existing that use no=20
> voltage regulation at all: Banana Pi M2+ (according to schematic using 1.=
2V=20
> but in reality it's 1.3V VDD_CPUX) and Beelink X2. And according to Tsvet=
an=20
> if/when Olimex will release their 2 H3 boards we have two more with fixed=
=20
> but yet unknown VDD_CPUX voltage (since olimex fears overheating maybe th=
ey=20
> use 1.1V or 1.2V limiting max cpufreq to 816 or 1008 MHz). And all the=20
> bigger H3 based Orange Pi use the SY8106A voltage regulator being able to=
=20
> adjust VDD_CPUX in steps of 20mV allowing VDD_CPUX to exceed 1200 MHz (a=
=20
> reasonable value seems to be 1296 MHz since above throttling will be an=
=20
> issue without active cooling)

Ok, good to know. I'm not sure overclocking is ever a reasonable
solution, but that's a separate topic.

> Things get even worse since Xunlong uses copper layers inside the PCB to=
=20
> spread the heat away from H3 so Orange Pi One/Lite do not overheat that=
=20
> much like eg. NanoPi M1 (and maybe NEO -- can tell next week when I get d=
ev=20
> samples to play with). So while eg. Orange Pi One and NanoPi M1 switch=20
> between the same voltages in the same way we (Armbian) found that we have=
=20
> to allow M1 to downclock to even 240 MHz since when testing with legacy=
=20
> kernel really heavy workloads led to throttling that low (even CPU cores=
=20
> were killed at this low clockspeed -- same applies to BPi M2+ and Beelink=
=20
> X2)

And that's what I really want to avoid. Even though that board
absolutely requires the 240MHz OPP to run properly, nothing prevents
from using that OPP on other boards as well, that will also benefit
from it. Thermal throttling is something that needs to be handled, but
power management is also something we should consider, and I see no
reason why not to have a consistent set of operating frequencies, even
though the voltage might differ depending on the regulator
capabilities.

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

--pfTAc8Cvt8L6I27a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXldMLAAoJEBx+YmzsjxAghywP+wRO1AvxNTFAJbBkmMJagUQc
++3LXpnqF+1VJYFMd38pYIgbLo6YktKrBl+9d0fTDlnsgP/AzY9IFUtiIysl8Fla
c1jweTxMMuPZX7qTYfKxka54G4toi4imhCD51IkCw3IrKPnF1qi3Pr0/s1IPi3AA
Ty95eZiPtTpqkvIQwUqngNJq2igwU9aH2v3VmiPaMRlwx6krNU/hiES04EYf7V7i
A2h5xzXuv2UxghtoXyYjRGg2rjSIJsCU2bsscQAKHYZc0xmw/wNQmgFg0iIccZIg
+dQ42j1SXI+0OD/8PhQbYJElxi1qSs8oMUEi229sRDX/kaQAYEFeuJU13A0X+aEA
dmkYq6oFlQkDx9K1ioNpgeEUT0+L039WGk+wG2tS9oDlQEh9mhrBiNULy/taYiTT
uJjaLPeP8hDb8tUk8j/eDKFhUmS++7C4COzy9qHgH7MYwsspbdXw7zEQOhcrSgck
oCBwxsj2MTWbc9cnxMAdROxD4741gLI+6fSQcn4zZ/59fap5fFYQHVzVcUYifmPW
GHDurKms07Ag8mKNLYyf3F7BEl0ASZ3f587fa678ry9Kk0tszCtlc7ZHQmBLO/7x
2BgsYwk5OcQj0q5PeV7L0tFdXrcYNJK4vtqTtF0cKY10MaJgK8HL/+HqKBo/PG79
zr7E14Bo6O3Cm1GVh3fl
=1rwt
-----END PGP SIGNATURE-----

--pfTAc8Cvt8L6I27a--
