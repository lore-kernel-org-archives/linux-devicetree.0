From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH v6 9/9] arm64: allwinner: a64: enable Wi-Fi
 for Pine64
Date: Fri, 19 May 2017 09:19:22 +0200
Message-ID: <20170519071922.awmib4qphl6ac6mj@flea.home>
References: <20170518071653.36561-1-icenowy@aosc.io>
 <20170518071653.36561-10-icenowy@aosc.io>
 <CAGb2v66mqMveibKKU9LiBm8jzAOj46hFCK6HvJx0k6077fqLZw@mail.gmail.com>
 <79B00D42-3F95-4D5E-9A23-8E893CCF2462@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tafftxaun7gqred4"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <79B00D42-3F95-4D5E-9A23-8E893CCF2462-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--tafftxaun7gqred4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2017 at 11:03:33AM +0800, Icenowy Zheng wrote:
> >The patch looks OK, but given the module is removable, I think it
> >should be
> >an overlay. The overlay would enable WiFi + Bluetooth, and all the
> >peripherals needed to connect them.
> >
> >That way, if the module is not installed, we avoid confusing the user
> >with
> >unused peripherals, and avoid having live voltage on an unoccupied
> >header.
>=20
> But as this header have specific usage, we will also confuse user
> if it's not enabled as its target usage.

Yet you would enable unused resources.

This was already pointed out here:
https://patchwork.kernel.org/patch/9670235/

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--tafftxaun7gqred4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZHpx6AAoJEBx+YmzsjxAgalAP/0j+8+GX9lyGUpR7pDsLEv8q
JF+fphFq4U8hoIT2ujJxk+qwTHUYLYiz+DJ/0ctej1XLCWQoeLzx1QLC6tdvdix+
uJ4g5g55OnhuIF7v1OCYyLqyESAM0wBLT40LW3+Ii3aD6I39xA13lCwLmu8Jq0z3
BkEWIpdM0saIFXp6GJznUjMni9imP2kggcmnE7+THhf1j41dN9uZRSge/vVUwcVR
alU0Rl9mfcRScwabbz3+PqiB+BdW4rlDHvCiZQWKuBdmm8jCFyXQXTozB1w5lF4d
2ex/yJHUiLSde2NGOqGNNLREv92P91RecJ8E7QFlHuYoWAa8Qv62CWMMk+IRypkt
TuSSZXc63Tip6maq1ZSGMZYXFLBC3098sJVjvdC8ltMMIVXpKv7qaV6P1hw/ArPZ
B1qboXQp3nFa1aY6ShpdryxjdvZO13vyT011DmzxYIEqn8HTk+Z5xcsd5RMw/7Yw
UrSuXbRm5LwyLKjfBMAe+9zJZbOE/73yB8O/xC1l6c+HS85Yl5PZ0Zby5iw1z28t
EdnkqjYbnGKdk6bQsSyqQlKbjclCj94FH7eaiEyFJyb5GDguhtudCdfC7GQ36rhU
3f3EknNSASKRaEs2WCzSsseTqjkGCbOPr4fGmuss9OURNtYJwWiLcyiwAoYSvAvD
Gjl9W567FgysmufSCOf0
=TQNS
-----END PGP SIGNATURE-----

--tafftxaun7gqred4--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
