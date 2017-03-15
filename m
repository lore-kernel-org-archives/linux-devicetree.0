From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 1/2 RESEND] power: reset: Add Gemini poweroff DT bindings
Date: Wed, 15 Mar 2017 22:11:16 +0100
Message-ID: <20170315211115.bohi4z5fzwze43tu@earth>
References: <20170312223601.2952-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3557619455072879331=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170312223601.2952-1-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: openwrt-devel@openwrt.org, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, inux-pm@vger.kernel.org, Janos Laube <janos.dev@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============3557619455072879331==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3iir3cxoicpdpdkb"
Content-Disposition: inline


--3iir3cxoicpdpdkb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Sun, Mar 12, 2017 at 11:36:01PM +0100, Linus Walleij wrote:
> This adds device tree bindings to the power management controller
> in the Gemini SoC.
>=20
> Cc: devicetree@vger.kernel.org
> Cc: Janos Laube <janos.dev@gmail.com>
> Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>
> Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Sebastian: please just merge this when your are pleased
> with it. I will funnel the ARM parts through the ARM SoC tree.

DONE.

-- Sebastian

--3iir3cxoicpdpdkb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAljJrfMACgkQ2O7X88g7
+poIkBAAo+rVrhFRpPdX71PzKxhbLyuLN6l4fFySk61eik8iZ6iG34tcmBKVpByX
J7eR/onu1bmtRo/Z+Ryr4eIAZ2a32/hpDI0pFxUuXC4f3Ea4kXLvtArC5WMqwq68
U27dv9kNC8DhBWCoPv+BHs4P11iAXkg5+G1jEkRflmwHJZ+rMO8Mc5mx1SKMEmEE
V/6cwliQmaN+l3C8F60TuXn1mZOelvN9GpyB6bmVrPKLA6k3wsrBc8fcPq/UVedI
xgWwfnXlIS8gGeJYLkgDK6GPlT75R+n6y2m84eiEoIN1lfV43pk+wKzpKGJpBtHR
ir9oVjwkQSGN/mkjv7ou/WRnqJnC/enzOnDBGINjgKLbmfzQKUURSUHbHSSbRjIN
T/RkGAPseFFF3EbcLDd0MaSHYniijAH7BI6Dn9oZtdZxp6bFzJKtynhNy7NBGHLW
VcZA1w45H6QY8GbcDVLmoDoBZxbgDkLFwVN0lUyVa9wx+vA0ViF8qQiZac5zYHpz
26qReUGHon78lCw2I9qZVxHma+9Nlx2T/bOGVD/hHoiyikD82P33PlUt6PyjIpso
GU11JIOQ/OBBcBk4Khe3vRr1ymoqjQuoSynd9C1p9B/chwhNFBOS0fup9v4q9U9X
ADKlh6Bj2I7NBQseTRcTztL7VQjErtv5Z83tyQdbGj+nSDrSWEA=
=Lngv
-----END PGP SIGNATURE-----

--3iir3cxoicpdpdkb--


--===============3557619455072879331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3557619455072879331==--
