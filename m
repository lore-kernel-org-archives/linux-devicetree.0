From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 6/6] usb: chipidea: usbmisc: add post handling and errata
 fix for mx25
Date: Thu, 15 Nov 2012 14:54:42 +0100
Message-ID: <50A4F422.4010606@pengutronix.de>
References: <1352894137-2050-1-git-send-email-m.grzeschik@pengutronix.de> <1352894137-2050-7-git-send-email-m.grzeschik@pengutronix.de> <CALBypN6U=np93ZwnEZqbh=j0Vb_-x630GaktEiv+4K26eYp4Pg@mail.gmail.com> <20121115102525.GA16118@pengutronix.de> <CALBypN7-NKFmoPXWA0utFhUjLOWjvzwJ7ZSuQBa+W5edNQA_OA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig4DD4F978DB95689580954698"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALBypN7-NKFmoPXWA0utFhUjLOWjvzwJ7ZSuQBa+W5edNQA_OA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Fuzzey <mfuzzey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig4DD4F978DB95689580954698
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 11/15/2012 02:51 PM, Martin Fuzzey wrote:
>> This is because that series is based on Peter Chen's work. I should ha=
ve
>> mentioned this in the cover-letter mail. You can merge his master bran=
ch
>> before adding my series:
>=20
> Ok thanks for the very rapid reply.
>=20
> I've now built this together with patch 2 "ci13xxx_imx: add 2nd and
> 3rd clock to support imx5x and newer" from your other series.
> But it hangs because the usb-phy clock is not being enabled.
> If I add a clock enable for that clock too to usbmisc_imx.c it works
> but that can't be the right way.
>=20
> Who is supposed to enable the phy clock?
> [I'm using the OTG port in host only mode on i.MX53 with "nop-usbphy"]
>=20
> Here's what I did (illustration only, probably white space broken):

We've have a patch that the missing clock handling to the nop phy
driver, which isn't much better. What are other possible options?

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig4DD4F978DB95689580954698
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iEYEARECAAYFAlCk9CIACgkQjTAFq1RaXHMavwCfafUy5AxP4ZJKin+RrxKkIk4O
OUYAmwWGZTYm75bJenvHS3sqHKPCD3er
=bWiA
-----END PGP SIGNATURE-----

--------------enig4DD4F978DB95689580954698--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
