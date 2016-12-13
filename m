From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 3/6] ARM: dts: sun8i: add a cpu0 label to cpu@0 node on
 A23/33
Date: Tue, 13 Dec 2016 16:45:48 +0100
Message-ID: <20161213154548.qfbk4zd35n6tovpr@lukather>
References: <20161213152252.53749-1-icenowy@aosc.xyz>
 <20161213152252.53749-4-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8246735567648047028=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161213152252.53749-4-icenowy@aosc.xyz>
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
Cc: devicetree@vger.kernel.org, Quentin Schulz <quentin.schulz@free-electrons.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jorik Jonker <jorik@kippendief.biz>
List-Id: devicetree@vger.kernel.org


--===============8246735567648047028==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ik6geqlrhfiwixba"
Content-Disposition: inline


--ik6geqlrhfiwixba
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2016 at 11:22:49PM +0800, Icenowy Zheng wrote:
> A "cpu0" label is needed on cpu@0 for cpufreq-dt to work.
>=20
> Add such a label, in order to prepare for cpufreq support of A23/33.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ik6geqlrhfiwixba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYUBesAAoJEBx+YmzsjxAgbd0P/3sQIOWwd8IxOFA8MSjjoEyS
9bFPwIez39uRBHbksxbFvpdMormy54V1bafboyB27HW3U9oIXrR5+NLYObChEhwh
zW1QCP/l9PA2QYTql4aBlihA+2DbQMl1tlNtiY3Z5MDtsowFtyY+0qxkVhidP7tp
KCaEMr9CtMJLLikZcfV72NmxzOMaYSebqybyiS4etFosvZQNcBiDgOOMj5GPdDuu
m9qD5NsyCLq51Jeultup7Gwaz+zdDpnKc1TC3JNlF32rt86a2IYa4dZZHh7koYWy
niLSH+w8072/q4v82ViuZ4ANmJv5vznTGSfw/QHKhsjIJ0XZeYIhk/HT+nIK77qY
CDbfJUsPxS7BJsThLnbJjn42DOcqNWn4sCqtZQ+AJkvxifVEBhHyIhFZc04MRRum
OQ9Yq+IaajdM9I1uDifF0op2JsXSaI3FYwhOBuMU8qpzOpP0xjOcRb3FHEtGu852
98orThlKD2kLTo/kw3XLsO5N2q4oDV7DUWT96q73NMY4YEej419IAwo7GcYqi2tG
EZInqjsKe49WLQWoooRonDVrQASzk4GoMdHvTUWK6YwdiKkPEDo/TBbQ6DL/gz16
gIjrkRgm+KsBKAlde2B9IEK5VsMxW5CzkIpt9Qx8DrrL0YuhKo5V5lxe0w4/3Ots
HsUivSU0fcYCSoRwp2su
=VmUl
-----END PGP SIGNATURE-----

--ik6geqlrhfiwixba--


--===============8246735567648047028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8246735567648047028==--
