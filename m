From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: Add simple panel device tree binding
Date: Tue, 26 Nov 2013 10:11:43 +0100
Message-ID: <20131126091142.GB27752@ulmo.nvidia.com>
References: <1385145714-3022-1-git-send-email-treding@nvidia.com>
 <CAGS+omB5RKRUod_gDrDGRTi3B-BsX54dD1hHeT32gdPSjw9Bkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGS+omB5RKRUod_gDrDGRTi3B-BsX54dD1hHeT32gdPSjw9Bkg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org


--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2013 at 10:01:54AM +0800, Daniel Kurtz wrote:
> On Sat, Nov 23, 2013 at 2:41 AM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > This binding specifies a set of common properties for display panels. It
> > can be used as a basis by bindings for specific panels.
> >
> > Bindings for three specific panels are provided to show how the simple
> > panel binding can be used.
[...]
> > +Example:
> > +
> > +       panel: panel {
> > +               compatible =3D "cptt,claa101wb01";
> > +               ddc-i2c-bus =3D <&panelddc>;
> > +
> > +               power-supply =3D <&vdd_pnl_reg>;
> > +               enable-gpios =3D <&gpio 90 0>;
> > +
> > +               backlight =3D <&backlight>;
> > +       };
>=20
>=20
> Pardon the question if this has been discussed before, but, would this
> also be a good binding in which to store a panel's physical dimensions
> (mmWidth, mmHeight)?  Or is there another binding more appropriate?

This binding doesn't define those properties because they are implied by
the compatible string. The corresponding driver defines a structure like
this:

	struct panel_desc {
		const struct drm_display_mode *modes;
		unsigned int num_modes;

		struct {
			unsigned int width;
			unsigned int height;
		} size;
	};

The panel_desc.size structure contains the physical panel dimensions,
specified in mm. With that, a panel will be supported by defining
something like this:

	static const struct drm_display_mode foo_mode =3D {
		...
	};

	static const struct panel_desc foo =3D {
		.modes =3D &foo_mode,
		.num_modes =3D 1,
		.size {
			.width =3D 223,
			.height =3D 125,
		},
	};

	static const struct of_device_id platform_of_match[] =3D {
		...
		{
			.compatible =3D "vendor,foo",
			.data =3D &foo,
		},
		...
	};

I assume you have a specific use-case in mind. Does this provide what
you need? The driver patches were posted earlier[0][1]. They have
changed slightly since then to address review comments, but nothing
significant.

Thierry

[0]: http://www.spinics.net/lists/devicetree/msg08498.html
[1]: http://www.spinics.net/lists/devicetree/msg08499.html

--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlGXOAAoJEN0jrNd/PrOhcvoQALk6OyUkBDUZoYclozecjMjS
YASKg0C3QyhZubxuKmbJJ8zUbMrehL/i8xB4d6P4wk3JzgI9u4rjhSjyNtJtocyo
+sKDctDnHZAmd7a7xE3DP/B2YxVaC+15Swbr0hyRwIoLh3mJk93KykXkabaJNRoV
UypZ/bqKNpTVY3SWQGWb/nbeVP3sH+ubEVz0vksZNBedHhXKIwYizka8+L3HfGNd
giZK7ztjsyINvU4jXu5160pgg1UWaK+XFRJI2xF5vCzrgH0ty9q7OyEdtul7ibAz
xr28WEnSWcs5zAtZdCmJGyLo8J+uDMDMN8Y1paEb1AnjrflPdWkuZRuEotoOFs05
CfNJxYZEL8x6khWzmknczIOCMWKZdudeIFqNxCtH+jm4X+3qOO2ItCbo/eIHWDY/
9LCqMTrpb0pK27T/qvjNJxLo71qV5GuGnRVSTL6zC75CWBVODyQXtfV9N4gTUKgE
9mab2L97SPDlb2TE5AWzJ1VF8Bqg/WSI0nzIsCbgJB40cRdi4w0FYWMHSa2u03nF
8E1m+qC/59m4BlUbAW6zwkyjcrhSJmcW1XvcUZydrFHOLwFE5dg7a20/C0JpYpkw
PN6zkXlbPlz4q+XSMlcwL0CBDVpiJJjpV1a+FLHbjaKFkihRhiveafNfnocgfGer
94URaF3J97AszIaNRqCi
=0Xkk
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
