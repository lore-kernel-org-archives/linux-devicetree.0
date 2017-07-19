From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: move rpi into rpi directory
Date: Wed, 19 Jul 2017 13:21:07 -0700
Message-ID: <87mv80dvpo.fsf@eliezer.anholt.net>
References: <1500483950-9217-1-git-send-email-scott.branden@broadcom.com> <1500483950-9217-3-git-send-email-scott.branden@broadcom.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500483950-9217-3-git-send-email-scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> writes:

> Place rpi into its own subdirectory.  This helps as the number
> of Broadcom boards grow and we can separate them per SoC.

It seems like pretty unnecessary churn to me, though I wouldn't
necessarily block it.  However, it conflicts with the patch I was
preparing yesterday to try to resolve our DT merging troubles
(https://lkml.org/lkml/2017/5/16/707), so I'd like to hold off on it for
now.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAllvvzMACgkQtdYpNtH8
nujAWA/8D9U8lvrWsi0i2eLaeR07EDBh+bRv8twOgQyocc8vxOCAyqlisslO+pFX
Spzvpnwi6jvXUE9MxEvk4e/nY5q3EWqXqpttwn3k1jxi3NNv/666E36BYT4I9Kg5
ImdwZy9GHmgPOwEal6o87Xhh9rAihpM0F3bZqeZOf1CH2Dj0U0aINgiUVdjJNXY1
734mV+DNWLecL9srhI/kGYpYJRwbZDKQaNyabRjto57ttAif1Fm+dmW76ySne77h
q9YhChhGAEF17MKxsdDNhaUVgscsD46ajHvIjJIlGB70p8FWnh89ISYlo7Xp6BW9
mW0Saxh5rzstNoIiJitfMqeLDFmTyj16yYK1MzWJhLaKt1YpSQERaMO9oj7UVfV0
ccQUlcP0sitpPNDtLMWq6GJ3xt6pL+huX2TFVlvOlwx4URSAS8Fs1QOFd+2gYbVk
g8A9HMQ8mJICZ23ThGJE3Pl5biQ4j5rCnwwMpccbgoUvvG8RHHeQvOy1WPlPYUr1
/v8QtonEh0bRR+lcayzQT4Z9BT0lwd8GwogjAIkDPCx/uaX3ovNpN4UeI/pi48y6
F78ZDZAEKthuENvifklTdZ4cjPzywAsN4PBXqw+PQu4XlbY/iHAZAOJdOJzehKDg
IIiEgg2kdZH5wLMX76rbcEnGmnfLMozPVtt4e4hEpX8524Dez14=
=rP30
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
