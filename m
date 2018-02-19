From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 7/7] ARM: sun8i: smp: Remove the disabling of CPU0
Date: Mon, 19 Feb 2018 09:54:08 +0100
Message-ID: <20180219085408.5to43p7jbtijx4q3@flea.lan>
References: <20180219081837.15482-1-mylene.josserand@bootlin.com>
 <20180219081837.15482-8-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2609233806834620112=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180219081837.15482-8-mylene.josserand@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@bootlin.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, quentin.schulz@bootlin.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, clabbe.montjoie@gmail.com, thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============2609233806834620112==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n3avigllm7j4bwce"
Content-Disposition: inline


--n3avigllm7j4bwce
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2018 at 09:18:37AM +0100, Myl=E8ne Josserand wrote:
> On sun8i-a63t, hotplug CPU for CPU0 is currently not working.
> Remove the possibility to disable CPU0 only for sun8i-a83t.
>=20
> Signed-off-by: Myl=E8ne Josserand <mylene.josserand@bootlin.com>
> ---
>  arch/arm/mach-sunxi/mc_smp.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-sunxi/mc_smp.c b/arch/arm/mach-sunxi/mc_smp.c
> index fec592bf68b4..69d5ae5b3d72 100644
> --- a/arch/arm/mach-sunxi/mc_smp.c
> +++ b/arch/arm/mach-sunxi/mc_smp.c
> @@ -661,8 +661,12 @@ static int sunxi_mc_smp_cpu_kill(unsigned int l_cpu)
>  	return !ret;
>  }
> =20
> -static bool sunxi_mc_smp_cpu_can_disable(unsigned int __unused)
> +static bool sunxi_mc_smp_cpu_can_disable(unsigned int cpu)
>  {
> +	/* CPU0 hotplug handled only for sun9i */
> +	if (of_machine_is_compatible("allwinner,sun8i-a83t"))
> +		if (cpu =3D=3D 0)
> +			return false;

This also means that you have a window in your patch sequence where
you can disable the CPU0 on the A83t. This patch should be earlier.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

--n3avigllm7j4bwce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqKkK8ACgkQ0rTAlCFN
r3Txuw//UM3frw2Utw0Qi37IMTm2va2eh/yqzkQaYi1bZE29+XDQiAwxyLNb+066
efCWddCxIvxoFANfZ+95+NoccGYXtU3Csg36+40AV84xpxOLEp3HR8+ueH5GFhL6
oh9mxmrQ/eZMYKVEp97u4Dft7H0TdTpPF8qDppzdqGVmZFpXzjjdxGUTArQrDpik
Z1Hl3rGDubNy20LXlcxvBhXpBamrZhMjO4uk1tjqvNR1tFX5AXDZGI81FFTVBcX0
VYWq+NcGIW0bOTbtgJM6QY8m8aC5O4siQ35VMPU69HqQ2VpMn0w07gMkBYH32YUj
4OGuKFCCHTFThE0TCD0LgooVxwVU/7V8pfIQxKgDIb88TiepCh6fx0IdBYRXbyeH
YvFpy8R/DGnKNuLrDkVHiBsfv3Ia5bvWpoDakMzi7ykSeivuZc+gvsnyWz5zhXcN
iEVi13Sx6HNUYXwcNqGCA8I3MOc3abn+xm2tQGWIJUtVimo2X8hyjVTE0d5YtQnh
xN7eUo5hWmAHFqpKMXK4eHsS7bdm257XArKiANQHt0rOQpwEJ0TiPnE3ffAP9vbI
GW9F0KMPICLEXYhsg8luP1r1F3MHTSzGi7LyP5OFN+X+ILNEPhYes/SfO5bLG8nC
VQm+ds/noz326rlZT/hlUVWbWYiZjWrgBzGjSm4pjo1vRThuwd0=
=eZxo
-----END PGP SIGNATURE-----

--n3avigllm7j4bwce--


--===============2609233806834620112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2609233806834620112==--
