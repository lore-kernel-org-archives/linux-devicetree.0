From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCHv5][ 2/8] staging: imx-drm: Add RGB666 support for
 parallel display.
Date: Fri, 6 Dec 2013 14:14:04 +0100
Message-ID: <20131206131403.GA30960@ulmo.nvidia.com>
References: <1386268092-21719-1-git-send-email-denis@eukrea.com>
 <1386268092-21719-2-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2274553092747057077=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1386268092-21719-2-git-send-email-denis@eukrea.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Denis Carikli <denis@eukrea.com>
Cc: Marek Vasut <marex@denx.de>, Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Eric =?utf-8?Q?B=C3=A9nard?= <eric@eukrea.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, David Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, Shawn Guo <shawn.guo@linaro.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Sascha Hauer <kernel@pengutronix.de>, linux-media@vger.kernel.org, driverdev-devel@linuxdriverproject.org, linux-arm-kernel@lists.infradead.org, Mauro Carvalho Chehab <m.chehab@samsung.com>
List-Id: devicetree@vger.kernel.org


--===============2274553092747057077==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 05, 2013 at 07:28:06PM +0100, Denis Carikli wrote:
[...]
> diff --git a/drivers/staging/imx-drm/ipu-v3/ipu-dc.c b/drivers/staging/imx-drm/ipu-v3/ipu-dc.c
[...]
> @@ -155,6 +156,8 @@ static int ipu_pixfmt_to_map(u32 fmt)
>  		return IPU_DC_MAP_BGR666;
>  	case V4L2_PIX_FMT_BGR24:
>  		return IPU_DC_MAP_BGR24;
> +	case V4L2_PIX_FMT_RGB666:
> +		return IPU_DC_MAP_RGB666;

Why is this DRM driver even using V4L2 pixel formats in the first place?

Thierry

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSoc2bAAoJEN0jrNd/PrOhHrwP/RHuIytU1Sx350RAonwEhjbe
hZZycaxb+1j5FPvcDhAW3Sx9+sTpqZlYFJMaT7YV5v87Wq0wfKN/oA3HYdOpJFwc
rmBcPw6Y+s4gXZPkdJcyD8y2rpaUZiyVKCNoTABuk3n+Ubpft9hqVsIX4Yry6Q/G
5Dn3okFO7CtIXbp4f45lJ14bCD+/g+akN8jOY3q3rwrfrgKkG2x+6LGEvxlKJbao
ZmitgdO1BrgkPNzJZIGU/odsIjLyPWXsCJa7Did3J5x5ajIoZq+LJkPkrvos7A4u
wIQZKjx9vMVgiVaaykLq8mgtbT0Q+68HVDad1Dw2XNuvbEmbpfsAbw/dcTVheSq3
7YHJLOCTM7vnW1BsxuQeKizRjJMg24tcNCqowD/oWEIZjDonoGruRBz5pC6y6csV
yg3m0pSkGkD25K5lZmAuJ/opLDUy4r7v9zTeMytqssyPeC6PjLKGdDzXXs79OHE+
DeXlnGA9xUt8fUx7SXy+MXspcGND/WQFsg1ZgPTv3/i21/uk7rmAuH0EijDJNh12
eXXqc6b7vLJ5n5wEPODRzn5j6wkTbDPn1kxe3oojWaLseda54uLZvVLfxBx/mOJG
cQ3GhkvL9tlRBtJ8Qp7AB+VIE5dSWLKa29c8A0tFKGlm5vR+fTCwWP9mfE85p3Pl
qSqMDDYRWZ9ML9/ZGffL
=pGqH
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--

--===============2274553092747057077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============2274553092747057077==--
