From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: sun8i: a23/a33: drop bl_en_pin GPIO pinmux in
 reference design DTSI
Date: Mon, 20 Mar 2017 09:31:23 +0100
Message-ID: <20170320083123.qwetsg6hxjbylmai@lukather>
References: <20170317212315.2561-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1737859591597162841=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170317212315.2561-1-icenowy@aosc.xyz>
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1737859591597162841==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n7zvqezc6zthw7ty"
Content-Disposition: inline


--n7zvqezc6zthw7ty
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 18, 2017 at 05:23:15AM +0800, Icenowy Zheng wrote:
> The bl_en_pin GPIO pinmux is configured as "gpio_in", which makes it
> conflicts with the real GPIO usage (out), and makes the backlight not
> usable.
>=20
> Drop the GPIO pinmux for it, thus this GPIO can be correctly used.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--n7zvqezc6zthw7ty
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYz5NbAAoJEBx+YmzsjxAgGG4P/j3v8R1s6YxI4KWqWkWNBx1Y
4n93NZo3PhZcjp9lqa1eDcw6oh1TH8PmrqEcri912yYiwTqeKIPf6tb+iyUodD+2
6HE43vRTey4aj1m3fmpwonRTyjU8i5RTf2KmLN+SCmhveDLSO9ERy3d6zWmTBzlH
sLtxmhxjUZWQcRwrywRlLi64aj7y8f7WEUZ7Zd7lxqsj3ElaJ5n4wcRwiKlpJbBV
CUqpATiUV4YFxTWyXnHtDWH2KuVlb42PUcHRWcZWflxSysVKPurDrGV/HZTXrLwL
SRtxwoutHSnz9w0Qxa7GTm7NAx378+f7FBMpsQJbhH92ugKO5xX91VPXz/evtgpW
HqT7pX6kpP0jMRlh3ryuQa7G3oyyfZCm/BlWIvordxakbSpi/HA8I8KhqW7KgiQw
Q1iWiMRuRWOLQl+vVF0vd0yO2GifSxoU9J5+JOeT+KZEVmvZScPzlo9FLFMSiujz
9ow915J5NM7ueikmr9zngDFq+LVPJIgUN0AgjS3c8E7pDJ+IhDK861M3RkJVh8p1
5j0U/ou/WlAfRYBP4YF1qBrAikk5RjKj2xrKPOJNhi5FG56VHigBNYrTK/OeocAo
BnN+9kgV8QV/wuf5BPwUGmOGa03KRv5vvSXvJpTLGqEyQmZpjB/QOjs+IxGqxnTN
NGH1LsEV3GmpCWtKhJAS
=PcbN
-----END PGP SIGNATURE-----

--n7zvqezc6zthw7ty--


--===============1737859591597162841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1737859591597162841==--
