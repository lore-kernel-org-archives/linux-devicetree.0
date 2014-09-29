From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/6] tty/serial: Add Spreadtrum's serial earlycon
Date: Mon, 29 Sep 2014 15:53:00 +0100
Message-ID: <20140929145300.GQ16977@sirena.org.uk>
References: <1411992293-7729-1-git-send-email-zhang.lyra@gmail.com>
 <1411992293-7729-6-git-send-email-zhang.lyra@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7a4X6VOqfbl9xMrG"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411992293-7729-6-git-send-email-zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, jslaby-AlSwsSmVLrQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, artagnon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, orsonzhai-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geng.ren-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, zhizhou.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--7a4X6VOqfbl9xMrG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 29, 2014 at 08:04:52PM +0800, zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:

> +config SERIAL_EARLYCON_SPRD
> +	bool "Early console using SPRD serial"
> +	depends on ARM64

This code doesn't appear to be ARM64 specific so adding an ||
COMPILE_TEST will allow better build time coverage for people doing
generic work on the subsystem.

--7a4X6VOqfbl9xMrG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUKXJLAAoJECTWi3JdVIfQ4+EH/29kwPtZqDhjc8wQdHiqtQ7E
85VEKtfT+bFoRj5g9omJdlalO9biUiDHtIuZmll5RX5gc3I0/H66qXyImMnCODUe
VdhGFHvGLjfUnKrMA1ekD2pP3VhrOrQRewJah+Ymw1HWJv+HHMccNOPSL11LDSE9
nysGM1LQWv4vsTOIaKxN/pwLl4LscOhm8Txp7rOcW3GWTTfhpCg9S/+0jNx/vbTk
aWKwA5VHBscvigVmWBK/0aGVD9SENUP1oRJ6pC51dKmBHGOysD5JhHiz1cBDLjpN
G/BLDDOmZWSdON3gGqhJosWP1Wv3tJPz1zpCvyQvfyfcJSYj4gf2mYEv9x7Ekv8=
=MFRO
-----END PGP SIGNATURE-----

--7a4X6VOqfbl9xMrG--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
