From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 2/6] arm: sunxi: add support for V3s SoC
Date: Fri, 20 Jan 2017 21:29:23 +0100
Message-ID: <20170120202923.p4uikl6nmhcza2sk@lukather>
References: <20170119175448.11445-2-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1648448172728808251=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170119175448.11445-2-icenowy@aosc.xyz>
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
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1648448172728808251==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4sykcdevuijc4uuw"
Content-Disposition: inline


--4sykcdevuijc4uuw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 20, 2017 at 01:54:44AM +0800, Icenowy Zheng wrote:
> Allwinner V3s is a low-end single-core Cortex-A7 SoC, with 64MB
> integrated DRAM, and several peripherals.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

This didn't apply. Please make sure to send patches based on my
current branch.

Fixed the conflicts and applied.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4sykcdevuijc4uuw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYgnMiAAoJEBx+YmzsjxAg11sP/0VPz830IZx5cS6A1ITcGqg+
aA7ZPQ4tmU89SVS6+2/PCEXEFBZrFXxd4EXb1urgZbtZGEyl/LC4AY4aHNbhrvpp
oBC1dZLwwWDf1CZD+Nsw5POGcHjmsA9CMETKx9n63HhvQz//JslethplUvDqdQaP
UPGwvuGZdDBH77sjvrJEvurVRZNaDjwQWgaRV9XCvx5K6/9esYJI8y5WoZ2MDmfx
UTD8z1GlS5oli/4CHYQ9jp9mSH8r7mj67Vgibd5fl3FJm78Dr0AFflpWz0FpxsF9
Wurw+1gAu/pITrZ9U9swySuvmVIV7sTRe8VRQGHeyPRNOAXg60pd6nknhp+1BtML
3iwEX8t0Opge7VlZoENGRlt2jwb55iUuTIbziab6O2DyOUjBiQyFLsRd8GuQg6PA
FbQUX2v4/b4nTP6y/QZQLiU8tJZyWp7wTjqo1qoaP3ZI8nWIfZ9yKHRmtnpqzE9n
Op8MiVzL2r0IezrvzgJfEhcQeW5tG6iZVCwIbsfrn5RTMI5dpbrp/cBYT/yFhUTN
JZTlJ+fIa5X4p1lhELJn9vYxHHf7URbqL1eRTOm0F3AGq5aal+6mPl6KWaJyhMKC
FBRd4bv++kgNdSJt5jL6HfARc1csdlZ5qy5zKDqNehif2SXrIcXoPdAJolk9Z6jT
k2RST4sDq1R4E/e1S+sw
=1OX8
-----END PGP SIGNATURE-----

--4sykcdevuijc4uuw--


--===============1648448172728808251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1648448172728808251==--
