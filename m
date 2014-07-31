From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 0/6] ARM: sunxi: RTC support for A31/A23
Date: Thu, 31 Jul 2014 11:55:55 +0200
Message-ID: <20140731095555.GZ3952@lukather>
References: <1406724969-2482-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vM12nk/63StVgfqY"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBKFH5CPAKGQEAISB4HI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1406724969-2482-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vM12nk/63StVgfqY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 30, 2014 at 08:56:03PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
>=20
> This is v5 of the sun6i RTC series. This series adds support for
> the RTC in A31 and A23 SoCs. The series applies to sunxi-next.
>=20
> The A31 has a new RTC block that is separate from the timer block.
> It has separate interrupts for each of the alarms, and a different
> format for the counter alarm. The driver has been tested on the
> A31 Hummingbird, and the A23 tablet I'm using to work on sun8i
> support.
>=20
> Patch 1 adds the driver for the RTC.
>=20
> Patch 2 is a minor cleanup. This makes rtc-sunxi depend on sun4i or
> sun7i, the 2 platforms the driver is actually used on.
>=20
> Patch 3 adds the RTC device node to the sun6i DTSI.
>=20
> Patch 4 adds the RTC device node to the sun8i DTSI.
>=20
> Patch 5 adds enables rtc-sun6i in the sunxi defconfig.
>=20
> Patch 6 adds enables rtc-sun6i in the multi_v7 defconfig.
> This patch applies to arm-soc/next/defconfig (e9a86d96)

I queued patches 3 to 6 for 3.18.

I'll rebase a publish the branches as soon as 3.17-rc1 is out, so
don't worry if you don't see these patches appear right away.

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--vM12nk/63StVgfqY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJT2hKrAAoJEBx+YmzsjxAgfDYP/RaiXfFQpn+DjlSVILcMFqjr
edZyWgH35Ykrflgqixey1GZPqr4DnFyqvF4e+SDD16rGVRZtBnKrT+3N7IkyQNEm
27XsPZg3KyLDzqads9fY5bCaKgy9+9dGzT1IrObAhwaGcFvYGa3kKgkbeijVD7js
u3FcFXj94hbBzMuIRuSf41d+9Ns44bLfhYBBjdOETwGORTxY4LGeHrY61ethlRd6
0cAoOuBjLDWtLX38Q+W2+ZuiJvQhTVzeE5Ltzk9uGODtk64FjdBcXe6O4dRv9VXt
Mnr8V4158PtIpvFSL6cBnkR+L323mjmMGR9uz/UZbl407qVdMSoN92DVGYd0QxBH
UGeAAwfx9/kMq8K3p68DOir3ob2P4uQgVWS+Eve1jm81fKwWxntWNJUaTaieRbbf
dxLNQnEGCqaNWP8cT5Zqgnrm8H5XjM70/l08uXy5Aez5sxOfTOecx3P3ZeRlDObp
xLPAyq7vxGgsGApE5eBTfOaMqXOlrs6bR6R1HfeNO+p5+tWHiyPRp2+tl32M7sNa
vwhv4Ipd3Gnb6oKm9qKQ+2PTeCed/Vtl257CuKKx16LFLr+0liVQby9zYFt8Nb2i
+AzmkSTy9El1sdyr0tn3AhJxnRT3UXHMCZ5Ok8W36grhS4V2sGIABcigGnRre3fD
7hq5fOB8zjZgXvHmAzkV
=FUeA
-----END PGP SIGNATURE-----

--vM12nk/63StVgfqY--
