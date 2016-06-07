From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun5i-a10s-wobo-i5: Enable ldo4 too
Date: Tue, 7 Jun 2016 22:44:51 +0200
Message-ID: <20160607204451.GC14179@lukather>
References: <1464977440-23441-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5G06lTa6Jq83wMTw"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1464977440-23441-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--5G06lTa6Jq83wMTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 03, 2016 at 08:10:40PM +0200, Hans de Goede wrote:
> It seems that the wifi chip is powered by both ldo3 and ldo4 tied
> together and that using only one results in the wifi-chip dropping of
> the USB bus sometimes.
>=20
> Ideally we would have a proper way of modelling this (this is being
> worked on), but currently we do not. This is not an issue since we need
> to keep these regulators always-on anyways, due to these boards
> crashing when ldo3/4 get turned back on after having been turned off.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--5G06lTa6Jq83wMTw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXVzJDAAoJEBx+YmzsjxAg69oP/2/aQqa/v2dEXU4uk+UmRFJR
BhEhGKT2jT+RBFSjdZNAQEB36w1z5iq4KubZL4XYIlGnSLixDPiWtt987whzGDge
8VP+WMuPtU4rR2ixp6FbNuOtrT8W7YY0zGJ8DZ+hqw45nJu3UOZfAOJXGkaQLRrD
YCa14Adbid99DdNHoguZK+o9LxBSCxFSELHvAy64dDkjNwGZlB5huzkG/6BdpsVt
IjNrPJx1XtNF70ypguMYfgNrSnM++lpkrto7Xk69CjHknfw8Qnibmjuosns4K1BP
rv+QgD5CSVOymsA/SILwo6Y8e6r+m116iBfoaTM8sUB+X4FNy1P7IUqSwLymdrhx
YRGbfdXlK/T2+VMCRIZ/WII8RSX57vnx+1X1Q+xgEKvmOyv+X5kLGPRV1XBhpISe
Hb31v5XaJCC2bavutCgiDKsb5sGEbeeA58un1BXQxwiAY1PSO/o7TL8NVTxk3Z+/
2O+vgyDnRfhMQkL7sdkDqyb3IppiUI0N428LsHNI+SaJxj9Jh7Zvs1VY8zhu4wiN
Muh/U3U0i7yYMuM10d+PMbWIyzzlcr5aA7tXNYQNSAKhit0NT9LLH8MCQ6J9zBiN
0AmHKsO6NWzdZ3S2Cg4A8PcR1ue/XZd9mcbVYG92CHJhX12lFtzUUZzax+LcGybt
4nW5YJvorkawtv6R5tRv
=Vu3J
-----END PGP SIGNATURE-----

--5G06lTa6Jq83wMTw--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
