From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/3] Simple DVFS support for Allwinner A64 SoC
Date: Thu, 28 Sep 2017 12:28:30 +0200
Message-ID: <20170928102830.uuicirbjb5q64vwz@flea>
References: <20170923001531.14285-1-icenowy@aosc.io>
 <20170925101027.lghnnll4h6inreqm@flea.home>
 <27EF78BD-6285-4D8D-AA65-8294D797E2FB@aosc.io>
 <20170925102744.qixfwlheeimemhcf@flea.home>
 <9b3aeb6cb155bb2f9a7cee438de82ccb@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="okv7m74fz5ndo6kz"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBWM5WPHAKGQEBWNBY6Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <9b3aeb6cb155bb2f9a7cee438de82ccb-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--okv7m74fz5ndo6kz
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 27, 2017 at 11:51:30AM +0000, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> =E5=9C=A8 2017-09-25 18:27=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > On Mon, Sep 25, 2017 at 10:12:09AM +0000, Icenowy Zheng wrote:
> > > =E4=BA=8E 2017=E5=B9=B49=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=
=8D=886:10:27, Maxime Ripard
> > > <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
> > > >Hi,
> > > >
> > > >On Sat, Sep 23, 2017 at 12:15:28AM +0000, Icenowy Zheng wrote:
> > > >> This patchset imports simple DVFS support for Allwinner A64 SoC.
> > > >>
> > > >> As the thermal sensor driver is not yet implemented and some board=
s
> > > >> have still no AXP PMIC support, now only two OPPs are present --
> > > >> 648MHz@1.04V and 816MHz@1.1V to prevent overheat or undervoltage.
> > > >>
> > > >> PATCH 1 is a fix to the CCU driver of A64, and the remaining patch=
es
> > > >> set up the device tree bits of the DVFS on Pine64.
> > > >
> > > >How has this been tested?
> > > >
> > > >What tasks did you run, with what governor, etc...
> > >=20
> > > I only tested manual frequency switching between 648MHz and
> > > 816MHz, and tested the PLL stuck issue by change the OPPs to
> > > some random value.
> >=20
> > Ideally, we should test that it's actually reliable. Poorly chosen
> > OPPs might lead to corrupt data that you might not get before a while.
> >=20
> > Please test using:
> > https://linux-sunxi.org/Hardware_Reliability_Tests#Reliability_of_cpufr=
eq_voltage.2Ffrequency_settings
> >=20
> > And post the report.
>=20
> ```
> root@p64 [ cpuburn-arm@master ] # ./cpuburn-a53 &
> [1] 2543
> root@p64 [ cpuburn-arm@master ] # ./cpufreq-ljt-stress-test
> Creating './whitenoise-1920x1080.jpg' ... done
> CPU stress test, which is doing JPEG decoding by libjpeg-turbo
> at different cpufreq operating points.
>=20
> Testing CPU 0
>   816 MHz ............................................................ OK
>   648 MHz ............................................................ OK
>=20
> Testing CPU 1
>   816 MHz ............................................................ OK
>   648 MHz ............................................................ OK
>=20
> Testing CPU 2
>   816 MHz ............................................................ OK
>   648 MHz ............................................................ OK
>=20
> Testing CPU 3
>   816 MHz ............................................................ OK
>   648 MHz ............................................................ OK
>=20
> Overall result : PASSED
> ```

Great, thanks!

Can you put that in your cover letter for the next version?

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

--okv7m74fz5ndo6kz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIbBAEBAgAGBQJZzM7OAAoJEBx+YmzsjxAgVioP9R+3YZc4vlF8S5n8Mftfir0Z
IDXLvnxTW6Wc2m6YY6PnjCqFgoYvtfeDYYbAkAVECi7gQFAEcmquPXO5l9tRzDsF
PzKKfY5r2R4GgaESqFGGaj1RHQNwWYIp5ZypZUgrxE0dMnVSLht41dLIFD73dx41
J4yGlVJVWjpp2dfvGFkNZfj02nwtHv5K9h3HXYPWVABcfetiVBSINm7+YaoaBI/H
oIsjTxKwarpOjERf8F9WXv5Fp0mePyGJ4LDUaMbV3j+LaP6n+4M2UhmZvCX1LNry
4ZgFwO1/3NJkZBVCI4vwyAU5GAWZOOn9gQPStYnRQfYWV3fRBqRNIhdUBDFnJ8Hp
wdpO81NBvd2WJa1JFJNr6LE6c7bNbJl+EROPuzYuOY9SVufgKmWGiG5iXupT0Gp8
03z0FMUCIR7azfaqOeG/X9ZsA8Tt3j+SNun3wdSF6b9jK4rzzFXP4XMR7EZHu/TC
m+d6oJZpH3y0/khObn+mFU6098jRZudvZyhbnqp5fLMcrOPknAiEXY1z7/JCnuyr
pklia5U2aIGxABdI7ixCkztUQ6FX2MbHzGXh7L14s07GSInRQJVdyGZ1IYcMC3Do
rNL7KQF0jKeg+jSjuGNKGWNwKr1iDf7iEsXhm5ycEp6RG+dMnBlrXC25QUqt7yNb
Les3DYaZz7LpmkXguFU=
=9FAH
-----END PGP SIGNATURE-----

--okv7m74fz5ndo6kz--
