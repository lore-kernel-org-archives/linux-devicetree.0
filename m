From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 4/7] drm/vc4: Use drm_atomic_helper_wait_for_flip_done()
Date: Tue, 06 Jun 2017 13:24:33 -0700
Message-ID: <87lgp4rhj2.fsf@eliezer.anholt.net>
References: <1496392332-8722-1-git-send-email-boris.brezillon@free-electrons.com> <1496392332-8722-5-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496392332-8722-5-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.orgBoris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eben Upton <eben-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, "Hollingworth, Gordon" <gordon-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, "Cobley, Dom" <dom-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:

> Replace the drm_atomic_helper_wait_for_vblanks() with a call to
> drm_atomic_helper_wait_for_flip_done(). This allows better detection of
> page flip done events which what we are really waiting for in
> vc4_atomic_complete_commit().
>
> With this approach, we also addresse the 'missed single vblank event'
> problem that can arise when the CRTC is configured in oneshot mode
> (only a single frame is generated and the CRTC is immediately paused
> after this frame). Note that this oneshot mode will be used for the
> writeback connector feature.

Should we just use drm_atomic_helper_commit_tail() and make this change
in the core helper, instead?

Actually, I'm confused.  drm_atomic_helper_commit_cleanup_done() seems
to be waiting for the flip_done on the crtc, already.  What's the
difference?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlk3D4EACgkQtdYpNtH8
nujlqxAApPt5Nt1e81e8SzboU/gbi0+vhAEUafT2UC7zpNXsEShyk17XpUG1f7Yq
FS75kFZQQgtt4Aao8HbiJkwQP4+t21B3XEo4Tu8QmepPwKj7PRVGbBv63yWUy5Pl
RQSXvZ6FLctbwrjS38f+navyBegb1541qkW5rtl1gKoFxKY4YO3C/Abz4vE9nwo1
XSDtqN4G/9Kn2GuYHmzc8nvXsY+v6zhRev0go+QofjKA4N+q+W40Lf1t7f0dL/a8
+jqe17BcArZcf8MVKDX+//TiVEVOa3LGHqNy5e/0ss/vem0qjj1xJN6ANjGh5bkG
rxjhc36Q9m5BNnKTMyb44qfTwiAeO+4QEYL9jpF2dRivi8T1EBnY2lxVu7znG04Y
HO7nzytnC2en/wArNdX4L6g+uL3JRsoTyHwITY+7ZmV22Z3XLao75EB/svXhZ62g
P3+xw5avmn+eKoivzmxqjyGNYAjZAvzLrtw9vFjnvQdDwCgCiHd6iLoWi9DbOOHw
rgdQ6mFLKQwRFhKJet4zbSYJqhyEMPm1DgSeovC416++w8kAd3Tg2xNH/Z5Vzc/U
h10llSMKqyD/7xMWvUdDzFl4NWcvudhzxNqludf7TxkYirhIof00xy54mWdXa804
2tvJ3348UUVVoJotJVO17UnEkF+2/qbyR7qPtv4ICIQH20mGw4E=
=sZ83
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
