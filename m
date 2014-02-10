From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 0/8] Add Allwinner A20 GMAC ethernet support
Date: Mon, 10 Feb 2014 20:47:35 +0100
Message-ID: <20140210194735.GY3192@lukather>
References: <1392028554-32545-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ix2jQZQ3wXOip0b1"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB2624SLQKGQE2H424EY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392028554-32545-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Ix2jQZQ3wXOip0b1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Mon, Feb 10, 2014 at 06:35:46PM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> This is the v4 of the remaining Allwinner A20 GMAC glue layer patches.
> The stmmac driver changes have been merged through net-next. The
> remaining bits are clock and DT patches. The patches should be applied
> over my clock renaming patches.
>=20
> The Allwinner A20 SoC integrates an early version of dwmac
> IP from Synopsys. On top of that is a hardware glue layer.
> This layer needs to be configured before the dwmac can be
> used.
>=20
> Part of the glue layer is a clock mux, which controls the
> source and direction of the TX clock used by GMAC.

Just merged patches 2-8.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Ix2jQZQ3wXOip0b1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJS+SzXAAoJEBx+YmzsjxAgab4QALz+L2NbY+BL4O9QVRu5tee+
uzC7q0Qa3q2T+RC0bJvEoV4t0njYbZ1xUGidrelesi2toWX2+UI5vhcfQeF1qOdF
GyHs9ha5pE5cFYRElKGcrzKgnmV91f97iydbqGbGoJVXcyv+bI0NA5iveHCdJGpj
boRxcBQ4jX9YxBZs/fpVGIkjc9+t+qNX1jGZwcJCsmg8sXuaL4jDZk/mN4zfEpLb
kFaCjG6YJsIsA70w/g5J7Vf+Q3xHRD6NTPAQCLzs/WTCxeRagzPYhx3xDfuuYbaG
km4+0IwWPUvcCv87d9jAfIB+RJ80LULn0CsoFXZEn56ejuM3RFqDIVeZh1egeO1z
iGWZ+Jq2S9SB4Pod81tfXzaDD/uIpZjzvR3tsr0r8IMDVsSPtIlkrZlpDsDR3ecr
aTjvxA7aKBpEeaVlTXSeOe3HE3ZvLfyQJW5W3fXpqZZLDbWUIDXw5XGL47BiTaan
VJDsXP4eIeIyo3LVpXMdeYAYK9LGSfCC79gFW/rxrulOWselMrNxUrXhf+bcM9/1
nVdqhAATsyRUZVv/aC/ZQ+wg43Y66Z9p0tZnx4RINdLtIhcn5RFGwDY2u/JgMG18
oFvZT/XbZ47UhUVzaAK/j/6OY0Q8duMy/avo8RWOIvUwrpMUUfKXf5+VneUsPmDx
/7tUFHwjiJkgoTmlNuUf
=8Sqw
-----END PGP SIGNATURE-----

--Ix2jQZQ3wXOip0b1--
