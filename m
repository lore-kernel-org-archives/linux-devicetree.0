From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/7] drm/vc4: Fix vblank handling
Date: Thu, 15 Jun 2017 16:30:58 -0700
Message-ID: <87fuf0u8ul.fsf@eliezer.anholt.net>
References: <1496392332-8722-1-git-send-email-boris.brezillon@free-electrons.com> <1496392332-8722-3-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496392332-8722-3-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.orgBoris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eben Upton <eben-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, "Hollingworth, Gordon" <gordon-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, "Cobley, Dom" <dom-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:

> There are two problems related to VBLANK handling in the current CRTC
> driver:
>
> * VBLANK events are missed when the CRTC is being disabled because the
>   driver does not wait till the end of the frame before stopping the
>   HVS and PV blocks. In this case, we should explicitly issue a VBLANK
>   event if there's one waiting
> * when we are enabling a CRTC, drm_crtc_vblank_get() is called before
>   drm_crtc_vblank_on(), which is not supposed to happen (hence the
>   WARN_ON() in the code). To solve the problem, we delay the 'update
>   display list' operation after the CRTC is actually enabled.

Does drm_crtc_vblank_get() actually fail when drm_crtc_vblank_on()
hasn't been called?  The code is a bit twisty, but it looked like we
would track the get refcount and then turn on the interrupt once
drm_crtc_vblank_on() was called.

The first change of the two seems straightforward and good, though (and
possible to separate, right?).

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAllDGLIACgkQtdYpNtH8
nujsTQ/7BegZ1dwCM0HttJQlJWjWxpYANChBmI/35558blY/Hq2Tzbkwh1W8frGQ
oH7hrfQ40CYR3tgHJK8NFSJLFsrSf7wYoHveJtd4jlzmeBI++QxBu+w45Rsvxiay
W+8AIjgz3Bmjc16fypVEFjrbN5Y9YlX7yLmHVzGXRaZBxq6hdw0lW43scP11uMmG
MOKADChhf1mKbVBFJYQ8ghBrNsSWpbwl/I8PnqAMKouigxeZoM0bQqCcqqrUD9oC
eg+BcidkSbhSGWplPD0udT0DKzDFCluGH3CJcQW2MVjTZsRwFjEadhcGid/76lWu
C7ebkjQLlm1nUw9BFDR4PjfI4HrTxX8/BpohqRtm5qST641ZBkAbbCYzxCJVtXJY
4ypns1W51C+/Pzte37D98+XkRHUyITJr+7F/wXja+9uJlHZlu1kJDRG0IEcGLSNp
6dQ7SFUNBYejxjuLArubGMtxzT+s/Z5q6+pAa55jw3KyvHFWi8XXROPdv+k8DhRN
Oq0zfjO0W56D8jY05wUUufuSRFveCM8zwMsFvB6FPMv9oq61sNGqsBSUSCGiVUMj
urKJ9OmuZUhNUEHLrDNKilxfSyfGZ/gEWNQVbLhejwiFMjGLgkiFWk3JZm9FSgbe
/Ztea3QHsZTD7nzR/36f980lMg6mxCDtM8K7oGwSGb4Gss6Ca78=
=lL30
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
