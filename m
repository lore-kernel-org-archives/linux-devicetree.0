From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: replace enable-sdio-wakeup with
 wakeup-source for BananaPi M1+
Date: Mon, 14 Nov 2016 20:53:34 +0100
Message-ID: <20161114195334.62rvyagvgeovhobq@lukather>
References: <1479138250-17780-4-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yocea2akpn3qipco"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479138250-17780-4-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--yocea2akpn3qipco
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2016 at 03:44:10PM +0000, Sudeep Holla wrote:
> Though the mmc core driver will continue to support the legacy
> "enable-sdio-wakeup" property to enable SDIO as the wakeup source,
> "wakeup-source" is the new standard binding.
>=20
> This patch replaces the legacy "enable-sdio-wakeup" with the unified
> "wakeup-source" property in order to avoid any further copy-paste
> duplication.
>=20
> Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--yocea2akpn3qipco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYKhY6AAoJEBx+YmzsjxAgxbcP/Am1CUmDbXtHT7K+hZkdxx0W
nt1GTbzSATcFdB59O/QOVf6SegeHoXduOclJTdKVV7aWc9cWUR+fLsOcIkm2R6iK
AupWtZDRj/wpd0P0S5ruVLklbcKgKOy8GAd8vchI6GeRMnmhAXQSHuc83k4XA6dX
EUWu1MD6gBAjNPqjLpvBiKzqaOBB2SAn8ewXs7TA6fQwvwoiwKDjI+mee5I3AUkz
n1L7kdhn+lS2GdLaSmHcxldQ8O5iEJnWoB6aYvfTj5UkrgfhTUln6ITbcAdWPd+e
I6av1Vfz7IrALXsuzOuw3LeDKK5uzvv7Z2expBd6AOmahv/GopweQQl5HZgv/v1H
KzTq6r7JwBnEY4FIZNRBJ49UZyTIVH2j5Dd3+dO3vkpBbHWW9VcgRJNOSjVtJ8Vf
+6zT+8OI/toRYW/Olg4F2OqDSVsFM7AXvGGR2WEYr3CbFnlgO3XRwNgATbZ1OFl5
e8SQ6nL30c8Bc/F3LRgMpJ3S7dXxVh1c1HBiQBd5pKnL2Yz/G08sdChlXDRftyEo
7p188ULysAiNA39nH2axW4fJlhd2m6HjyGTpb6y8Wx2SfrltcXggfHdWVynX+aYH
o2O3hiiECD45yyCYvgn0XshdZgrDh/I5mvOuBPFyL8HC3R+ZAtj4R1/zoOcFjG0V
IO5Cmr3JlBDIEU0bqeWE
=vBGL
-----END PGP SIGNATURE-----

--yocea2akpn3qipco--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
