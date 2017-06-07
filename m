From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 3/7] drm/vc4: Mimic drm_atomic_helper_commit() behavior
Date: Wed, 07 Jun 2017 10:46:44 -0700
Message-ID: <87o9tzg06z.fsf@eliezer.anholt.net>
References: <1496392332-8722-1-git-send-email-boris.brezillon@free-electrons.com> <1496392332-8722-4-git-send-email-boris.brezillon@free-electrons.com> <87k24orheq.fsf@eliezer.anholt.net> <20170606224817.7244d0e0@bbrezillon>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170606224817.7244d0e0@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eben Upton <eben-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Hollingwort
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:

> On Tue, 06 Jun 2017 13:27:09 -0700
> Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:
>
>> Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:
>>=20
>> > The VC4 KMS driver is implementing its own ->atomic_commit() but there
>> > are a few generic helpers we can use instead of open-coding the logic.
>> >
>> > Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> > ---
>> >  drivers/gpu/drm/vc4/vc4_kms.c | 38 ++++++++++++----------------------=
----
>> >  1 file changed, 12 insertions(+), 26 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_k=
ms.c
>> > index ad7925a9e0ea..f229abc0991b 100644
>> > --- a/drivers/gpu/drm/vc4/vc4_kms.c
>> > +++ b/drivers/gpu/drm/vc4/vc4_kms.c
>> > @@ -42,6 +42,10 @@ vc4_atomic_complete_commit(struct vc4_commit *c)
>> >  	struct drm_device *dev =3D state->dev;
>> >  	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
>> >=20=20
>> > +	drm_atomic_helper_wait_for_fences(dev, state, false);
>> > +
>> > +	drm_atomic_helper_wait_for_dependencies(state);=20=20
>>=20
>> With this wait_for_fences() addition and the reservation stuff that
>> landed, I think we can rip out the "seqno cb" in vc4, and just use
>> drm_atomic_helper_commit() and drm_atomic_hepler_commit_tail().  Do you
>> see anything missing, with that?
>
> I can't tell. I haven't dig enough to understand what this seqno cb was
> used for :-), but Daniel was suggesting the same thing. I'll try to
> better understand what seqno cb does and if it's all safe to get rid of
> it and use the standard helpers.

The seqno cb was the thing for stalling the modeset until V3D was done
rendering to the planes.  The wait_for_fences() does the same thing
using generic dmabuf reservations, so the seqno cb isn't needed any
more.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlk4PAUACgkQtdYpNtH8
nujbtw/6A2zQDi4ql4yUlxwjXg7QhrcCqyjPFC6X3ItYEX59x+b7AzEskgY3UGQU
3nSt22ruiwPpw9RpjSpu6TKxv0CbmYN8BpwhHOlcwJQ2KmGZlR0RpevSbgHq4Bzf
cTPjTqiA5fW+/8CKdb9yVnb1dkoNv7XkvNy0XyhVcv+vgIQaSbTfvs0QVMZ/imCA
vSOL/z8+mrF031LEXr+ArAO3rbX2vrj9Q0IL776YqahJsPidAdOIJ1S7PcBLjWGg
blPJ2IKl+46MyMT6TRPZumA9R5rdlO/h+DIva3Y6YuNav+qXviH8Ih9yIC9SBnbh
dbLMzuagvRyyw7T2CLqR6pJ5DZxgVJiMbvq7HsVFOgv5CaOJXHdLcRJ7doyoDBlh
mRMaI/3aVNwoVxhszbPfR4NluEDetknwTnuM+MpGKAcFie2LV6DmOm6yWhxvn2xJ
UFNy84Z794H6ACnlTAE31uChA5hlPdHWaezAzfdM2SXxirp4jyhzrbSLozh2Wr+g
3wCmtY2XlPkOuEO4rM8hmBRgQAehVpGOl8ReNQF9SsyC2BsPyJg9a4gvmUj3OTS5
Y9f7XOgJDq7XVW8uWj16vhbueiaBpISBDXV4rFwIWPFDnrDre85NBEzpJm+kng6D
X3NVkjjL2HkDJb+21zAmF+cAYuUf3cE8JiZBQy7P+w5OQ6xj5fc=
=S7jg
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
