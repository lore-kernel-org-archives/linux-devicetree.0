From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] irqchip: sun4i: simplify sun4i_irq_ack
Date: Mon, 17 Mar 2014 12:12:45 +0100
Message-ID: <20140317111245.GH27873@lukather>
References: <1394895894-8891-1-git-send-email-hdegoede@redhat.com>
 <1394895894-8891-3-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GlnCQLZWzqLRJED8"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBONSTOMQKGQE3IEOQ7Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1394895894-8891-3-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--GlnCQLZWzqLRJED8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2014 at 04:04:54PM +0100, Hans de Goede wrote:
> Now that we only ack irq 0 the code can be simplified a lot.
>=20
> Also switch from read / modify / write to a simple write clear:
> 1) This is what the android code does (it has a hack for acking irq 0
>   in its unmask code doing this)
> 2) read / modify / write simply does not make sense for an irq status
>   register like this, if the other bits are writeable (and the data sheet=
 says
>   they are not) they should be write 1 to clear, since otherwise a read /
>   modify / write can race with a device raising an interrupt and then cle=
ar
>   the pending bit unintentionally
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--GlnCQLZWzqLRJED8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTJtitAAoJEBx+YmzsjxAg3mcP/jo/WWcPP92yJ7zpc4Hoylil
Yq0sZP3W/d9OHoLx/xpERuTmw3kVo7nwCqWKMIEtOIEn/3EVwtrW5npa8OMzdVvg
sAkPWJvwnP8iEtJX+AWBXRGYsrUyoVN7edGXQLtB2FKE9/hPKdw+H30RfpTrCJWZ
9coFyAVkCh3C0WAspykm5zAxhCobiDV/BWXdt5WinEVTFsgdMqsspoxK3y5U0uco
3lIkgoqB7xLNXmZowMSbqR71ZJK2YSyg1u8G14ufNmIojOZPpbkmgXWs90+h5Q0a
lELhNMleGOU3q2AQYy1W3j3RQ4ONwoYpHlvrtjdI3PuSVFru59xcqPMDjF9laOIV
5D22cRCq0sjzT22dtSdUE2eYfy/ZGrY84BplMntnRMcUrCGmDnUxJV6NQR/ztFPg
wWNqzgLlSvldmChFXp+Q70wCPCkw+F98pcahsKmx273uwLpeS+KoxJJ+6xsY9aEj
5RBaWZWaiv5bBxRgvhWIhFX1JySp8obaIhy0qCKLLwtNx/2b6cTClQXiqYMYWUao
WHdFF+wB7mOrvkeed07PPXHgbb1FPZFUO8Cmbi1TIILvVUCuWi1ec3jzOmnS98vL
3I292RbHtBRvK0aH32daM8Qi6228HlW7BxqjUcpGLdI1sR/zrX26NEgdqbUHmYAd
ZFFF/F3tGR5Wd1OMp0Q9
=WWSa
-----END PGP SIGNATURE-----

--GlnCQLZWzqLRJED8--
