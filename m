From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: bcm2836-l1-intc: add interrupt polarity support
Date: Fri, 15 Dec 2017 13:53:17 -0800
Message-ID: <87y3m3mzea.fsf@anholt.net>
References: <1513024752-11246-1-git-send-email-stefan.wahren@i2se.com> <1513024752-11246-2-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513024752-11246-2-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> This increases the interrupt cells for the 1st level interrupt controller
> binding in order to describe the polarity like on the other ARM platforms.
>
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>

I'm happy with this.  Any DT maintainer concerns?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlo0RE0ACgkQtdYpNtH8
nug0AQ//U+shV+t1a59TVB1VaEQFPyxTqudLSOQRlEhh9kqLQgIOeHmhlPKtm2A1
RN/+fgF3caqdA2JmkRG40vwRgwyMTwcJzA7Tj4x6ayl7RYvUoTLYms+EFNrkqDsY
0dOrhSWRD5N4f9ZLMbQRcftwSeZBUS2KOg0ORCCHvJE/l2yBpyh3VzBRIiw0/lIz
0LfAktQGlGYYwSvZZSWZD0N20A8sTSZEd81hJ9Vh7ZEnguIQeagp587rFLF3204F
cmFHakzMzGZJx8+Yic5osc64xkL2WPQm/inCHqGuolgnvpvrxFmkHX3XCbcmEbKJ
0StsBi7oOokAIwEd/77Oudr8++1Kf+Uac0GooIBAIjSshNrPWhCdgG1pqa7ybg6v
Cz9KXmV3dA+n/RJlZf2ZN0jj9NMzBOY2De3Y3VexhHHUj7ic9yw5SkG4wa837YrZ
aUgCkDJpHj0uw7+d4JklX34KT3K4cctdCKOzJRDhvhRyhpHaMFc6eAxUynNP+0vV
cSu4sWLGf+hQ0uGFyEN2zjkxWkc+sVhkngmOCt+DseW6eMEyqUOvlB/+txa03CSD
ytZsyO1Rs6e+3uG8jEfFwFIaSKpztf+hT2uhi/rJyQxftlrFUNM8yQ1gB8ObU0qE
YKrLPMgtHzreIg4Ftmq1GJUbcSov7/q3UWCvWwzkjmyy4JIOr6w=
=ZD6q
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
