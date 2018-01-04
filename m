From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 0/8] ARM: sun9i: SMP support with Multi-Cluster Power
 Management
Date: Thu, 4 Jan 2018 15:58:38 +0100
Message-ID: <20180104145838.qk5sbtg3vjg33txt@flea.lan>
References: <20180104143754.2425-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xtt3sqz4iux7esfv"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180104143754.2425-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mylene JOSSERAND <mylene.josserand@free-electrons.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Nicolas Pitre <nicolas.pitre@linaro.org>, Dave Martin <Dave.Martin@arm.com>
List-Id: devicetree@vger.kernel.org


--xtt3sqz4iux7esfv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 04, 2018 at 10:37:46PM +0800, Chen-Yu Tsai wrote:
> This is v2 of my sun9i SMP support with MCPM series which was started
> over two years ago [1]. We've tried to implement PSCI for both the A80
> and A83T. Results were not promising. The issue is that these two chips
> have a broken security extensions implementation. If a specific bit is
> not burned in its e-fuse, most if not all security protections don't
> work [2]. Even worse, non-secure access to the GIC become secure. This
> requires a crazy workaround in the GIC driver which probably doesn't work
> in all cases [3].
>=20
> Nicolas mentioned that the MCPM framework is likely overkill in our
> case [4]. However the framework does provide cluster/core state tracking
> and proper sequencing of cache related operations. We could rework
> the code to use standard smp_ops, but I would like to actually get
> a working version in first.
>=20
> Much of the sunxi-specific MCPM code is derived from Allwinner code and
> documentation, with some references to the other MCPM implementations,
> as well as the Cortex's Technical Reference Manuals for the power
> sequencing info.
>=20
> One major difference compared to other platforms is we currently do not
> have a standalone PMU or other embedded firmware to do the actually power
> sequencing. All power/reset control is done by the kernel. Nicolas
> mentioned that a new optional callback should be added in cases where the
> kernel has to do the actual power down [5]. For now however I'm using a
> dedicated single thread workqueue. CPU and cluster power off work is
> queued from the .{cpu,cluster}_powerdown_prepare callbacks. This solution
> is somewhat heavy, as I have a total of 10 static work structs. It might
> also be a bit racy, as nothing prevents the system from bringing a core
> back before the asynchronous work shuts it down. This would likely
> happen under a heavily loaded system with a scheduler that brings cores
> in and out of the system frequently. In simple use-cases it performs OK.

It all looks sane to me
Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xtt3sqz4iux7esfv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpOQR0ACgkQ0rTAlCFN
r3Sy5g//TZs7B/BSXol06Jnyhlg/OQq0TgqLFGV76DIw7cyGXGknzmODGibP3Ylf
pYaiPTS+LCYWbkezgGTury4ic+g2SoteCd8OUiqDZGR/LiOafI9R4FFIA02HgdF+
oYCSmCvUBalFS8iSNJazGfj0CcLtq9zwyWuDO2S3h2JaL+Bz4MuHfQw3wN4P3ki5
WkRABZnPRaoZI9g9OpVssY/x7WmLUD1252Y/f2cU2kz0VjRrvJSJmf3s3dB78sIH
LsidcS6rvl7Qb8Qpq4KokOQkGpYaOprMuXuxL8KwcBKjFlCeRDp7h/jbJsa/ejSq
ll+hMJtQ9CPxGopL0jNByZQEa0/Uud+a5VOZxryQV0rwN9XYsCir4iIRuJEMj34/
AxXntX1ZAhe5r3o8qWrqQ6nVGVWO2PmpQPKa1V+NmepA1nABCJPRmXl2JFqiYC8m
/8TBEisq1p/gyAZkNyAZL84Vyh6wvpwZNaVh/XzQVsiTebVDCWwYwMihOtG1nNYh
AxxLoXFk8I8EjsJkQwXs6MFpZ1hVCnprUuZUVavRaZXa1V86/3EC0fWwDzVvHDq1
3XhIHh2S8li5IbyrFnQuwfV6NZnVBmNBSefOs7/xseN/Mhks7C+ZSEC/f95vDVSS
Gij72u+hyALFW0y0KHHiwb8qNmTZSU4MFEvRb1PUQQEFLxVxcf8=
=sDJ/
-----END PGP SIGNATURE-----

--xtt3sqz4iux7esfv--
