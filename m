From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 00/10] irqchip: sunxi-nmi: Cleanups and fix A31 R_INTC
 register offset
Date: Tue, 6 Jun 2017 20:47:13 +0200
Message-ID: <20170606184713.4qxvap65o33rkzwz@flea.lan>
References: <20170606055932.22548-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1860001948059505052=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170606055932.22548-1-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org


--===============1860001948059505052==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mbkfhanm6bemdkip"
Content-Disposition: inline


--mbkfhanm6bemdkip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 06, 2017 at 01:59:22PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
>=20
> This is an alternative to Icenowy's recent A64 R_INTC patches.
>=20
> This is a two part series. The first four patches clean up the existing
> sunxi-nmi driver. Patches five and six add a new "sun6i-a31-r-intc"
> compatible, which mainly adjusts or removes the awkward register region
> offset the old "sun6i-a31-sc-nmi" compatible needed. The remaining
> patches fix or add device nodes for SoC's having this hardware.
>=20
> Using "sun6i-a31-r-intc" introduced in this series, instead of Icenowy's
> "sun50i-a64-r-intc" is preferred. This follows our policy of naming
> hardware blocks and compatibles after their first occurrence.
>=20
> The first six patches should go through the irqchip tree, while we
> (sunxi) can take the device tree changes after the driver has been
> merged, to avoid breaking linux-next as a whole.

For the whole serie:
Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mbkfhanm6bemdkip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZNvixAAoJEBx+YmzsjxAgEAgP/RPGS6+SSXB//UV1jvgjfThI
Tv/R9cZ8HI4RAorCftq+wPuhH07Ol4yZz+59+MQP9C2i5VIxyilHo3TU5ZLXT5kW
tp1Rr5Bl4J7ValByZhDLJF75Z6dfqXcNYr7i6fM3gUlUryVo2PX4SyJAXJ+2R4Zh
SjbVWk1BK5LMUV1TAnG46NfQuoNc3O0o9QGDlFyBadA1zAKG58/t+R2PSYyYH9Va
bfknOnL0xKCCkcEu8Ayc1p1z7DBjq3Nwi8ah3CEijzM5I4t67HureE3VIqkx7mIl
bEMRu3jADDA7IbDC5/m225x/xsCPErxcFAeZD7jVM4rvKXHj7S15fnBQmx7Ho33N
G4D1iMjLjgP3U4+29FFUEWZozoM03AfZb9e/DTn+LHFHNN/+4zbMmteKz14VVFS3
dVrHDU0plGcW1bOtdW9IqtADD6yRhSvt1RUkvebqHTW1wOJFb2muFRXEY8830jkM
9fmjA7YEIYtHEzIvkj9xa4FvxpCp+P9BUVOP82OAoqTWtaPXx2VP66p76efqmkDZ
jVi6hypAvTDfI+akaDpaGe9pRzZO77FR2XYNBFye2920j+g6cMwCScJ8apN3711u
zomP6cRkp3wjaH03eALqM3k4bTfe8OYS9orJeMwTWH+f1m4Sp6DyA9nDdH5K9+vr
DXpWsPF2+zn9f7v1uXyV
=awfE
-----END PGP SIGNATURE-----

--mbkfhanm6bemdkip--


--===============1860001948059505052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1860001948059505052==--
