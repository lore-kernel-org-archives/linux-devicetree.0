From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: enable UART1 for iNet D978 Rev2 board
Date: Thu, 15 Sep 2016 10:35:30 +0200
Message-ID: <20160915083530.GD10128@lukather>
References: <20160915021504.65483-1-icenowy@aosc.xyz>
 <1262161473906138@web14h.yandex.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rMWmSaSbD7nr+du9"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1262161473906138-MWZxdpSzzcxxpj1cXAZ9Bg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--rMWmSaSbD7nr+du9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2016 at 10:22:18AM +0800, Icenowy Zheng wrote:
>=20
>=20
> 15.09.2016, 10:15, "Icenowy Zheng" <icenowy-ymACFijhrKM@public.gmane.org>:
> > UART1 is connected to the bluetooth part of RTL8723BS WiFi/BT combo card
> > on iNet D978 Rev2 board.
> >
> > Enable the UART1 to make it possible to use the modified hciattach by
> > Realtek to drive the BT part of RTL8723BS.
> >
> > On the board no r_uart pins are found now (the onboard RX/TX pins are
> > wired to PF2/PF4, which is muxed with mmc0), so also disabled it.
> >
> > Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>=20
> Oh I forgot to add a patch version number...
> It's PATCH v3.
>=20
> (But it seems that I should send a v4 to split the dtsi change and dts ch=
ange.)

Indeed :)

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--rMWmSaSbD7nr+du9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX2l1SAAoJEBx+YmzsjxAguZAQAIG2KCUc1s6Z3v65C3HAVime
55Q4RA6P2gdtOmZgceIJ4vBeilLV8T4FFLgqSEFZSSvXZnO0fvTWJkOcxwcgGkFe
9NU5Wh6Abgle0FOvV3sVGZRwSR5bvkquk3FHr+AuBDA7i6IYxCDjx4w+6wtUWR9W
T22XZtQIwpeaWIWGjFiW7e4nSwrFlls0PxqSCIJHVG1SuX8DhvY9S6BjGKdn7mgp
bZarW/OnIQgzpMa7qalV/7yG+GDBVZSttBQLaf4351Yz7D1Y8WH12Gy1ZCY30olO
msUqAEqwbO8JGvZoz4EdJKT1Qsk9aVFjAgLS6wQChp2FQ6vqs+ElIK7j6wtCO1/8
7kL+SLOlYnZNOoWRoDbEPEAKPiGHJLG58uyxwnGvu/NUrDuTCClSsARiRzXfEKHR
uXhtFn483omaAmvQc8hr9Err5o6SWEHLtTgZ/e2QzYaeIXx8LHvHqB85qAOJ92K6
WpA0HgJ0q2mJ3osDMZwUeWtkyjy6mgCVr2GsrBBSLNqPgeCDtom/ZCd7kEmJnmR1
aFwrKRQbj1XRxyrYTn8SBLNJ75gWlr0LOug4p5upccVodwkE25LilmwXkoF7T/I+
ptIwOmQZcEQncVP/gW3NptnxnwVoAqxN58IhDmSo93KD5OOSa3taSX6iCCgRfGlc
IAb7Xj69sWNiCHCmLROR
=/EqM
-----END PGP SIGNATURE-----

--rMWmSaSbD7nr+du9--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
