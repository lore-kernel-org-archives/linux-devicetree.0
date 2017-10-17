From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/9] drm/panel: simple: add support for overriding the
 pixel clock polarity
Date: Tue, 17 Oct 2017 14:14:22 +0200
Message-ID: <20171017121422.GE684@ulmo>
References: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
 <1507721021-28174-5-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gMR3gsNFwZpnI/Ts"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1507721021-28174-5-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lothar =?utf-8?Q?Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Cc: David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--gMR3gsNFwZpnI/Ts
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2017 at 01:23:36PM +0200, Lothar Wa=C3=9Fmann wrote:
> The Ka-Ro electronics MB7 baseboard has an on-board LCD->LVDS
> converter that requires a fixed pixelclk polarity, no matter what the
> panel's display_mode specifies. Add an option to override the pixelclk
> polarity defined in the panel's display_mode via DTB.

I'd argue that the LCD->LVDS converter should be modelled specifically
in DT to handle this case. It could be a implemented as a DRM bridge
driver, for example.

Thierry

--gMR3gsNFwZpnI/Ts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnl9B4ACgkQ3SOs138+
s6GjxA//VWh/NFzHmYm3N51T7LxRIavqYIl4LVUcpcTBatgKR299IGsCLXkrX7BV
vaAAQX3oToZE9qwJ0HQmbrt+UvawGkDgUxFi4NSnAN1NBbUHquZu2TyyZHU9zis5
05xgtylKL0f5PRcX4ZagWSddcZeY6CkH1Zu85o0+UzIdgu66vEF0uFPhKMZqAYEI
xUgjhWxgEaXtom46NEqMsU9h1JfglSYVTbplD4kJKozDYedqA+/PqKl6oEFFcR99
9ZiztkKyOEZEiVMUWpbkwFjwAFrYywOiMWfjZBjgl+n7Jd4LZVcVvAXteu2vYnQs
6cPcyT8YVu7ZzSZ5qbciKolzlAB62jOt1Ol4DKkwHUN3lmQcLaftaCK4L+M4vKaI
Lb4FJhHm69dQRYtPSp+pKg1xIDIQxjwHtVi/ijRYSvMuPi3SoS0+q3UPR9EfNvL/
2M4F59IdwLoz3JE9fjDJZPbjM5iSO1zPv6vA2bROYXpq5xPq94Oq78qApUDQhj+h
zfjQMDWKETjDuYbWywth0Uet8wfbI5ngT8KdsEl6bc0sVeOTE9n9I23AcObXTrtc
nmkpGoQADsebSr4coMLKKH1mu2ti+XbnHbKPi6tXKfoWOKOBR6dTHP2zmETRE20K
rs1zz5/l94QVP5RQChJXag1jWpMBgef8V4gGIZNEJiVh268LJBI=
=D3ZB
-----END PGP SIGNATURE-----

--gMR3gsNFwZpnI/Ts--
