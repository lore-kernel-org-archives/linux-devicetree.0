From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 3/7] drm/vc4: Mimic drm_atomic_helper_commit() behavior
Date: Tue, 06 Jun 2017 13:27:09 -0700
Message-ID: <87k24orheq.fsf@eliezer.anholt.net>
References: <1496392332-8722-1-git-send-email-boris.brezillon@free-electrons.com> <1496392332-8722-4-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496392332-8722-4-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.orgBoris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eben Upton <eben-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, "Hollingworth, Gordon" <gordon-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, "Cobley, Dom" <dom-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:

> The VC4 KMS driver is implementing its own ->atomic_commit() but there
> are a few generic helpers we can use instead of open-coding the logic.
>
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/gpu/drm/vc4/vc4_kms.c | 38 ++++++++++++--------------------------
>  1 file changed, 12 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index ad7925a9e0ea..f229abc0991b 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -42,6 +42,10 @@ vc4_atomic_complete_commit(struct vc4_commit *c)
>  	struct drm_device *dev =3D state->dev;
>  	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
>=20=20
> +	drm_atomic_helper_wait_for_fences(dev, state, false);
> +
> +	drm_atomic_helper_wait_for_dependencies(state);

With this wait_for_fences() addition and the reservation stuff that
landed, I think we can rip out the "seqno cb" in vc4, and just use
drm_atomic_helper_commit() and drm_atomic_hepler_commit_tail().  Do you
see anything missing, with that?

> +
>  	drm_atomic_helper_commit_modeset_disables(dev, state);
>=20=20
>  	drm_atomic_helper_commit_planes(dev, state, 0);
> @@ -57,10 +61,14 @@ vc4_atomic_complete_commit(struct vc4_commit *c)
>  	 */
>  	state->legacy_cursor_update =3D false;
>=20=20
> +	drm_atomic_helper_commit_hw_done(state);
> +
>  	drm_atomic_helper_wait_for_vblanks(dev, state);
>=20=20
>  	drm_atomic_helper_cleanup_planes(dev, state);
>=20=20
> +	drm_atomic_helper_commit_cleanup_done(state);
> +
>  	drm_atomic_state_put(state);
>=20=20
>  	up(&vc4->async_modeset);
> @@ -117,32 +125,10 @@ static int vc4_atomic_commit(struct drm_device *dev,
>  	if (!c)
>  		return -ENOMEM;
>=20=20
> -	/* Make sure that any outstanding modesets have finished. */
> -	if (nonblock) {
> -		struct drm_crtc *crtc;
> -		struct drm_crtc_state *crtc_state;
> -		unsigned long flags;
> -		bool busy =3D false;
> -
> -		/*
> -		 * If there's an undispatched event to send then we're
> -		 * obviously still busy.  If there isn't, then we can
> -		 * unconditionally wait for the semaphore because it
> -		 * shouldn't be contended (for long).
> -		 *
> -		 * This is to prevent a race where queuing a new flip
> -		 * from userspace immediately on receipt of an event
> -		 * beats our clean-up and returns EBUSY.
> -		 */
> -		spin_lock_irqsave(&dev->event_lock, flags);
> -		for_each_crtc_in_state(state, crtc, crtc_state, i)
> -			busy |=3D vc4_event_pending(crtc);
> -		spin_unlock_irqrestore(&dev->event_lock, flags);
> -		if (busy) {
> -			kfree(c);
> -			return -EBUSY;
> -		}
> -	}
> +	ret =3D drm_atomic_helper_setup_commit(state, nonblock);
> +	if (ret)
> +		return ret;
> +

Looks like vc4_event_pending() should be garbage-collected with this
commit.

>  	ret =3D down_interruptible(&vc4->async_modeset);
>  	if (ret) {
>  		kfree(c);
> --=20
> 2.7.4

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlk3EB0ACgkQtdYpNtH8
nuhb5A//VHBQD6AWzFS4EzAJaqA6cMAIhCIIs+01BqF6LdZaleYkHQ24aCgwZSh7
uuVZlgUTPUdRz60hTaH9TJmcGzRRUHHhTxxRuFodWosP9/OAcqBUUH1VF6XbFr+O
G45Iesa+gdgpAox00cqkYzME/fQK/HFKr3QDWtQqF9DVqL1pBu2yHxEzwkXUWiXd
w5GLgVU5SxOwfZ//rcnMYhSBPWnMIt+hAN3RhTI1Q4WCDoC0OIvK8+MrKv2JsFJz
hfIUZ/whgK9RxecN5h55amBkBbqGA6fIxhYM2VuQ6/JUFZasT9BhPKeL4tLmKraU
upvm/9aRMBtGARJmxUFnnzUD99lB7iZikFPO0CH9Tttc3zu7yx2EuEV5Sn6+sGR0
mKmtaGlh9pozlerDznO6KV9+RXMXFSpJxT8C/ozz0RUHKGzyzvm61kTgpQGlC/Bt
VDTylGhyV8QH4KhijGSAB6eAVmuTSE+ysyeZ0pQcCmYyWbqitilFKUmZP4NV2g54
dhTi8zcAqf4u2dCWDHzGvh38n5ugw5T/wmMqELzFe/JZd0ULuBlrP1F8BO3mwUtQ
jqdAWNEVZcM/6HN8F+VHyKmRjFUsfpfFCJc98NhRcMM50z1tZa92boYXN2+ckZ+q
QxVZXuMG3wY9ZjF5mWDha2hX19HzacQg/MNZqmLTllJNee8VlFo=
=Y/NL
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
