From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/3] drm/vc4: Don't try to initialize FBDEV if we're only bound to V3D.
Date: Fri, 21 Apr 2017 15:53:30 -0700
Message-ID: <87wpadtlsl.fsf@eliezer.anholt.net>
References: <20170418191157.18517-1-eric@anholt.net> <20170418191157.18517-2-eric@anholt.net> <CAKMK7uFSsA3c+wMfq_O9kSvu0cWLUA-bRqTHyryqi+1ZVeir_w@mail.gmail.com> <8760i046zw.fsf@eliezer.anholt.net> <CAKMK7uHBE1Qtjr2dM3U9edEfZ0mXVEjcw+hs8mF9ZkRP4Vcm=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKMK7uHBE1Qtjr2dM3U9edEfZ0mXVEjcw+hs8mF9ZkRP4Vcm=A@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org> writes:

> On Wed, Apr 19, 2017 at 7:55 PM, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:
>> Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org> writes:
>>> On Tue, Apr 18, 2017 at 9:11 PM, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:
>>>> The FBDEV initialization would throw an error in dmesg, when we just
>>>> want to silently not initialize fbdev on a V3D-only VC4 instance.
>>>>
>>>> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
>>>
>>> Hm, this shouldn't be an error really, you might want to hotplug more
>>> connectors later on. What exactly complains?
>>
>> drm_fb_helper_init() throws an error if the passed in connector count is
>> 0, so drm_fb_cma_helper() printks an error.
>
> Oh, _that_ thing. The error in there is correct, but (almost) everyone
> gets this parameter wrong. This isn't the max number of connectors the
> fb helper will light up, but just the max number of connectors _per_
> crtc when driving in hw clone mode. There's two problems with that:
> - fb helpers don't support hw clone mode, we select 1:1 crtcs for each
> active connector
> - I mentioned that everyone gets this wrong?
>
> If you're moderately bored it'd be great to nuke the max_connector
> argument from drm_fb_helper_init, and hard-code it to 1 (with a big
> comment explaining that this needs to be changed, probably with
> dynamic reallocation, once someone gets around to implementing hw
> clone mode).
>
> If you're less bored, just hardcode this to 1 in vc4 and done. Plus a
> TODO.rst entry would be great in that case.

If I'm driving a GPU with no display subsystem at all, it seems like I
shouldn't initialize fbdev for it, right?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlj6jWoACgkQtdYpNtH8
nuhrqw/+JRZuhfaLORI8+ALYPoCHs+JQ7TvbIYAl64AY9uA266MTlr8Z+kIBYePJ
IuTG0S8kt6r+DzdGlppTEZvGDdFExPx+VGpkT4AD/yn3zSxXiOQkZc987sz/IaIK
QJLcXgpYrAnFCEkBSHnrr8weQQEykvh9CRiB9YK0iRKWNNpbgzZGlA6XDaoICZNW
PUSCwhG3y/x9/2p1fFg/AWhsaoMov2HvLXEwwpJrL/sdeolO0fVWdJHMYXgnbLHx
ali2aTYgiRYM+1CqKZvdgZkFvdhGg6GBF1GsOpYhnOPFppKq6VE+mUYltaUDh3Jy
+mH6hv6lk5b5fLKJ9nCdtinzfL6A3Occ6TRHj52cYNI8zCC5kYPpaKHIfJTBcCcO
uCsGeLIg1bl5e/QjyrSTdZeQEwrd95T4qUF3Oqj1n2qzeS7Dpi8etZuaaMh9pvGR
IUgzoMCvv6uw66qQnI4/qDmqRjzDguhlfcmi13F4qkidrvgG2MgKxZY48IgWbLvD
jztGkxbWuWxNzpOjgV/ui7dfIxQC5F4T07p+N2NTiAnQSG3E5RnPxzXcGwkoxL7n
A6+cxn+Yzw8lxjV1YMnG4UNLfLUNqdIHkidBGYwFHsy+AS2OH0RxltU5jy0HRzxB
dqJxJbIZZT/pss5DOpjPYHLPz9ljqt33k2JAi6ANbwEDcG3xK3I=
=oBkM
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
