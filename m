From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: dts: cygnus: Fix incorrect UART2 register base
Date: Tue, 15 Aug 2017 11:18:37 -0700
Message-ID: <8760don18i.fsf@eliezer.anholt.net>
References: <1502817964-8221-1-git-send-email-scott.branden@broadcom.com> <1502817964-8221-2-git-send-email-scott.branden@broadcom.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502817964-8221-2-git-send-email-scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> writes:

> From: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>
> Fix incorrect Cygnus UART2 register base.
>
> Fixes: 0f0b21a83ad2 ("ARM: dts: Move all Cygnus peripherals into axi bus")
> Signed-off-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

Reviewed-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlmTOv0ACgkQtdYpNtH8
nugqOxAAs8N7waU421cyjjWx3AJ7MqY/biATwSHDKb4uqlsIqu78jQ8VaZqSr/01
+WbPtKg82NTgBo4WQAiq+/oLf36Qe0hacs3HIHbNYTtISJi8s1yBntkHRiVVcZIN
okjBSKjn7lZv3Y4iPsiAqlSlljliQKxFWhlSn582q7v9QHxP0xYRIv+9EaPq8Dw3
HcAvEkGfL37fSqF9xlrKSZZkSIgFP0Lvi0n0CGrei1U3idEXbRu7+t5xl5aSvqBm
owsRN3m8HXyl5hknYhe8XYtZJcgS/Gp23Zwciuibs54iGeWaxaTMXTFqxpxw5WKd
y5o6dJ25PIxuadhw/D5jORPTeCU87fKhGObAvxQyDIZOHMjdEStZ1rs4QfmfFngM
TBTR4T4OeYi/fx9sg1bPguvKMjSGMlxwlzwLBgJcxgZ9j5vwiVZhVQwjPaoevCL/
Fk7u48D5y4EqT5WHv0YYrHsR1AJR7u6jItcQHcK6C/h5HD0oVo/xenLctOiWSeQK
Y1ju6sxGGZ08++J9irsTLaydxXh6gjfhZwhBMw/wH30biDP6laTR7CZdb//otsqB
2pJqUvmia3V1rrs0fGbhshDKU/J2da35tNCg4J/iFSv7h9MYU1cKJ0dX0nD4hCI5
LRvTTK8fw35yS7YZQeNOyHk1f2j/ik8pXO75p+Qiqo6HRjoAvCQ=
=mjVS
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
