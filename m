From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 5/7] ARM: bcm2835: Drop the fixed sys_pclk.
Date: Fri, 29 May 2015 10:44:38 -0700
Message-ID: <87iobb46t5.fsf@eliezer.anholt.net>
References: <1431978219-14226-1-git-send-email-eric@anholt.net> <1431978219-14226-6-git-send-email-eric@anholt.net> <55679125.6000607@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55679125.6000607-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 05/18/2015 01:43 PM, Eric Anholt wrote:
>> Nothing uses it, and I can't find any evidence that anything ever has.
>
> Does the clock actually exist though? If it does, it seems reasonable to
> keep it.

Yes, it's kept in the form of the core clock in the RPi driver, and the
clock-frequency values in spi and i2c in bcm2835.dtsi.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVaKWGAAoJELXWKTbR/J7ohJkP/jkV/olawJ1ROZfniBArDxVk
iw8FaIpYJB7LcCeXmR8dbUN5PS0XX+0/nE0b/CAl5f272fE9d8eFHcSr0pR0ccQW
EwdKd1NsSTy9fCNnnph8vXOjaZ37b5pCGSxB8v85ZNCz/yhK+VO+aPwM+b5gnxZZ
bp2iCB4XBESd/AhbjF4/N1g1SibwhYY6VnjLmZ4Va+wXLH+bhjwpERI8LaaBjybC
5+/r5Hxyzf5ZyZ1VKiNUiALo3N/mNZm7oZw25v2hkalbgHRNgxw0E6CNzxRgyvMz
oFs9Yr2caLlewsfzUM7y0OIZR/UtpTEEEPmrS96k+jzwJYSlRNug5M7VuMpW0GXB
GvwcZhY0eeGBkYtQ84md1hH5R8j7/UEG+ou3fEjbuR8xdbuXA3e69+UYDFFuiFx8
RY27NANWTJLYGJt80zixT37MWqpQ/gJ2kAjzy/dFx32s7YIgRNVHbYpKMi47G8c2
W61Ye5+3PTpbzmxErChx4Bg3eJBp3eRvMdZdfLXcHOszAcv8ytcwddqTjd3/ctK4
RQmDyf4ocDiH1Ib1p6/mJXqltILrpox0SCW/hU1Uu/wfVfHzqo2qy+VgO8Ho4NrH
Ih1+b6vdzJ3RQNDyh4HNDQbLfX1RcnPha9eajUwb+C3hvpgjrWv1hBX2WH0kVoM0
pbFu7CbbRi63x7ArFuo0
=L9C2
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
