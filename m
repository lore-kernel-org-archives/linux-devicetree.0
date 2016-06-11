From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: sun6i: Add pmic / regulator nodes to
 Mele A1000G quad dts
Date: Sat, 11 Jun 2016 17:46:44 +0200
Message-ID: <20160611154644.GF19854@lukather>
References: <1465469898-8102-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ni93GHxFvA+th69W"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465469898-8102-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ni93GHxFvA+th69W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2016 at 12:58:17PM +0200, Hans de Goede wrote:
> Add pmic / regulator nodes to Mele A1000G quad dts.
>=20
> Note both reg_usb1_vbus and reg_dldo4 need to be on for the hub attached
> to usb1 to work, and we can list only one usb1_vbus-supply, so dldo4 is
> marked as regulator-always-on.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
> -Add a bit to the commit msg explaining why dldo4 is marked regulator-alw=
ays-on

We should really have that as a comment in the DT.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ni93GHxFvA+th69W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXXDJkAAoJEBx+YmzsjxAgMhgP/AiuUyoCerjYKJWZ1OI4PPPa
MNh2Vh+w7AIQmGwo2iYSMA16qWz3l2RIunj3f+V2Ou6muXRohuHg4LwZWrfUUUEg
+KB11uu2NT3MBr/nAFSHZrPLxWxqXm98ElLGbddELzxMXL3FKQRMuiMkIXc7dA5k
Uf4PjcQjnzGcusgsr+bjH8CMvUpwj3u5EwQFAksHh4szmAb1TlXm3GpAscBidnnV
2nxGqZHbmG3grXlCJuwIxcWuvDML5BTeoIloQ8RZP8k9kZ6q4Z62NGyX9GSXKmqR
j1afwYctZ8o+7a9pt/4VhZ5e9aVL2Za0ooV7OSNguxoB5i9hc6+n8ASBp7/sMvx0
kSZc9peYkldCyS8H7vt8466Ao56yz5jwhX3uz/+rL9V3mFVw8FCvOu33W2PMl2YD
tZE+qsai693vIXZA90k8NWEdUNsAVCScW/50fOJFIbOGHxmwMw0ReBti0qsUkrTh
mhpQ0OgB+tQZsxtQpeZPENvhFetG30OMbmUgL9wP3muGULsFyWalxpBCpyg3VJzT
fr08+Y4OTlYX9oK7SnDZwU88gtnuVJoRHn3zU+dsg3reilKy9cgyPPKBdCpSvp07
/GlDuVg2+tEG8KHGKtjog1Vl7RuYW1NO2VzMmppQ8LSm5416LN0UNLSzwjJiNil2
8QvQryoQYulJucWaDuUE
=PvfE
-----END PGP SIGNATURE-----

--ni93GHxFvA+th69W--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
