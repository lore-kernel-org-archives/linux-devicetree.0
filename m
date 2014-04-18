From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/6] regulator: arizona-ldo1: Add processing of init_data
 from device tree
Date: Fri, 18 Apr 2014 18:39:24 +0100
Message-ID: <20140418173924.GU12304@sirena.org.uk>
References: <1397638902-7576-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1397638902-7576-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7U1RSSkRXGczHgJj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1397638902-7576-4-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--7U1RSSkRXGczHgJj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 16, 2014 at 10:01:39AM +0100, Charles Keepax wrote:
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>

Applied, but again you really need better changelogs - processing of
init_data for what?  For most regulators init_data is handled totally
transparently so this isn't normal.

--7U1RSSkRXGczHgJj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTUWNJAAoJELSic+t+oim9MjkP/RnP/zjU6sXXm8wclKFZXc67
iETLVzdf4ix0BS7/oB2TIeXQ14iujDyn+gw+UB68WnTc/F/A4P2dzw/TgEX2kOJH
gRpug53VyoKyC0dD242xt05BAyBmzIoVRI3vTAInKph7Ov+viwRf8pD3aIRKCXL4
/ibETP5u7Ovf+TXvjDqN+Th1GZkdcse+2Ku9Fj8ADgTWS8RfONFi1p91T0KwRlUQ
D7wfWTk8DruW/OMX+3t4IXfO5acPRWhJp3SZqwZVGGajKODaSm6yPAuW0LVFFF/N
AElLgUEGal7M552ZPFWaixp0i7EUnokO4nQeUVJRXRMbdN2di2c5Vuonlm3C8RBN
iJzJlKudSdRehA58tOEfKiURe5HBw1TQK3hbgfIfhPGjfKlt81c6ATyQusdcGDJy
6hwxUf+nYWvAqaDy177Ch2tjMYoum4IDYHBiILjmXn/38jV7gA2K+YOHPV0zRpwf
LxuA+01cgrrRyXIBJFS8wI+RXFKF7YF8QtZAj8RrjoTJwSKWFXFDlqIJ8uqdKhhu
euMepxazB6O4iQFqo0dIEUqR/NIqxMNuYlPYEmldqTflavn3lO+OF/5AXMfUeX4o
I2x2ZcqtGP8g3rrrTStuw5MqJ0c2JI3IK0JILAzbd3LVZbasy1GU1pidq0TrNnry
VlIMxzuJFfMIQXr+f2/q
=iVCr
-----END PGP SIGNATURE-----

--7U1RSSkRXGczHgJj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
