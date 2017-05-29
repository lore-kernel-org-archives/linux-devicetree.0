From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/6] ARM: sunxi: Enable AXP PMIC power supplies
Date: Mon, 29 May 2017 08:51:57 +0200
Message-ID: <20170529065157.2p3pmo3pb4u3fpgr@flea.home>
References: <20170525073138.20907-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="og5kauresaocyipp"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170525073138.20907-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--og5kauresaocyipp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2017 at 03:31:32PM +0800, Chen-Yu Tsai wrote:
> Hi Maxime,
>=20
> This series enables the power supplies for the AXP PMICs on boards
> that I currently have and am actively testing.
>=20
> The first patch re-orders the node references for the Cubieboard 2
> dts, to maintain alphabetical order.
>=20
> Patches 2 through 5 enable the ACIN power supply on various boards.
>=20
> Patch 6 ties the USB/VBUS power supply of the PMIC to the USB PHY.
> The PHY should have all available methods of VBUS detection configured.
> The Cubietruck already has the power supplies enabled, but the USB
> power supply was not configured to be used for VBUS detection.

Applied all 6, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--og5kauresaocyipp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZK8UNAAoJEBx+YmzsjxAgUbUP/1LhsaywcrlQJcYFOcstU1b+
evkaDZ8X7GiqAn064CYh6lHmYGdnSqY/l0asGNBPIF89RybWxWOWagOwP3drWott
a6q7CAKyhqwS2A4mTmsef1odcaRIqEuXQSZcOLES2O4eb6fSe9IXYIjhogNaTTrX
HGu9QwTvo3jWFjKXe5NxyndsYicD7AJKMUu+4mYqcXe9I+vNRKM+wdgpz2ANefvm
EYWcmS4y2r0q4SVuKG9OkK5aaKe2HIWBuXt3qGm4L2fwkCrdzWDhS8onnM3tLXP9
MXxCgQNtXDxWijpRrWNC+EMEHQBfplvrmazBrAUWeocivVMw1rhog8HrbXAA5QrW
QSoqUW9yiWKwvM8z79QHPhjpiSuhvA19HhLexpcveiZRP1JQDVSPmUXQGlD9H7fx
8b07mQGqXKgDX6zTQUXl+JpfKYdK91pjUUd6Za6iDUTGe/ZJDjISg46Iqvg5SOqI
4ueDBvJBAapJUQ8lWhwqKugA3a2tid1a7x1se4TfApt8PVX0m9/5Re0aqDFp1H0K
qGgCt6d7K26PUDSDezjz6tW6G3ZI/nv6mG0WvS3cYAvinRB4M/2Rc8iLK7t3JkUw
QXTV/DK0eMdfyBTfgQsGCe9kvFYCj4M0dIQ8ta94mucHMuO9PqbMn/ofMOiK6KN+
uPtsH1A+rtb+8W4iIaKP
=CSEJ
-----END PGP SIGNATURE-----

--og5kauresaocyipp--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
