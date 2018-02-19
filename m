From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 1/7] ARM: sun8i: smp: Add support for A83T
Date: Mon, 19 Feb 2018 10:04:01 +0100
Message-ID: <20180219090401.5uxmwtnkd7oadaxx@flea.lan>
References: <20180219081837.15482-1-mylene.josserand@bootlin.com>
 <20180219081837.15482-2-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3956790189730970349=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180219081837.15482-2-mylene.josserand@bootlin.com>
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


--===============3956790189730970349==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zurc3lyefgfkcgrh"
Content-Disposition: inline


--zurc3lyefgfkcgrh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 19, 2018 at 09:18:31AM +0100, Myl=E8ne Josserand wrote:
> Add the support for A83T.
>=20
> A83T SoC has an additional register than A80 to handle CPU configurations:
> R_CPUS_CFG. Information about the register comes from Allwinner's BSP
> driver.
> An important difference is the Power Off Gating register for clusters
> which is BIT(4) in case of SUN9I-A80 and BIT(0) in case of SUN8I-A83T.
>=20
> Signed-off-by: Myl=E8ne Josserand <mylene.josserand@bootlin.com>

This is some high-level review, but you should split this patch in
three:
  - One to refactor the current code to split the DT parsing function
    (and rename the function to sun9i_smp_dt_parse) and the variable renames
  - One to enable the A83t SMP (with the function called sun8i_a83t_smp_dt_=
parse)
  - One to enable the A83t hotplug (merged with your last patch)

Also, you're calling a lot of times of_machine_is_compatible, and this
is quite inefficient. You should call it once and store the result.

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

--zurc3lyefgfkcgrh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqKkwAACgkQ0rTAlCFN
r3QrKBAAjaZn7OSiihbmARgIRI8POZKPgg9l59UJTpkBIyxIkTI0Yn51BEeIFZ4u
F1gk2mc7d409A+c9TFwy8T2mg0HqFkCXCgo6vZO9Ze7duwFx6D3QC30NvKFzosy2
ijZxCR+WhF3itt8kPfKv8Wr4ir3sGiEd5kpS9hFm5A+pf8MSs+Pwz2ZUlXWI53s2
W2tpoRHlPQ/qCsTop6zArheZjr6Eui2Mz7l0uOUkegyhLGAUma1exYuokRqVNPOn
6i6Tw73ygv1rRctqc3nFRnS+mk+IpXg/+faLuKNw4OOCG8L3wlvaDF1GUriupHCz
BX/7e8Hx0lcN9S15LNUAhaUDJOeFVECInF3DjWnfn6Dd/PcEWbK6/smiBVNRHd9f
8Jo75G48lNA0ZR4I4cSZeZHkXmMq3sppolA4aOUh9cv1+x7Mx3o4tV7NDqH9fV9p
HDuEftIpllfqolYmtoIxZH6qMXOOZPh28VWWBqQG7nA9TBJxUWA0HgfELlIkjuNJ
Ei0JSpQ1NcTMmv/DUnMrM6seMtF1Ugzm45v3YRjHazyWZZrG76EfXWBthqB0uvZD
95Mz9tSUb0mPG0X66Jd8Ke9tVNCuQ8yFt1E9tDFZJK62dqAGiHL3lxf8okJrpkD/
LTYmCpaVNNzAmm6cjK3sXCSxgbvOpVJaQXGYaW3O8+vEvyJCt6g=
=2H89
-----END PGP SIGNATURE-----

--zurc3lyefgfkcgrh--


--===============3956790189730970349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3956790189730970349==--
