From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3.1 00/10] arm64: allwinner: Add A64 DE2 HDMI support
Date: Fri, 27 Jul 2018 14:59:12 +0200
Message-ID: <20180727125912.e5js7krmthto6gmz@flea>
References: <20180726171257.6688-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0205767537=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180726171257.6688-1-icenowy@aosc.io>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0205767537==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="anrqhmutbeiy5itt"
Content-Disposition: inline


--anrqhmutbeiy5itt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 27, 2018 at 01:12:47AM +0800, Icenowy Zheng wrote:
> Allwinner A64 has display engine pipeline like other Allwinner SOC's A83T=
/H3/H5.
>=20
> A64 behaviour similar to Allwinner A83T where
> Mixer0 =3D> TCON0 =3D> LVDS/RGB/MIPI-DSI
> Mixer1 =3D> TCON1 =3D> HDMI
> as per Display System Block Diagram from the A64 user manual.
>=20
> This is third patch-set followed with previous RFC[1], first and second
> series[2][3] and merely concentrated on HDMI pipeline through TCON1 and
> rest will add eventually.
>=20
> I just rebased and slightly re-integrated the patchset according to the
> requirments of the maintainer, and added the mixer0->tcon0 pipeline.
> The further maintainship of the patchset still needs to be discussed
> between I and Jagan.

Beside the comment on the pine64, it looks good to me. Can you
resubmit those patches after rc1 is out?

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--anrqhmutbeiy5itt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAltbFx8ACgkQ0rTAlCFN
r3Rh4w//YULFl9J+chHjxWnvahKtcxglkDFlvK0R3Ht0O0wkegqgZci5c425DsnK
1ISyKxPobr41n6NRuwAje2hqwZte2DoSM3E/TQ749KtzcJGqJHc6jk07+t5oz7CT
JKi3xip659H/78FOhE/gXxc6XfgKVT+YzH2FbBAJL/Q8wid0O3INJiy+3oqX0ffV
RUtk23mAMLPe74ku8lvJKxlISZxaapB8W5515IN7oqJBoOfvTJVapQB2Mc/GJXN/
VsfbDvKKeYLUH9nd+no7iLVkbsb4Jr4byU2pxDCol/jh/t/91AXi7pbLaL4rzfko
XNiQzohYBbYoTnVIjmxVgYiL8bCI4MUFJ1FH0MCQiP2w0c4bxVSVKZEXzXIqtPaL
GfZDKGKYUHqiUz8+4LKgV6oNi2xhpD10dXS2H30Rd7rcpbQN9ROibBrdf+0iIvay
I0+upoQSS1AQcgUGyREum0dQq3QA0dqFeAV76LxXIntcXt2IZ4hw30GwDNBqhi3D
v/q2NceMeYxM12aAzVg9pkZwY6XGjn9ftdmvXzLLr2OR8+h22Y75dhA7FSEzEPLz
chxk4lAOyQWDezye0o0+wbEQXii7jxb/E3QLb7JF2EZ6awEG+7aakAuySkG1HJsG
518FmSA41GV4a/Wtc2+xrThNOr1MIBtgEFiZYzn/V4Kf4bRiV84=
=/5kr
-----END PGP SIGNATURE-----

--anrqhmutbeiy5itt--

--===============0205767537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0205767537==--
