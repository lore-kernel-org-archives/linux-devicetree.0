From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 1/5] dt-bindings: simplefb: Specify node
 location and handoff related properties
Date: Fri, 14 Nov 2014 16:24:18 +0200
Message-ID: <54661092.6020907@ti.com>
References: <1415962996-31712-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="OMFXBaQ0lXJDCAIEqDUTuukGgkLNpVGHF"
Return-path: <linux-sunxi+bncBCGMHFOOT4LBBH5BTCRQKGQEUDWHOCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1415962996-31712-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--OMFXBaQ0lXJDCAIEqDUTuukGgkLNpVGHF
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 14/11/14 13:03, Hans de Goede wrote:
> Since simplefb nodes do not relate directly to hw typically they have b=
een
> placed in the root of the devicetree. As the represent runtime informat=
ion
> having them as sub-nodes of /chosen is more logical, specify this.
>=20
> Also specify when to set the chosen stdout-path property to a simplefb =
node.
>=20
> For reliable handover to a hardware specific driver, that driver needs =
to
> know which simplefb to unregister when taking over, specify how the hw =
driver
> can find the matching simplefb node.
>=20
> Last add some advice on how to fill and use simplefb nodes from a firmw=
are
> pov.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Acked-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Ok, so I have pushed this and the other simplefb series to fbdev for-next=
=2E

I can still refresh the whole series if need be, but if possible I'd
rather take any new changes as patches on top of the current ones.

 Tomi



--OMFXBaQ0lXJDCAIEqDUTuukGgkLNpVGHF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUZhCSAAoJEPo9qoy8lh71EHoQAKuINZQjILEupv3NNuPOS+57
Z+c1eISYLItqiNExsMJPVunhheLOhsn8mm7F31sXHDFQXFRHCol5iPvtv7woo7Nq
ET5E40nf0ES+hGUJyygGcFpKgM6JssQj4wW+JYC84L1W1XgcKRYaYGN7cKFgZfkN
Ygq7y7LI1fEvVr/J/b2JhgP07vFjFHOlewWLvP81AjHe8iwopjI1rtsyv/3Dqe3T
E4J1mPnoLHteVRKlLubU3VjX2EU+2+Fnj5yW1CGWMo3++L03yUkgaE616DNpcMxj
Hjzmwcfhx1BnRBaxCJT2ly96voizJTUE3khIFvNal6Dbg3T/LBrnEZYY4kAS1BZA
JcKbDQii6MufYxrxVwSIJedL1H0NV9NnhcZLFKWhvMNBjIllGgMKntye3p2MpwPq
3afKYELgyR7uDB8Spqq/7gwN+3HSAKXbr/0q/h78UDCEbEZVvgAKIhru+dOZXx4g
y5epcVSbyk9Mw17ryN6MYDJfGqYSRoD4RmUvZ0ipdGgPLc5Rw+pn3XcxaWVrD1la
kA5SYOFx4P+dDEO0Cg5Ao3XlNFASAzX5UCft6MKjcW26hlUpyd3JAzlRw/g17OVz
62Y5McFsWD+FoUxu2tQ/RRyoWS665belw47Sd4su9GSf0jxatI5SMPr6gNIQ90tQ
LZISJwf5a7Vk+fZ3VZGB
=bf8y
-----END PGP SIGNATURE-----

--OMFXBaQ0lXJDCAIEqDUTuukGgkLNpVGHF--
