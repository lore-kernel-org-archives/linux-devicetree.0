From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/1] ARM: dts: sunxi: Fix simplefb not working in 4.7-rc1
Date: Thu, 9 Jun 2016 09:46:43 +0200
Message-ID: <20160609074643.GA5242@lukather>
References: <1465063524-4925-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465063524-4925-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Sat, Jun 04, 2016 at 08:05:23PM +0200, Hans de Goede wrote:
> Hi Maxime,
>=20
> While testing 4.7-rc1 / linux-sunxi/sunxi-next on a A10s I noticed that
> hdmi out is no longer working (screen goes black when the kernel turns
> of unused clocks).
>=20
> This is caused by the dtsi for sun4i / sun5i / sun7i based boards now
> listing pll3, without pll3 being added to the clocks list for the
> simplefb nodes.

Why not do just that then? It's more appropriate for a fix imho.

Thanks! (and sorry for the breakage)
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXWR7iAAoJEBx+YmzsjxAgENAP/RTmRPBoSUlm7T+dJ4QZZ2FN
1mX3+HA8wlUYiu9WCH93kuByqd8yPAzjL7+c1/mx0IL8XQyGRf/TlC6CAfxaaA72
gbG+RoL5dgwJqlnPNsgv4aN4032gIUGE60u8ISck8BDcpGvRdQ8ebOeStMKFdEuK
VeIX6E/csLI61K/Ly4MCWo/9tLm97vnMGtILZC6f3JKjNgZJ/CqAp0Bid1GvKvm7
CUUYcvjLHxboo4RrlKO1CYOdoMdX2VJ9s1bIY/AKx2tD9uBpZbdgrvQJXOYAbpEl
H/xYxZkYvP3x+cZgq8H7zJwpD6HKyT5bW9kGAJT2AWsLAQU8PlSaqc25BQYl+22D
0Ery+LUq6i25PX76YvCTrchPmQCaXJuLg+H7Xkc31R6J9Q4PsJaQiZGbvTs/rcrl
/a8O1ZEzeM2iPcLHqgDEpr1YXjAco6ydAHjPyvEVOHKI7XiMXtmzyT76rU6qPxeO
0PA3q9/jI+ueqzIDuOqP24fecXN2IXtISyirHdc5FgvOadIOj3QGOUV6ZO5Q2/et
jB60TodWJd/gshtctkPr2LoS0VgN6vqd7FRT6jLil1cOLd84rSE/6WO4O6Y03mmp
9YqyQ62QOk9w7DyWZ8fpxXF9bGaomDjwZqfpU2DFny0VK2eiT8HsQhd6/0l86yO0
iGYx+trRdQO7z/MSYf/a
=MLVv
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
