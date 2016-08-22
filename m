From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH V3 2/5] ARM: dts: bcm283x: Add dtsi for USB host mode
Date: Mon, 22 Aug 2016 10:57:13 -0700
Message-ID: <87fupw4rgm.fsf@eliezer.anholt.net>
References: <1471792204-21908-1-git-send-email-stefan.wahren@i2se.com> <1471792204-21908-3-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471792204-21908-3-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> In case dr_mode isn't passed via DT, the dwc2 defaults to OTG mode.
> But all Raspberry Pi boards here are designed only for host mode.
> So fix this issue by providing a dtsi file which set the dr_mode
> to host.

Can you explain what change this should cause for these boards?  Is it
just going to drop this message from dmesg:

dwc2 3f980000.usb: Configuration mismatch. dr_mode forced to host

or something else?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJXuzz6AAoJELXWKTbR/J7o+CgP/AtHMrHVVBx/6uwzG/nebFcG
MaV+dHDR0rpXPa5Seae6mXo63uJ6fYHgF8tsLjdkvrs7pRVC2kJvtCYccnxx0Xcz
JjzSic/D0nd8NAQ47SEiig7gqa8VrDNVnapyCkj0Xeqa83CEEmxJsYWdZaMtM9hw
2uEYIno19ouvceYyz7nC9BWkgc8UKXwShUQASqgxEL9QHtjkj3VUL+rXfetmObLX
SzcZZc48wXYQBiNsyxTcAzhNcCTJ0kNCVlhaG5yT9k+luS/8eHF4Vi9bq+DTSwQ8
+DWceL4PGlThT2yqagZrPHSOFGeNEclUZx4ibJb97/WdsiLK7hkZNsTR5mpSVmqg
yZjre8EMYDQxuKivxt85NoVnkVQJNxq/vefIL/3+Hc2+nRb1alWJSDJUNuk0VxEq
1fJClEURkHad5g3Jil8u3qWuFrl/nbdmvsSzJG+W4E3AjNpsZlRGAcsW1NLD+aSK
dQAkZEAME/i+hbz+b4WRQO1XIZ0w/txOMJoRmkT5hxVydrWY8AHzAIa57UzZQq92
GBiVgnoG2efheNcfdZSS/cHO4aN/1TPyP6D6DRVVd8/aVgVB0tAxiahGbjyl4eAX
1zBi3E9sgvcjb5n659NINmQpRFG0eninv6RrJwFEyZzyM/JeJRWH+45KObP2Pbfy
HQ8McBWqpDRdFkgPLBQA
=H4mO
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
