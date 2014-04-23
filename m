From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 7/7] ARM: sun6i: dt: Add A31 DMA
 controller to DTSI
Date: Wed, 23 Apr 2014 15:10:08 +0200
Message-ID: <20140423131008.GQ24905@lukather>
References: <1394723659-4995-1-git-send-email-maxime.ripard@free-electrons.com>
 <1394723659-4995-8-git-send-email-maxime.ripard@free-electrons.com>
 <201404231435.03920.arnd@arndb.de>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FmdPcZLZZW6lDAYm"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBWHZ32NAKGQEOMBHCRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201404231435.03920.arnd-r2nGTMty4D4@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--FmdPcZLZZW6lDAYm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2014 at 02:35:03PM +0200, Arnd Bergmann wrote:
> On Thursday 13 March 2014, Maxime Ripard wrote:
> > Now that we have a DMA driver, we can add the DMA bindings in the DTSI =
for the
> > controller and the devices supported that can use DMA.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>=20
> But why does this patch have to wait for the driver to get merged?

I wanted to make sure that my bindings were ok, and at least reviewed
by someone, but I guess it's done now.

Just applied it.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--FmdPcZLZZW6lDAYm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTV7uwAAoJEBx+YmzsjxAgzDUP/2HNoM1zbu27X+uPIH1nBFOz
pwolbeWkpcULq1yGMx+mTh0tt8wQWXWK1PlRzR3zW1AkQOmaLgvYLUR/sQQafQMK
HmEhudiOreFktV/+qb4g1wsWCTXzpgfuDDj7j7Q55iycVhfRhscsJMb6K5EEgat/
K5209taRjZ+NxLwpGLuRONSumBKOt1AX8H2XRUxqWRYJTAJEnpZvOaPH1y4ZvP+w
E5WProhQ9+gybrxG+kU9CYU/JcujqMAiSLzQZ25SNcMGPBewDkyRTVR2qgik1v/k
9UeS+NJ3vcqYM28DHbri3F9BTTMn6Qc2h4gxRKx4K4GXmPD2YgQCGr0UGorA8kUp
oeOIcCVT4PoUtJ0BjEC7325CP8vGHHZUuPOqYPMlONO3loQhMTvfffg5aOe9kjia
04EO/JTLvhNxrwl+w/Ur+5ihRddCDJK9bybAH4HOnLO6JDsIx2XChEoZVPyGyZDH
Eh3wwCPjNX27dhZo9jsCiXYDNNbP/Tq+Y88sCLwU+YpSXS6HUtz4GxXCC2cbYB0G
9+zuo/TisumEXjFCe5ZjMjVQKcMs0ftnc+d4n4OFNbd0vyXyHwifUNWrnhoujbo0
KHPeLc9LZOvwUj1KHqyKVASI232XChWucwS0F5GA08zTg7HEIAR2/J8KGmuRwQMz
ifUC8fig8uq9gSIF/w2U
=O/3f
-----END PGP SIGNATURE-----

--FmdPcZLZZW6lDAYm--
