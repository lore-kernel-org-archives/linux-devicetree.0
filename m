From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/7] drm/tinydrm: Add helper functions
Date: Mon, 6 Feb 2017 10:35:56 +0100
Message-ID: <20170206093556.GF27607@ulmo.ba.sec>
References: <20170131160319.9695-1-noralf@tronnes.org>
 <20170131160319.9695-3-noralf@tronnes.org>
 <20170206085629.GD27607@ulmo.ba.sec>
 <20170206090918.6rqr6l7pd62znl5j@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OzxllxdKGCiKxUZM"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170206090918.6rqr6l7pd62znl5j-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org


--OzxllxdKGCiKxUZM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2017 at 10:09:18AM +0100, Daniel Vetter wrote:
> On Mon, Feb 06, 2017 at 09:56:29AM +0100, Thierry Reding wrote:
> > On Tue, Jan 31, 2017 at 05:03:14PM +0100, Noralf Tr=C3=B8nnes wrote:
[...]
> > > +/**
> > > + * tinydrm_merge_clips - Merge clip rectangles
> > > + * @dst: Destination clip rectangle
> > > + * @src: Source clip rectangle(s)
> > > + * @num_clips: Number of @src clip rectangles
> > > + * @flags: Dirty fb ioctl flags
> > > + * @max_width: Maximum width of @dst
> > > + * @max_height: Maximum height of @dst
> > > + *
> > > + * This function merges @src clip rectangle(s) into @dst. If @src is=
 NULL,
> > > + * @max_width and @min_width is used to set a full @dst clip rectang=
le.
> > > + *
> > > + * Returns:
> > > + * true if it's a full clip, false otherwise
> > > + */
> > > +bool tinydrm_merge_clips(struct drm_clip_rect *dst,
> > > +			 struct drm_clip_rect *src, unsigned int num_clips,
> > > +			 unsigned int flags, u32 max_width, u32 max_height)
> > > +{
> > > +	unsigned int i;
> > > +
> > > +	if (!src || !num_clips) {
> > > +		dst->x1 =3D 0;
> > > +		dst->x2 =3D max_width;
> > > +		dst->y1 =3D 0;
> > > +		dst->y2 =3D max_height;
> > > +		return true;
> > > +	}
> > > +
> > > +	dst->x1 =3D ~0;
> > > +	dst->y1 =3D ~0;
> > > +	dst->x2 =3D 0;
> > > +	dst->y2 =3D 0;
> > > +
> > > +	for (i =3D 0; i < num_clips; i++) {
> > > +		if (flags & DRM_MODE_FB_DIRTY_ANNOTATE_COPY)
> > > +			i++;
> > > +		dst->x1 =3D min(dst->x1, src[i].x1);
> > > +		dst->x2 =3D max(dst->x2, src[i].x2);
> > > +		dst->y1 =3D min(dst->y1, src[i].y1);
> > > +		dst->y2 =3D max(dst->y2, src[i].y2);
> > > +	}
> > > +
> > > +	if (dst->x2 > max_width || dst->y2 > max_height ||
> > > +	    dst->x1 >=3D dst->x2 || dst->y1 >=3D dst->y2) {
> > > +		DRM_DEBUG_KMS("Illegal clip: x1=3D%u, x2=3D%u, y1=3D%u, y2=3D%u\n",
> > > +			      dst->x1, dst->x2, dst->y1, dst->y2);
> > > +		dst->x1 =3D 0;
> > > +		dst->y1 =3D 0;
> > > +		dst->x2 =3D max_width;
> > > +		dst->y2 =3D max_height;
> > > +	}
> > > +
> > > +	return (dst->x2 - dst->x1) =3D=3D max_width &&
> > > +	       (dst->y2 - dst->y1) =3D=3D max_height;
> > > +}
> > > +EXPORT_SYMBOL(tinydrm_merge_clips);
> >=20
> > Should this perhaps be part of drm_rect.c?
>=20
> drm_rect is about struct drm_rect, this here is struct drm_clip_rect. I
> think fixing this up is a lot bigger patch series, and we've postponed it
> already with the dirtyfb trakcing patches for the fbdev helpers. I think
> postponing once more is ok.

Okay, that's fine with me.

