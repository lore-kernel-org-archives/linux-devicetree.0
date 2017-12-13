From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 4/4] arm: dts: sun8i: a83t: Set timer node to use phy
 timer
Date: Wed, 13 Dec 2017 11:59:18 +0100
Message-ID: <20171213105918.tah3ihvmropmeu5g@flea.lan>
References: <20171211075001.6100-1-mylene.josserand@free-electrons.com>
 <20171211075001.6100-5-mylene.josserand@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wfsikcsn4qtmrfl3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171211075001.6100-5-mylene.josserand@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>
Cc: wens@csie.org, linux@armlinux.org.uk, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, thomas.petazzoni@free-electrons.com
List-Id: devicetree@vger.kernel.org


--wfsikcsn4qtmrfl3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 11, 2017 at 08:50:01AM +0100, Myl=E8ne Josserand wrote:
> By default, virtual timers are used. These timers need an offset
> that must be set by firmware, for example. In case of SMP support,
> after a reset, this offset is in "unknown" state and produced
> a hang of the kernel.
>=20
> Use "arm,cpu-registers-not-fw-configured" property allows to use
> physical timers instead of virtual ones.
>=20
> Signed-off-by: Myl=E8ne Josserand <mylene.josserand@free-electrons.com>

Your commit log could be a little better, something like:

"
The ARM architected timers use an offset between their physical and
virtual counters. That offset should be configured by the bootloader
in CNTVOFF.

However, the A83t bootloader fails to do so, and we end up with an
undefined offset (which in our case is random), meaning that each CPU
will have a different time, which isn't working very well.

Fix that by setting the arm,cpu-registers-not-fw-configured that will
make Linux use the physical timers instead of the virtual ones. One
possible side effect would be that the virtualization features would
be disabled. However, due to the way the GIC has been integrated in
the system, it is already unusable so we're effectively not losing any
feature.
"

The commit title should be improved too.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--wfsikcsn4qtmrfl3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAloxB/4ACgkQ0rTAlCFN
r3TFHA/+Js42XtFnTP5NBvioER97S6IwB9WM/Fvv/iUfaDyG1HhXm6zh5rArGhUN
v5SUUXIL8B5rOJBqOC7BMMvMiBrvmXrM2hXNk7x0EPijaIq89EvtBlzlTfqjP858
keRx1oyLMBr46Vd5bFi9IMut0IZN9lc+1amVTqZ2z69qMV5/8RLD6b78D+Y8vGB2
1n0tCLtB5D7CyGACdAd9LAciI2tGcFdWC5VJpPPgT0Ghdll/tAwSPpUzcpeK+uwO
v/9GF9yL9fD6gwcCcHcTORT1LUUM/Aq4gu3gSCK8wTmUn03NJLy3ipM3Xjm2cTQA
10EKVnor8eYAJlE6WygRRzP0mSpquRtom+rSqQlu3AM71mmgrz9p5c3N4XZ5iZ9U
4/eh8lRQs4dH/8yLvOX4LRXtWfWnY5l2aRIW9wBnFfyOOrJYpCKvqGV62wdCi7nW
ksvLol4lvbgfTMX6JhaaDE+LXqtoFo482RzeigTK1dSkA6rTK/dywNcMCSMTzMXC
309jIkN5OUWXmy9hk0dplVMRMeWv/ys+K2g5vtdGyt3oECkeZ/6UeNP2WKJ0Pgyi
DXjfwHYbyXUQxzLNfc8p35pwJflHggTCor1hTUpPwASoSKIz4b5YGLf3nPzqoZ8b
UY0SqYh1Y5K+IQo/gjrs6S3JpsvUdbOGHQVPlAYjG+/ciF/726U=
=Y82Q
-----END PGP SIGNATURE-----

--wfsikcsn4qtmrfl3--
