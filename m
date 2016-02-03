From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] clk: bcm2835: Add PWM clock support to the device tree
Date: Tue, 02 Feb 2016 17:33:36 -0800
Message-ID: <874mdqr30v.fsf@eliezer.anholt.net>
References: <1450728779-2599-1-git-send-email-repk@triplefau.lt> <87twnbe4o5.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87twnbe4o5.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Remi Pommarel <repk-lovNVp52yxIDGOk2Oe9MvA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> writes:

> Remi Pommarel <repk-lovNVp52yxIDGOk2Oe9MvA@public.gmane.org> writes:
>
>> Signed-off-by: Remi Pommarel <repk-lovNVp52yxIDGOk2Oe9MvA@public.gmane.org>
>> ---
>>
>> With the upcomming PWM clock patch (see https://lkml.org/lkml/2015/12/6/74)
>> PWM can now be used and can be added in the RPI devicetree.
>
> Looks good to me.  I'll try to keep a watch on the clock tree and
> include this (possibly moved to bcm283x.dtsi depending on if 2836 lands
> first) when I have something I can pull from for the BCM2835_CLOCK_PWM
> definition.

Did the rebase and merged to bcm2835-dt-next.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWsVjxAAoJELXWKTbR/J7os2QP/jvl+cXcvwLSkB8HUvxxjcPo
m4XhW6NvF1VdYqNrvqFxp80MDEFdNd3ZSJysQZ83vPb+O14FKOlPfMtUoIw+orQd
iwq/hIpMo+DyAp92XGCs4SFwlU98pPeEmy+jnQlRVYUrV3Gj/HBRZXpUnfDtiKAh
Glk28vPUmgGkDwgB4XMHzUmkk62me97Mtry0cGrXVFi8SK048COtZbMfGc1Fgmj5
vbW6ezyYRtzdU3sRMmLWMMqWmznKPsLH+3X7tVeUj4i8uu0GPjkiOzn75ZNAT3SJ
1o9IdETXOTSYEt+5izATaiTq3dPjb8gxhZwTMdyYbXB/B+bl8jMtFqHqU7zdY49I
rzPr4/zHWzIV64EBQ3zuUbw9LZh/VvcRYoXsnEmL0mG3PVnePrHWHBK3MN10NZiD
jIE61E5F+1ivu7vY9Tab1ncQLBeVG34D3gmsHCdhVYAYsG4egf3MNErlM7GrNYAq
MFoUfTCEa4UjKfgDQMVF/itdU0wLP4Ml2Jnh8HQWIz7TnoJ5fZvdXZHlky6Z7AXv
ndivPSNsLq6N/ZwddX5BeuA22QDU6JAJ0IQ0eaiTxjmFxTiR/hgtkg+Z2COWbMqO
5aCR+N4+hGYgAVOPcs3Iuqp7pYilvmj7DfbvdzqNg1k6KpZiA8+nKjgz95V0kF96
nIxZqHiCEgmQ0zk06BIJ
=pJBA
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
