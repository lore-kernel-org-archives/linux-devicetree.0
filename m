From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v2 15/19] dt-bindings: gpio: Add support for r8a77965
Date: Mon, 16 Apr 2018 15:07:21 +0200
Message-ID: <20180416130721.GB3377@w540>
References: <1519139541-18783-1-git-send-email-jacopo+renesas@jmondi.org>
 <1519139541-18783-16-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdW4k+GROdy6kKT-3jd7YYGVbKvieyCSEWXGXJyvZg7NGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xXmbgvnjoT4axfJE"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdW4k+GROdy6kKT-3jd7YYGVbKvieyCSEWXGXJyvZg7NGQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--xXmbgvnjoT4axfJE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, Apr 16, 2018 at 01:12:06PM +0200, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Tue, Feb 20, 2018 at 4:12 PM, Jacopo Mondi <jacopo+renesas@jmondi.org>=
 wrote:
> > Add compatible string for R-Car M3-N (r8a77965) in gpio-rcar.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Can you please resend to the GPIO maintainer?
> Thanks!

Thank you for the useful reminder.

=46rom my original M3-N support series, the following DT binding patches
have actually to be resent, now that the SoC support is in v4.17-rc1.

dt-bindings: dmaengine: rcar-dmac: document R8A77965 support
dt-bindings: serial: sh-sci: Add support for r8a77965 (H)SCIF
dt-bindings: net: ravb: Add support for r8a77965 SoC
dt-bindings: gpio: Add support for r8a77965

I will resend each one to the appropriate tree maintainer.

Thanks
   j


>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJa1KAJAAoJEHI0Bo8WoVY8nbsQAJo7vULjkaCO/iMsjeYGgbqS
394iQwYhLWZ2cAVbvWc7srLMJDA3oy9HwuK72rAuBRYiU3uTJXE0b8uAI0YdJZI+
cB0WJc3WwwbNq9sE55j72xH5pBWGJYwKxrUv6BIf6GCTIwyVZsh28oNRjTJUaSWP
jhYxZTXuBsVoJ0K9i+2EQDjPmIzXQzF/kK8v/z3h7bQih2/7yHOjZl+5sNDwwX3f
RjN0L9P+cXY3SVJyEb4Ax1l5NP9MFZ8FkNEOijV7Yg0INVD7M2+bZeDXNmcC2400
IiZhEYDY7bgEmRM5FNfUvXP+550GYBZdBoSAT6Vx2OXPod3mE6y0iJYuvVPw8DIQ
Q6jHfe4g4wV8knV+FZpBpFylVhA2KsGqGHkVMzomBltamcukmL0FyRJctEwIaQX7
ynbDhoBtBppgg4INY+vXqWtO9jxoTCF7H9DKVLZz7o5M7fe936FHyipxG+lksowN
32IAgsx9VgTuJCbf5eco+24vhERU5othazdS0oKwDfm+tuw8Rw/n8Yv3R5YGeSS4
0NzDV+jphU+/Ru+XIE6MuaWMu9QLtqWNWZy1lMxqqeRFx10pDi/aFTXxsBA6Yg+m
VnlEYMZtNIYOz1Z9szhe1HTtBDQd97Sgp8h3B4OZPFrkYhhBX06IIk1SVzkUTvDn
VhLcu8UFzHzGWT06DXK5
=tQ6Y
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--
