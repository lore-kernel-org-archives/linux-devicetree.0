From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 0/5] arm64: allwinner: h6: Enable AXP805 PMIC on Pine
 H64
Date: Thu, 5 Jul 2018 11:41:00 +0200
Message-ID: <20180705094100.ezydvbitowwe5pwf@flea>
References: <20180705031106.344-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1062594378914858130=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180705031106.344-1-wens@csie.org>
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
Cc: devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org


--===============1062594378914858130==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lshr46ipidxaztwx"
Content-Disposition: inline


--lshr46ipidxaztwx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 05, 2018 at 11:11:01AM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
>=20
> This series enables the AXP805 PMIC found on the Pine64 Pine H64 board.
> The AXP805 seems to be identical to the AXP806 when comparing datasheets.
> The Pine H64 uses the PMIC in stand-alone or "self-working" mode, using
> the I2C interface. Neither features are currently supported. This series
> adds support for them, and then adds the PMIC to the device tree.

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--lshr46ipidxaztwx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAls956sACgkQ0rTAlCFN
r3QPGxAAkqvk2NxHg8A1mWq6LKMSnaNqOYiOyTfkWRw9rQKPVMwg9TBclxhzibki
UFtF+suGzRBalFCZhoafJZ+MiLn8fdeTVx/pJV+whDEKAdt1J5EMFglv8zijdg7t
ketVmG5BhVLAG4mvMnPUM4VKymlBIbuG9czFZeFD9CNRj9wpi+KJllVyEM1thr/3
yyvYQvie2261CjwEc1n2ioPDOgKXbq/NsYfx/51l7qHxbHbtrnV2BeNB7xbbX4Fk
ntuAu03bp6hzC6e/KXyv0kJ4EoXeoJsWeT8aPUMrO08EmPvKnctt3SH3QiEmvGOY
oYdCV+1PMNzg1oaVA2oJlUuTq+joL7EAwsC8ZesM2ZBfk47V9/ZWp51NCeOyqmS2
MrcA/M1ajcvVdvdjR3WqBNvqCQ7cvdmfohm7pIc/62W+JcIgRbdCTE+VDBk8Nbvb
uh28bigi8ZxLgP3sn7ZXkb2yNN8ejA3mZLW/Sysu8a46Sn11FJSw5/22jj0IBYlT
Mm94F5D2DhZWgX5oZ5DKzy5VT0W2QNu4KFASAk/I6k3BUhJkcPcwKn2M9HNsQlgR
r16Pxm3j7ymXF+XyJnY5dOhTmaZIalHWq/jJ1Yx0U+ZbxcXc3ni5QEsoenEmFbUK
Q4kWw34n9MiuO6NpadlLVvHGMq39D2Dbuge8or1zRy0Rmm0FIU8=
=NtZT
-----END PGP SIGNATURE-----

--lshr46ipidxaztwx--


--===============1062594378914858130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1062594378914858130==--
