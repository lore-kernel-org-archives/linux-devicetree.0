From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: sun8i: add a delay after reset xr819 on Orange
 Pi Zero
Date: Tue, 20 Dec 2016 19:58:20 +0100
Message-ID: <20161220185820.r5jmrac4toywk6te@lukather>
References: <20161220055826.30725-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5020706907191359650=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161220055826.30725-1-icenowy@aosc.xyz>
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
Cc: Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--===============5020706907191359650==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="37wetu5slina6jjx"
Content-Disposition: inline


--37wetu5slina6jjx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2016 at 01:58:26PM +0800, Icenowy Zheng wrote:
> XR819 seems to need a delay after its reset line to be deasserted,
> otherwise it may not respond MMC commands correctly, and fail to
> initialize.
>=20
> Add a 200ms delay in the mmc-pwrseq.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--37wetu5slina6jjx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYWX9DAAoJEBx+YmzsjxAglRIP/AhrzRFoavwsCZKyMVz1fdLL
hYacVKp9uE7gpKTvIc88E66kC17Un2wnR4AIiz6tiC9GN1kMlCcGqzIQTVefCC1v
xWVh4Xt9/QPnolOc4EZUEI6aiZbbKiPOGd5RptxCSXtjM9YjQPfj+QxZpQ7cLS04
Hx8T++OmKN8EiGGMhtpUgXrLvG9O4wRAKPOIG4r0Y98NWa5KIdsS5s+Ibxz/xbL8
zp1pN3vCB6jXE88eci1m+2BXID364oQsgbkLUa4W9Z1t9G8E7PbJdgzsXoqcalpv
IqbeludQqgMMHvHP7sE7in+QO8CN/hYFkqdiVM3j6kmTWFNo/PqiK3FApjH5AyRw
WWCN8yOJpzk6x9ggNoCJUL/A199LpxS/Q/rR1SO0cNVGUrLshnWT7z3u55OMdnly
1tzKjpWtd9C9Nwu9Z8Y7z4zdQ7ym+sJlzoqMvFufePsGXumL7mYb8C1rXeF+Hzsv
sBhPaeu/PAWWFOEuA4StWArSVKLFhRmQsldNuNnVAvxJS324IgVeyN6UIR8qGfS9
HoX5YCz5ydKQQ6v+D+kMo5UGWBm0H8ETHSGgmHCGibKney0ahFwdDyM5mXQCw+Fr
HB8VjVoF+4X2YRX0x14aJBWepy/20L3hGRJdO1pzePs/ShsQJZUWbYs4SvXhlolD
ck/75RMg/DdmMJZ46yIL
=ENTu
-----END PGP SIGNATURE-----

--37wetu5slina6jjx--


--===============5020706907191359650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5020706907191359650==--
