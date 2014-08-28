From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/7] Adding Skyworks SKY81452 regulator driver
Date: Thu, 28 Aug 2014 12:02:54 +0100
Message-ID: <20140828110254.GN17528@sirena.org.uk>
References: <1409222307-23225-1-git-send-email-jack.yoo@skyworksinc.com>
 <1409222797-23343-1-git-send-email-jack.yoo@skyworksinc.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9oYvVerlq//e2GY1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1409222797-23343-1-git-send-email-jack.yoo@skyworksinc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gyungoh Yoo <gyungoh@gmail.com>
Cc: lgirdwood@gmail.com, grant.likely@linaro.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Gyungoh Yoo <jack.yoo@skyworksinc.com>
List-Id: devicetree@vger.kernel.org


--9oYvVerlq//e2GY1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 28, 2014 at 07:46:37PM +0900, Gyungoh Yoo wrote:
> v2:
> Added 'compatible' attribute in the driver
> Added message for exception or errors.

This driver has already been applied, please send any changes as
incremental patches against current code.  I would *not* expect to see
a compatible being defined for a MFD function device though unless it's
genuinely reusable.

--9oYvVerlq//e2GY1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT/wxaAAoJELSic+t+oim9IYkP/1ioNxcqKjuuHpYrXdJL2X+T
Xe9ActSrZEZTgEgBYd67Pid+tko+D1EqYTcsPGnBM8zcdhx529A88gCxKPCNK6yW
m93W11Iqm5mUfhvQw8ZU/dJ3Ui8vlzGJOxrax4wZUfa2PBRuV16GE5oMpuLn0dXv
q3nyccCbdLlirGiD7PeEcSZy+N5FWGl0ndOqbbhpxVRPCVovLsGww69beOEje69O
2Ze++w9nPsMNFYC/MYMGrwDpJZZpkqSBbOa2RYcWij2PND9Nr7Jha8nnOpk57nmV
gLCsws9/miOMGYEt9qCBals2m+xjJvOEPtoHAbVQ1aYryREgDyf+UVuWk77N61gA
b8TwXPgarI5CwIy02OZprphQJ7wtDpzSLBdOljXw9Wc92m855eObWWwSO0+eeI3e
SxnmBua2kJ/jn01jdd0698njLzg41i7wpqE0PqxnJjL5bT1VNQnY5Zre31tlk5Qy
O48mnaRP61SEAG4V02Ul/2NjaNpWUrpnO8HvG/t6v3KdReGLCa0Ti5T6rUfxSvdx
UaXO5nF+9aBfbWWzvbBJxzdA8a0VA5XdrWSLo5i4h43DnF0OK1nKU0bWe2Mctxh+
vKQRqwPomqpPlLqBkRqWZ3IlJt6qoWQUlZp/7ANgaVGb+xj8+HxyCHWOIsiK8B7k
tfGPFG/qfm5EBxuGRdg7
=4V4/
-----END PGP SIGNATURE-----

--9oYvVerlq//e2GY1--
