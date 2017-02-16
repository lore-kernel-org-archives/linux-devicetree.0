From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v6 5/5] ARM: dts: sun9i: Initial support for the Sunchip
 CX-A99 board
Date: Thu, 16 Feb 2017 19:32:28 +0100
Message-ID: <20170216183228.3xgsy3idjgyw2boe@lukather>
References: <cover.1486592470.git.rask@formelder.dk>
 <d4211c5d57f80b0281d7d332edc7d69e66202d3d.1486592471.git.rask@formelder.dk>
 <20170210085920.7l7gswm6yjuqgdfx@lukather>
 <CAGb2v64AfBW+CHHkFvvNzCGBG09UK-sPcAZi2QgCR9wM=jguxw@mail.gmail.com>
 <20170214233538.enkffjiw3kkfromu@localhost>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5011104771315463410=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170214233538.enkffjiw3kkfromu@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rask Ingemann Lambertsen <rask@formelder.dk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============5011104771315463410==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="psm2gqhv6ahsr7q7"
Content-Disposition: inline


--psm2gqhv6ahsr7q7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2017 at 12:35:39AM +0100, Rask Ingemann Lambertsen wrote:
> On Fri, Feb 10, 2017 at 05:22:21PM +0800, Chen-Yu Tsai wrote:
> > On Fri, Feb 10, 2017 at 4:59 PM, Maxime Ripard
> > <maxime.ripard@free-electrons.com> wrote:
> > > Hi,
> > >
> > > On Thu, Feb 09, 2017 at 12:34:06AM +0100, Rask Ingemann Lambertsen wr=
ote:
> [...]
> > >> diff --git a/arch/arm/boot/dts/sun9i-a80-cx-a99.dts b/arch/arm/boot/=
dts/sun9i-a80-cx-a99.dts
> > >> new file mode 100644
> > >> index 0000000..f5496d2
> > >> --- /dev/null
> > >> +++ b/arch/arm/boot/dts/sun9i-a80-cx-a99.dts
> [...]
> > >> +     pmic@745 {
> > >> +             compatible =3D "x-powers,axp808", "x-powers,axp806";
> >=20
> > As you mentioned elsewhere, they are not really compatible.
> > You should drop the latter compatible.
>=20
> The compatibility is good enough that it works fine with the driver that
> went into kernel 4.9 and 4.10. Using this device tree file, I have built =
and
> booted 4.9.9 and 4.10-rc7 kernels as per the instructions here;
> https://linux-sunxi.org/Sunchip_CX-A99#Linux_kernel
> Likewise any other AXP806 driver which doesn't touch the register at addr=
ess
> 0xff will work fine.
>
> So, the disadvantage of removing the "x-powers,axp806" compatible is that
> it breaks on two kernel versions where it works fine with the compatible.
> What is the advantage of removing the "x-powers,axp806" compatible?

This works fine for the features you tested, which are the
regulators. All the other features of the PMIC are untested, and might
or might not change, so you really don't know about the overall
capability of the PMIC with another model.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--psm2gqhv6ahsr7q7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYpfA7AAoJEBx+YmzsjxAgghAP/i81/yZnzUZbsEvsrlUbssiK
ggZrcCQuTi1hhJivmjI9DUUAUhvIzphv///rGJQc+zb1KIbNk0OiWlL7ckIoO5IO
Pcij8xY/hWNa1EPTE2WuY5x0uUmVArCWNKpWtInKlH5ZH2uNE9pF1I/sM5Oy2MQ2
cMq337UuX9h1AJe5zwnSZFHsEnyYii/JkzdKbzOPwK5dmE5nJL/Fol7CALlbBVYT
nLsLKLrOwF+p51ysG/eOdZjvEKIOrVTTr0yo5yHf/ihST0BaxciGRIqb4zp2uUUL
Tz+gYNxlTCrEmngXbRLVMP3TYtfSNV5xdeg4dWebwkIs80+nad9YXc43Ordyzs/v
N8phsLFFIKzKvSxzNt3xJJ1qIR5FWWW8fQz+CC61iLcVjFwfPteC5f+rYtx+palL
jy2QQSxP2dnz1EB5WT8LnwJAvdcBZEVVQlQ18W5wbgOm+WjLsDyaLpBZISaCxGFB
42KYloFyrFmRn9abokKG2SdNv3cEuzHtZ0a5MKfckZLcyfxFm9xk7BM+fWA58Du/
cHu9zPkswTfVOAavHq9lbi6ZSVVIMJBjISzm3c31cgYBh6KaRZfq7UBv3rIzDjde
6eBVQzOm9+q3cGl4AuoKkO0qobKoUTy17p3hlXE0m0ocuyfXIrsgykrtr+LVv0/N
soZxw1k0ZJzLji/snw6s
=PsMC
-----END PGP SIGNATURE-----

--psm2gqhv6ahsr7q7--


--===============5011104771315463410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5011104771315463410==--
