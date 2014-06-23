From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v7 1/2] video: ARM CLCD: Add DT support
Date: Mon, 23 Jun 2014 14:04:52 +0300
Message-ID: <53A809D4.90800@ti.com>
References: <1403018494-10264-1-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="1SNwn4VW7PTWesmxVjQhmCT7Om3mGmuTQ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403018494-10264-1-git-send-email-pawel.moll-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--1SNwn4VW7PTWesmxVjQhmCT7Om3mGmuTQ
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

On 17/06/14 18:21, Pawel Moll wrote:
> This patch adds basic DT bindings for the PL11x CLCD cells
> and make their fbdev driver use them.
>=20
> Signed-off-by: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> ---
> Changes since v6:
> - replaced in-node device-timing subnode with the standard
>   video interface bindings (as in: ports & endpoints); only
>   "panel-dpi" compatible panels are supported in the driver
>=20
> Changes since v5:
> - realised that dma_alloc_writecombine() is a arm-specific function;
>   replaced with generic dma_alloc_coherent()/dma_mmap_writecombine()
>=20
> Changes since v4:
> - simplified the pads description property and made it optional
>=20
> Changes since v3:
> - changed wording and order of interrupt-names and interrupts
>   properties documentation
> - changed wording of arm,pl11x,framebuffer-base property
>   documentation
> - cleaned up binding documentation indentation
>=20
> Changes since v2:
> - replaced video-ram phandle with arm,pl11x,framebuffer-base
> - replaced panel-* properties with arm,pl11x,panel-data-pads
> - replaced max-framebuffer-size with max-memory-bandwidth
> - modified clcdfb_of_init_tft_panel() to use the pads
>   data and take differences between PL110 and PL110 into
>   account
>=20
> Changes since v1:
> - minor code cleanups as suggested by Sylwester Nawrocki
>=20
>  .../devicetree/bindings/video/arm,pl11x.txt        | 102 ++++++++
>  drivers/video/fbdev/Kconfig                        |   1 +
>  drivers/video/fbdev/amba-clcd.c                    | 268 +++++++++++++=
++++++++
>  3 files changed, 371 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/arm,pl11x.t=
xt

I can queue this to fbdev tree, but how do you want to handle the second
patch? I think these two patches are independent, so the second patch
could go via arm-soc tree (or whichever is the normal route for those
=2Edts file changes). I'd prefer that option.

If these need to go together, I need acks for the second patch.

 Tomi



--1SNwn4VW7PTWesmxVjQhmCT7Om3mGmuTQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTqAnUAAoJEPo9qoy8lh71FjkP/RGFbrbm865tsUcsoUzk0QhL
hq++Kc9jzLX6zs7w1Bfar7aUkqssqERaNEX56M57uFINt4Yc/5OjjYQsl9CjDIx8
M4ZsKmS0gBrNObzEHA+o3PMEH83FBx1RiRlZePRvEqAYCnGY+4kXGnsGnGQ11ska
d6UsWc2ZPQNIVleUXMakmmaTqOooeRFabJIevjGdgeKqNVO/bffIkL0ILF8n4C4J
et+2nWDIRNXeyFoodSC+EJhHgz/7gll3f9WgX+hTRNxKwG97FU4dfVYIeQitN56L
62TOTnvkbyzBwAL6cGMEQP0iwqwl9CGY5ocMAMnU9g0E8oGjO93GPKVri5rJNiwp
U0gJ/Hbzl+9OHg+1iHNYLsvQYf6N58uBWqRh60mg62OA3lY7VMW57MtewxvKUc3W
q1oDwBgbxX0OB2YQrWiHXumuiH4NJhYA3Qax90SMF1r7uuP5IsUJ9/RP9dkadpcn
7KwkCj4hmYNfSJsg3/3ReRmeGvx+nWFA+TvVZGXIaAKNqYe09+p5P1bo49l86fOE
Pt1bbYc9lQGGXj5k/mIM9KGiw3/BLo/AlsBg+UwB3ZkkJAfgwIJquc73WnT1fwn+
mLfDXQ+GIxTcONJzi7O3B3SkAbhTJZYl3+tw3p2YVQK0Ja/zF4S9nFZjkC42Yurm
1Qn5DZX6WTBENIPVn7Yb
=RGcC
-----END PGP SIGNATURE-----

--1SNwn4VW7PTWesmxVjQhmCT7Om3mGmuTQ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
