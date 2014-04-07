From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v2 2/5] ARM: zynq: dt: Convert to preprocessor includes
Date: Mon, 07 Apr 2014 07:58:13 +0200
Message-ID: <53423E75.3020008@monstr.eu>
References: <1396653256-28397-1-git-send-email-soren.brinkmann@xilinx.com> <1396653256-28397-3-git-send-email-soren.brinkmann@xilinx.com>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="Em4kOlMHxFWq8CivwK7RXajGwODQUH4Qj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396653256-28397-3-git-send-email-soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Em4kOlMHxFWq8CivwK7RXajGwODQUH4Qj
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Soren,

On 04/05/2014 01:14 AM, Soren Brinkmann wrote:
> Convert all Zynq DT files to the dtc preprocessor include syntax.
> This allows to include header files in the devicetrees like other
> SoC-types already do.
>=20
> Inspired-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> (http://www.spinics.net/lists/arm-kernel/msg319832.html)
>=20
> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

These 4 patches needs more wider discussion if this is helpful or
not. Currently I can't see any value in it because everything
is just generated and fixed. I think I had the same discussion
with Laurent some weeks ago regarding this.
IRC the origin idea to use this was especially for people who
writing these DTS by hand which is not our case - at least
for majority of our customers.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--Em4kOlMHxFWq8CivwK7RXajGwODQUH4Qj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlNCPnUACgkQykllyylKDCGCSACeK3V3uvNpObjzC52MLzfNfvAd
Gr4An213/PmlDoHPJpV1XkmQN5/R40wI
=0uHS
-----END PGP SIGNATURE-----

--Em4kOlMHxFWq8CivwK7RXajGwODQUH4Qj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
