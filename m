From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/7] clk: sunxi: Specify number of child clocks for
 divs clocks
Date: Tue, 30 Sep 2014 17:40:43 +0200
Message-ID: <20140930154043.GN4081@lukather>
References: <1411807795-6575-1-git-send-email-wens@csie.org>
 <1411807795-6575-2-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H7cT1SUwsqXggVRO"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411807795-6575-2-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--H7cT1SUwsqXggVRO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 27, 2014 at 04:49:49PM +0800, Chen-Yu Tsai wrote:
> Currently sunxi_divs_clk_setup assumes the number of child clocks
> to be the same as the number of clock-output-names, and a maximum
> of SUNXI_DIVS_MAX_QTY child clocks.
>=20
> On sun6i, PLL6 only has 1 child clock, but the parent would be used
> as well, thereby also having it's own clock-output-names entry. This
> results in an extra bogus clock being registered.

Isn't PLL6 having two childs as well?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--H7cT1SUwsqXggVRO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUKs77AAoJEBx+YmzsjxAgHIMQALuP4oWihn7Ce8bW4N24jUIJ
efXVHaTxcxdEYqmkOL0CC6ItlqyBZxVdgVTX2gfpEnnRtke9jm2P3eKhanknATWG
BfIj1fwkTDarXTramXjlX5vey0dUCp89K5HI8MwoadbvU4KyVgi2aYqnKl8vPFg/
sLhuTGflIwNZ+lsGn5ZllUAV4A3y17KuPnJvFfVECaORnyJ5AyCGi+GiWv573q+N
bthGN90suIzzbLYqjYhje77a6hExcwm7Iv5MOJZalwLQQDZ2PQK1Ir3h9CGMVVAJ
JmpullPZZqg20DhFe6oSB7gbUhDowR1l+Y6FewaAYXUOclw/y1b9F8iLDac1+9ZO
+EHeSQ19jHhSM+QDpoOuhRGnIiZXXKHX/XgYncxUWSFjc/Mhmj142S/7XAf1o7O8
seW0p1lnlkRxyPQedcH4I+R8bc0707oIKCE/ByNPvWiu2ZL05e6g23N03FyCrs4n
EauD5UpsgHDg6YeE8F0vG7DjAwIWe0HsQF7zffiSiDOuHx7JCsJZbThgVgv/AwGA
jYeCotFYqeZ618IGE91WLvIJB+59Icb1AR+NntitTysZ10/KZhmlovP2Hz2YDTo2
S7wi6zxfOhcwnZ5mEllZBmSPj6eIYajPDRht3C+8T5zx+SL/jKJKr5C8G7c8EJxB
sCWZFBGovxkZYfCUP/hs
=Axnx
-----END PGP SIGNATURE-----

--H7cT1SUwsqXggVRO--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
