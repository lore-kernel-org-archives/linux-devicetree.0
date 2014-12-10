From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH RFC 04/15] drm/dsi: Do not add DSI devices for the child
 nodes with input-port property
Date: Wed, 10 Dec 2014 13:21:07 +0100
Message-ID: <20141210122105.GC23558@ulmo.nvidia.com>
References: <1418200648-32656-1-git-send-email-Ying.Liu@freescale.com>
 <1418200648-32656-5-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1940123345=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1418200648-32656-5-git-send-email-Ying.Liu@freescale.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Liu Ying <Ying.Liu@freescale.com>
Cc: devicetree@vger.kernel.org, linux@arm.linux.org.uk, kernel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1940123345==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PuGuTyElPB9bOcsM"
Content-Disposition: inline


--PuGuTyElPB9bOcsM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2014 at 04:37:17PM +0800, Liu Ying wrote:
> The MIPI DSI bus driver would try to add a DSI device for a host's every
> child node which contains the reg property.  Unfortunately, the existing
> i.MX6Q/SDL MIPI DSI host device tree node's child nodes contain the reg

There aren't any existing nodes for the DSI host on i.MX. This patch
series adds support for them.

> property, but the child nodes are ports pointing to dedicated CRTCs.
> So, this patch phases out the child nodes with input-port property before
> adding DSI devices for them and updates the MIPI DSI bus OF binding
> documentation.
>=20
> Signed-off-by: Liu Ying <Ying.Liu@freescale.com>
> ---
>  Documentation/devicetree/bindings/mipi/dsi/mipi-dsi-bus.txt | 4 ++++
>  drivers/gpu/drm/drm_mipi_dsi.c                              | 5 +++--
>  2 files changed, 7 insertions(+), 2 deletions(-)

Sorry, but NAK. There's no need for this special-case. I'll go into more
detail in response to patch 09/15.

Thierry

--PuGuTyElPB9bOcsM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUiDqxAAoJEN0jrNd/PrOhVKgP/juzUrsAppVY2PtOlvuMiJBm
GphVtL7zCISpwBveA6NvoY7/i+j5VgpFHcMdOr5QQEPs7+CjbaHNJMPK6wVrT9m2
QjWpwBn+K2ra0oK4Lf4lPlBMhMlt6eYMkxJ2xJoRU0SK7BozWiCKvs807yA5wBcf
qhd+hv9/R/DwK0WZwU7SpgG3B0cv1ua4zvggNA0DQ6V/p9jqQKG9RJl6Cew2mF54
/up7H0GZv15BcdG8ZezwKulOGRkcV+G1qCXj041T+6TnDUnuIvQS1wop3yZY2wvT
DLdxDMxczVjKoBivoBmHWsogrl7vftpSZy0vvjh9Nqw+eLe16X2oMC/lNh9GdikQ
zpS7lhoNBQWgXyHZrv8HbZqQlNTsVR6NZuEi4j5YlTt15DuK7/R6oOf8RKHve0jP
jc5UvygOoRkiGh07iZjVo5sAv/r680yiFLuDA4YnkNaKUeDXoWph6OBx2/5KNTCS
qiYMjNWzY6dCupID9kINctV/DtOBoQZP+Z+vFmZCRE0xPt6x/u6kmj5M0dRcK0bj
SMMHSN4GvJL4+dvp3QXR3rb4bnlRNdrQ2UX+GPA0b/X28Aol50WOLvhx0eVKJdEL
KWzidhWCR+ygs0d4NAlPRzL/y3ARggwoSGJKrLDlcJBk4Y8MAmzlOiLLwjnmeYVw
8r3MbIrxfU7STF7njSt+
=ckC4
-----END PGP SIGNATURE-----

--PuGuTyElPB9bOcsM--

--===============1940123345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1940123345==--
