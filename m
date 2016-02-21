From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V6 1/2] regulator: Add document for MT6323 regulator
Date: Sun, 21 Feb 2016 09:38:59 +0900
Message-ID: <20160221003859.GI18327@sirena.org.uk>
References: <1455709056-50510-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BtQ+uzrQQ7HCCYtg"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455709056-50510-1-git-send-email-blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--BtQ+uzrQQ7HCCYtg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 17, 2016 at 12:37:35PM +0100, John Crispin wrote:
> Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

...and dropped due to the dependency on MFD changes that you didn't
mention :/  I can't apply this without a pull request from Lee with the
MFD changes for the chip that I can depend on, there's no separate
Kconfig symbol and the MFD is already merged causing build failures
(you've had mail from 0day about that).

--BtQ+uzrQQ7HCCYtg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWyQcaAAoJECTWi3JdVIfQDV0H/i6GKyu0jcNypJWRz/vctiNO
McWa4TZGSP//AJGvd8sSrlMPuFSb6U8MwiEcQKJe2zGR/yi1FvJttertBHBZi0UA
g/59R0dBoxSAkC9gL99BVV5q23NtCGmESywJtRtwUfWSohwZeUnusz++xyMifjhZ
zzWn/Pr1ToPUGsl/hiAfdvwEylD3L89jcNV6e3285q/uiVYD/wLDT0wdMxL78T8B
GpbM2wU4tKJIbiHsl1hgXpYWDlo+lY0JPhK9+UKqduDwqWnk0gCjtyCya+H903GZ
GTQVsqBE9/YzY/PkKw7wEOMT2PdCRaoq+SbxIfkHDUPkdo23EdYJjgCKQTZuh3M=
=2c+4
-----END PGP SIGNATURE-----

--BtQ+uzrQQ7HCCYtg--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
