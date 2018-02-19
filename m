From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 6/7] arm: dts: sun8i: a83t: Fix undefined offset with
 virtual timer
Date: Mon, 19 Feb 2018 09:52:05 +0100
Message-ID: <20180219085205.jh6bcmbzcxqffkhk@flea.lan>
References: <20180219081837.15482-1-mylene.josserand@bootlin.com>
 <20180219081837.15482-7-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4833618675298603748=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180219081837.15482-7-mylene.josserand@bootlin.com>
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


--===============4833618675298603748==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="swcqkmnxnqqwxqtn"
Content-Disposition: inline


--swcqkmnxnqqwxqtn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 19, 2018 at 09:18:36AM +0100, Myl=E8ne Josserand wrote:
> The ARM architected timers use an offset between their physical and
> virtual counters. That offset should be configured by the bootloader
> in CNTVOFF.
>=20
> However, the A83t bootloader fails to do so, and we end up with an
> undefined offset (which in our case is random), meaning that each CPU
> will have a different time, which isn't working very well.
>=20
> Fix that by setting the arm,cpu-registers-not-fw-configured that will
> make Linux use the physical timers instead of the virtual ones. One
> possible side effect would be that the virtualization features would
> be disabled. However, due to the way the GIC has been integrated in
> the system, it is already unusable so we're effectively not losing any
> feature.
>=20
> Signed-off-by: Myl=E8ne Josserand <mylene.josserand@bootlin.com>

One small nitpick on this one (and the previous one), arm in the
subject prefix should be uppercase.

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

--swcqkmnxnqqwxqtn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqKkDQACgkQ0rTAlCFN
r3SXPQ/9HiMOITN6rhCMOcwolM6if0cK1KZMFq1LLftQXV5N/6JUdehvV7aSZfC6
YRGq3Nmz33cgnwnZcuZzWTwSSCOwtQox2P6G91q5W/nT8cMvP+nS6j8RoNVAdxkn
SfqI+yJzAxkW9fJy2lWtohIzPRShorGlnkEhq9hK7/6W5dQtEXUEKvjrY2eW2RPy
UmV4XtPcXGb++A+mnLyTq7NtcYu4zFRkrierrVefi6GHFeHlxIlWqP2KdkpZl5qM
mV+pulcZhMT/7u8EwBYlJI/0eAPz7IkwzqCFAn4K3oV6RwXP4Icx0aejgbcMyspB
ySy4L1XxqzuB9zxZX/bPyeo9vFddMULl39w+K23Ivil0KIdo9Ec8aDegpSOa+4zW
z5fZkoJmMdYtA1ZPA9G2p9NHk4akNoEniZxhA3L2HmJ1wcXcYW8wOxLuGCHU/Len
SgiJyg0I+X5v4smtcNrvoILH9KcuvLzUjDFInqaiGCJyUWaoqbeNcer6UpX7in8s
kMVllEu6QXYaIrQ2khujCknj4InyMqv1pgIoOuYULbxxZ1g/B/UYng9okd3kw1Am
Oyakr/GgPLtE14cHmqBu9wLVkYclzvIULNVqzHvDWAgaGphw0JLtx8XKzeDfClfU
juEzyz1BaDY+zWYZ8eaoaZ2QGpBrK5xVFsl6z++20HykBUwsE0I=
=s1e8
-----END PGP SIGNATURE-----

--swcqkmnxnqqwxqtn--


--===============4833618675298603748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4833618675298603748==--
