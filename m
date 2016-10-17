From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH V3 RFT 3/5] ARM64: dts: bcm283x: Use dtsi for USB host mode
Date: Mon, 17 Oct 2016 10:29:18 -0700
Message-ID: <87lgxmkhox.fsf@eliezer.anholt.net>
References: <1471792204-21908-1-git-send-email-stefan.wahren@i2se.com> <1471792204-21908-4-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471792204-21908-4-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> In case dr_mode isn't passed via DT, the dwc2 driver defaults
> to OTG mode. But the Raspberry Pi 3 is designed only for host mode.
> So fix this issue by linking to the dtsi file which set the dr_mode
> to host.
>
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>

Applied Gerd's Tested-by and merged to bcm2835-dt-64-next.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJYBQpuAAoJELXWKTbR/J7o8iEQAKpHnoSlaz1OvIF8gy2SNBVa
dkM33RFkzNvXGmL0ZsyHTMK9Epj9KMUZaojZZUMg1Y5Tuw1ZVqm27IyoIhm4IDcn
xaoKrgB8MVV9ARG+v0dRrNGIKDNSrOTqXKSYJmkCfKdgZLXsCEh8Zp7eck8S2fLY
XbeT+40FIsX2rNGS0/C4hx9jElQKQB4nptJba9Qh6VyZYiVofehemEeB9h9uHoZu
Tby0OEMMf9e4RKWcZylE7Ura2qGeLuedk8Teu3gOFQ194UxSwsBRltuVXng/QKLj
YCoUqE9ocLcEno+SbUdKY1fnh+iMf5QHqwO8EAwzsA5DIXTeZnw6z1OHBpxlF8rE
WOy9WqWzcrtitZ9mwfKIoVwrU2gMklyUKToVMAuCx0OZmJdQzRUQGlQEp1+s2xOT
TpYNt2f/uSHAgm5gFY0ge9KO3bX23wRp+M8O0hy1SKNTfrVF5lXRmh+7a7AWjvV1
qPhK6lJ64M5Db9PgLzFglCRdxA9Za11SIqrwe+Zd1O+B8c7hwj28Yi6K35P46Nxo
M1neJ3uFEcJFJODK2bM2d2r7rnQC86wbZcFOE9yrSnw7zn9jRTndI53gcRVyMJJ6
bVSPVd/E4ePWVpSNYakonkeL9jJiy7Xywsr+F5ggI9h87LgbzwizETgESa9kHurq
/Unc+BWcdCYfNw5UbPUY
=m0RM
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
