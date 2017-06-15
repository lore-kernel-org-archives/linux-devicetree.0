From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 3/7] drm/vc4: Mimic drm_atomic_helper_commit() behavior
Date: Thu, 15 Jun 2017 16:33:11 -0700
Message-ID: <87d1a4u8qw.fsf@eliezer.anholt.net>
References: <1496392332-8722-1-git-send-email-boris.brezillon@free-electrons.com> <1496392332-8722-4-git-send-email-boris.brezillon@free-electrons.com> <87k24orheq.fsf@eliezer.anholt.net> <20170606224817.7244d0e0@bbrezillon> <87o9tzg06z.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87o9tzg06z.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eben Upton <eben-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Hollingwort
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> writes:

> [ Unknown signature status ]
> Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:
>
>> On Tue, 06 Jun 2017 13:27:09 -0700
>> Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:
>>
>>> Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:
>>>=20
>>> > The VC4 KMS driver is implementing its own ->atomic_commit() but there
>>> > are a few generic helpers we can use instead of open-coding the logic.
>>> >
>>> > Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>> > ---
>>> >  drivers/gpu/drm/vc4/vc4_kms.c | 38 ++++++++++++---------------------=
-----
>>> >  1 file changed, 12 insertions(+), 26 deletions(-)
>>> >
>>> > diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_=
kms.c
>>> > index ad7925a9e0ea..f229abc0991b 100644
>>> > --- a/drivers/gpu/drm/vc4/vc4_kms.c
>>> > +++ b/drivers/gpu/drm/vc4/vc4_kms.c
>>> > @@ -42,6 +42,10 @@ vc4_atomic_complete_commit(struct vc4_commit *c)
>>> >  	struct drm_device *dev =3D state->dev;
>>> >  	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
>>> >=20=20
>>> > +	drm_atomic_helper_wait_for_fences(dev, state, false);
>>> > +
>>> > +	drm_atomic_helper_wait_for_dependencies(state);=20=20
>>>=20
>>> With this wait_for_fences() addition and the reservation stuff that
>>> landed, I think we can rip out the "seqno cb" in vc4, and just use
>>> drm_atomic_helper_commit() and drm_atomic_hepler_commit_tail().  Do you
>>> see anything missing, with that?
>>
>> I can't tell. I haven't dig enough to understand what this seqno cb was
>> used for :-), but Daniel was suggesting the same thing. I'll try to
>> better understand what seqno cb does and if it's all safe to get rid of
>> it and use the standard helpers.
>
> The seqno cb was the thing for stalling the modeset until V3D was done
> rendering to the planes.  The wait_for_fences() does the same thing
> using generic dmabuf reservations, so the seqno cb isn't needed any
> more.

Oh, we've got another user of the seqno cb (async flips), anyway, so we
can't delete it quite yet.  I've pushed this patch since it's a clear
improvement (less code, waits for fences from other devices if any).

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAllDGTcACgkQtdYpNtH8
nuhfwRAAnEBY9cm9qwVzrDocAFJBmKtA2jNg7uHByNwD5fKx55Hg0mU7MnEikAfS
WeL7jIgD/v+V3PZlvxbRQF4dBGfRp+efYsePGGzu8jYQmErfWFQ0mMUPNSBImxyy
7VRxlgv1ObZJXmf+n59TqmRI9rENkDT0TdTHfiibHW65KyUCy6e8e9e55Mk3lPXn
5HOtzseqd5InNXKyYTCShv6m+4V1A1PVhtR23TucR1oHlaNA5+GPuOebMLL7ntIK
kM+zwdq1Fk4FiUA0N2m3S+f6vrz7YhCIavXqAG8ouzOEoBKIYN2yBU7sExEpBdAU
47Y1cx120dO8hT1Uur3zPFZOljrQKtWWsvLZB7k4Te+qaeIroP9spI8Vhpsvzdu8
YFcGI1+PdoGcMmAVxCCoxRY8JQrXFvhmxmF+ur/d2flaUbkdOFAhmS3Nk9RrA8VP
jtVJw3N6XX4m3BAudKsaikxLRno8Hzosrey+ip3zDMUy1q9sed0W8JTssnUz6BkI
2vxoszDtEDmkV8YemaUCMqKI8tSLgfJWM5KUooAQULpZVdh9VXusT+shtOjyamZ0
cdJkY8wBIJ97FOYM06+bIlYXcQokUfhuMTEQsmS4/bGjBOX0Nj6mom4nBaqNc/iF
9iOWnH/UhVpTqG1Iuv4jio3GAuJHfAYYaA65WKySYXFoBoWyrZQ=
=ccT/
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
