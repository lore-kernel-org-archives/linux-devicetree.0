From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 00/16] Implement H3/H5 HDMI driver
Date: Fri, 2 Mar 2018 10:38:46 +0100
Message-ID: <20180302093846.blpdniawybhu5ank@flea.lan>
References: <20180301213442.16677-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1091337731=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180301213442.16677-1-jernej.skrabec@siol.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie, mturquette@baylibre.com, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sboyd@kernel.org, wens@csie.org, robh+dt@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1091337731==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qcw2lpw65bzxxh3p"
Content-Disposition: inline


--qcw2lpw65bzxxh3p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 01, 2018 at 10:34:26PM +0100, Jernej Skrabec wrote:
> This series implements H3/H5 HDMI driver. It was tested on OrangePi 2 (H3=
),
> OrangePi Plus2e (H3) and OrangePi PC2 (H5) with many resolutions and it
> works well.
>=20
> Code is based on linux-next, next-20180228 tag.

Applied everything, thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--qcw2lpw65bzxxh3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqZG6UACgkQ0rTAlCFN
r3Re9g/5AQjjrcTZxuLO+1CQ3T/NgCvDja/mNVg+iZTRJHNVWlITF9bpC0svC0rd
vOIYMIGBccHimVMSssOxtJiTVBlv2TwZfqDv3+u3M4HMa7n+fz2CFS4n+TuWF3uq
FmqUvj7TU9VIM0M2XRz4JPwa+b9RrAr6hDiILgyneuw1zK8ZWgVpfarN1s3SZweK
FAHHgS2ZKWTZ9shyhp3xqq/qEUyqSsNWlvrVVQEJxR9a+cTFTNyzAji4FPNfh/N4
i0qF5LKl9WH9T+PpAXpW6r0OEEqgGuxGuhXHusnmkctiM+XwmbueNwAs0zTQ2a90
Vv8gzVV/YIkSRIQXFhj/dTcGhSl5F+gpzApZK85X8uA/ASMsYwqjOfVpIohcai6R
Tp5JKWb/nj20m3+8IqYK+Ouaoi1g/taRwrUZxXqqaKn93JZ/N7t397SLP2nVAEsJ
SL6lNhEMW+lbk/k8kLsMTUc7EL03yOj38pf8p+Drunb4bSLz2ckEGu+6ae+rS8NO
8fT7fvo+lVsm1f68bAbe8iQSwfG214e4qh9agr5v7N/QeXhXnlwerT3vl7qV2xKG
UkVvIWn0ayk48m7yn9V7oIJh97lnNZrzQGdUzu45z2cqDJmN1DHIIO4acbs9E3X/
nf5nxrON8nQu/VRMgUolz806Z6F1ZCItlweeDTEj+U2tZET7ssE=
=2g5K
-----END PGP SIGNATURE-----

--qcw2lpw65bzxxh3p--

--===============1091337731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1091337731==--
