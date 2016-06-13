From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 1/2] ARM: dts: sun6i: Add pmic / regulator nodes to
 Mele A1000G quad dts
Date: Mon, 13 Jun 2016 10:18:13 +0200
Message-ID: <20160613081813.GD4481@lukather>
References: <1465729621-27378-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="veXX9dWIonWZEC6h"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465729621-27378-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--veXX9dWIonWZEC6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 12, 2016 at 01:07:00PM +0200, Hans de Goede wrote:
> Add pmic / regulator nodes to Mele A1000G quad dts.
>=20
> Note both reg_usb1_vbus and reg_dldo4 need to be on for the hub attached
> to usb1 to work, and we can list only one usb1_vbus-supply, so dldo4 is
> marked as regulator-always-on.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied both, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--veXX9dWIonWZEC6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXXmxFAAoJEBx+YmzsjxAgGnkP/095CyleWineWi1NIYYWRoiR
i47D8cDS9fya33rv1YkYDxEfVP8NRKe7ri9tVFd3CPavd6gpEguWmt5+W67V6dCI
iELwtEv/F7DegtRKQZHLjhydjJnbE8j4J+Idvn76b6OggW3Lz4oJwY0qNx9duvnl
2twB/OjCTJJw325d/6nIsZ5jK01sW5rZpipLGa1q1o7tnN9ypmXTwbbeR/VQ0/95
w742bXOSKWNn6ZKSyV00gOjX3hRjJpe7pVsT30vqhE2A5R5EXhnbxZ2oDztpC8x6
1uE0ixQGoViwJWRvWYdItgoVZjEyEsCmHccaG3qou0a0zm+nUDjWZAOoWu8s7b0W
HBhI+gz/KiQCaURHCOIa9MRLbfQx3u9y/2FWPWwdrMXQoW/aTqgW3HwDlB4S3dFU
KnWwltMgbH+N5heTzevhM2lhzD+9D4mPjA3luy/k3/5laLRLJvZ3CwG1/LQuPqQS
JtfW276U10gaft/dxoBeCXh14PRv5Evq1JfoAGProKtUWwROo/IK2wb2Yg4i8N2B
qevI7RmFU/+sLLSaLUEAMsYtoO6I41fIOW+VCXZFxlQcZsPYFvbkSFmcSpmqTqN3
jq3h2UDvQMLi6t30b2tWW3KTsDeqLW6U2nlwBhsyjPE38Vdl5Dd2iSn7lXfqu/fP
garjRx7tlXrVB1eXv6LY
=ZmtF
-----END PGP SIGNATURE-----

--veXX9dWIonWZEC6h--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
