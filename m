From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: fix for Allwinner H5 pinctrl's
 compatible
Date: Thu, 2 Mar 2017 09:26:07 +0100
Message-ID: <20170302082607.gztuixghoyk5wabv@lukather>
References: <20170301180111.12365-1-icenowy@aosc.xyz>
 <20170301180111.12365-4-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7861721113945299821=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170301180111.12365-4-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============7861721113945299821==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ffqtllv7qfxhomgl"
Content-Disposition: inline


--ffqtllv7qfxhomgl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 02, 2017 at 02:01:09AM +0800, Icenowy Zheng wrote:
> The compatible for Allwinner H5 pin controller is wrong written as
> allwinner,sun50i-h5-r-pinctrl, however, it's really a generic pinctrl
> rather than a "r" one.
>=20
> Fix this compatible string.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ffqtllv7qfxhomgl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYt9ceAAoJEBx+YmzsjxAgFS8QALogbk+gscbjeSo0hdT9/II/
DNsTzv4SrNyi7gv9jlqSAhqFkEtzV5trN0YiQYqWPLLzeLJtEfRZbz2eZwK9LJvJ
NuhlTo3b1sg704x4AQ5OVcgix0TuK3nuJ4TjuOfyoB2Y4zZ6oY/oQPNJ/WoHAP1s
L8q3fJs1Fb0R+TkANI2AzpDoDVT48UqapBc+BX/z/3RIBHDqNvA9HKf2HzDu56m4
wFqSIJr9LszlhmlKOlaNyvp4+Q3f/FTi1+VsrhuELfrk4yYYEbY8nTPxCt+1TZRO
Rxo5MEGz9XNp9HzFFVqEegpJVidB0CMMYYM/VuGwo8aZEG9d4buHQ3yhCnteWcP1
SD8hOKiVY5F/wUpNGVq1ZSp64CGgQGhbAm0xlbf/foiA4WHfNPoi0JmBDtku/iy+
+UMOOJSVH7NksU/PoVK6oKIOCrNH/MM55OWQoOwmfwcaG8cSE6YA3bqYv6KGReTd
Ruju872QuQQQ42bkG333kYooDsgFvp6nADQnrdNVlpqmDbpkbHq/luRG+lakDUFu
M91bBlG5L+WMWIweZFnitz0lQhF/suKPJjgyBD4qRPXcb/Tr7sFBnR4ymx6TAQWx
0baakP0Cmgsm7XugUiPyc8lP7bKpbqCidOsh1d+p8t5ile0LXtpAbuhnEpDdTbiN
sfFsWG2TxWU0NY6pMViM
=tBjd
-----END PGP SIGNATURE-----

--ffqtllv7qfxhomgl--


--===============7861721113945299821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7861721113945299821==--
