From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH V3 0/5] ARM: dts: bcm2835: Add Raspberry Pi Zero
Date: Thu, 25 Aug 2016 15:45:14 -0700
Message-ID: <87oa4gv56t.fsf@eliezer.anholt.net>
References: <1471792204-21908-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471792204-21908-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> This patch series add support for Raspberry Pi Zero with USB host mode. I=
t's
> based on the patch "ARM64: dts: bcm: Use a symlink to R-Pi dtsi files
> from arch=3Darm" from Ian Campbell. Currently there is a bug [1] which ne=
eds
> to fixed before because after applying these patch series the bug isn't
> reproducible anymore but not fixed.
>
> The patches 1-3 fixes the USB DT settings for bcm283x. Patch 3 is only co=
mpile
> tested, so it would be nice if someone with a RPi 3 could test it.
> The last patch based on the work of Lubomir Rintel [2] and Noralf Tr=C3=
=B8nnes [3].
>
> Note: Patch 3 can't be cherry-picked because it depends on Patch 2.

Pulled this series minus the arm64 patch to bcm2835-dt-next.  My Pi3
setup is down currently so I wasn't able to test it.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJXv3T6AAoJELXWKTbR/J7oz7AP/RB69H1CF5Y/73rMJblmEkss
NVBITfS2jKbFzG8wFWg2gErAdpVC3PNVelKcojYv3+Y0+FfW+GZUEyU5nDXW3yGM
JWHbQ/H3mQ5n8UKxiQ1TLAbeNUURFvrgifC4cIdrb2OXDjMBYmIJZ7yPrlEXWoL7
GkGt5BjUa5Uk26BbHSVbrpjLTyVZU6ElqAPbuSTiamsAojkQzCZCxtXbLx+Eizb0
RMBoGgxFw0NUk+fAsaBXX5p4quEo+9PHhsrZmKDs2chwi4OmpnB4OZ/VB21Oabvz
76d1JlRVwWjA2Q/38Pkffygo0IhjZpFKU5Grq8/+ni+myxSOsXewxcah1Lo3gW89
8oPVaNfaducGlZk9UYk/dkJGALEM+vGpal8y3YVPcgZRG7C8OfNRjhQ8lp0DMQT3
I3V3b94bi2PDyeMvFkUgERI2ZG8kAerKiRTka4MuKgj4jAZz4t9ko/h5ixhdpqLc
MLqj9NDxuiMEreMcFINpho9bhot6KWB86hjGv3KjV4kbkhHfZ/syGvn4TCB5vhnX
LKoqWslPrWzPvNXcmhWZ//Gj35LGrYRDKLKSv7firqAfAwNQth1gxlqiBg08tTF4
3dM3XSNHTU0Ub0kggR9uab9+R46Jcy+URuz4smz6qHkeY4paao3LR9K1NNjvACNb
PfhUaw4zcTqVwQ2jcbUw
=3j9H
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