> > > +#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
> > > +/**
> > > + * tinydrm_of_find_backlight - Find backlight device in device-tree
> > > + * @dev: Device
> > > + *
> > > + * This function looks for a DT node pointed to by a property named =
'backlight'
> > > + * and uses of_find_backlight_by_node() to get the backlight device.
> > > + * Additionally if the brightness property is zero, it is set to
> > > + * max_brightness.
> > > + *
> > > + * Returns:
> > > + * NULL if there's no backlight property.
> > > + * Error pointer -EPROBE_DEFER if the DT node is found, but no backl=
ight device
> > > + * is found.
> > > + * If the backlight device is found, a pointer to the structure is r=
eturned.
> > > + */
> > > +struct backlight_device *tinydrm_of_find_backlight(struct device *de=
v)
> > > +{
[...]
> > > +}
> > > +EXPORT_SYMBOL(tinydrm_of_find_backlight);
> > > +
> > > +/**
> > > + * tinydrm_enable_backlight - Enable backlight helper
> > > + * @backlight: Backlight device
> > > + *
> > > + * Returns:
> > > + * Zero on success, negative error code on failure.
> > > + */
> > > +int tinydrm_enable_backlight(struct backlight_device *backlight)
> > > +{
[...]
> > > +}
> > > +EXPORT_SYMBOL(tinydrm_enable_backlight);
> > > +
> > > +/**
> > > + * tinydrm_disable_backlight - Disable backlight helper
> > > + * @backlight: Backlight device
> > > + *
> > > + * Returns:
> > > + * Zero on success, negative error code on failure.
> > > + */
> > > +int tinydrm_disable_backlight(struct backlight_device *backlight)
> > > +{
[...]
> > > +}
> > > +EXPORT_SYMBOL(tinydrm_disable_backlight);
> > > +#endif
> >=20
> > These look like they really should be part of the backlight subsystem. I
> > don't see anything DRM specific about them. Well, except for the error
> > messages.
>=20
> So this is a bit an unpopular opinion with some folks, but I don't require
> anyone to submit new code to subsystems outside of drm for new drivers.
> Simply because it takes months to get stuff landed, and in general it's
> not worth the trouble.

"Not worth the trouble" is very subjective. If you look at the Linux
kernel in general, one of the reasons why it works so well is because
the changes we make apply to the kernel as a whole. Yes, sometimes that
makes things more difficult and time-consuming, but it also means that
the end result will be much more widely usable and therefore benefits
everyone else in return. In my opinion that's a large part of why the
kernel is so successful.

> We have piles of stuff in drm and drm drivers that should be in core but
> isn't.
>=20
> Imo the only reasonable way is to merge as-is, then follow-up with a patch
> series to move the helper into the right subsystem. Most often
> unfortunately that follow-up patch series will just die.

Of course follow-up series die. That's because nobody cares to follow-up
once their code has been merged.

Collecting our own helpers or variants of subsystems is a great way of
isolating ourselves from the rest of the community. I don't think that's
a good solution in the long run at all.

Thierry

--OzxllxdKGCiKxUZM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliYQ3kACgkQ3SOs138+
s6GgIg/9EskFcM8BPctut2M03himEgBFQtF5sNnXyVfEBtn8F5nBpwYAgDac/dwR
N9qIYIXHkAqec0fJzA8y09kWPzGvyel/fSPbGjXpbnOazu5OgMxURYllNij3c1/a
qTuVyU4zGlIJFsC8pa1G4w4z45TrFXjrRzew+KZRJm+GQlz5xZmWq9zY+R1+PPoW
Smke1Bg3/LLtOB6IjosYoLQzX/Xc3VveaDs2iwkmaosuWGtnTVKzmN5wTeGyseKd
uFF2YHQLKGorE5EBQWtmvX4BFc7M9WK3P2vSenBYh2vPwfg5BvX8TmDON8ER029a
exvuWUTF36RGhd7WymJEfoRO0yjTYkhpFBrf54wx0yt9O89D8kuGwVYdv5t5afpG
hQpKlDUUtEC8RPaEQyij9B5JU8AUmRMyIhipKa41rdlgUICebOi1p6/sCffkuyZs
r/+nXXxyQnALzlKh0wE0XCvKtjj1IyHa4BasSyw1wM9bpP46mEkNGJ+0V9dte1uK
Ycr2uzu9KK3cpAIHh03/ZKUlQAtdFePCI7PamntJ4+wnLQiZNU8j8mx4Zu3ffD7p
3zjMdgaa37r/3PzBtMGb3A418yC4cuMPE37Ld6rnOJg4eXS/7j+ub6P7zXPA9QhK
kM0Eg7j4XiQiEisVQaWExd/qhjHNlPHRfKYzvv8rRBXFkSaNHfo=
=FGHu
-----END PGP SIGNATURE-----

--OzxllxdKGCiKxUZM--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
