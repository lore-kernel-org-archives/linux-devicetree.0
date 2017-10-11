From: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCHv2 0/7] Add support for USB OTG on STM32F7
Date: Wed, 11 Oct 2017 13:04:45 +0300
Message-ID: <878tgim24i.fsf@linux.intel.com>
References: <1503930018-536-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1503930018-536-1-git-send-email-amelie.delaunay-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Benjamin Gaignard <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>, Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org> writes:
> The STM32F7 MCU family embeds two DWC2 USB OTG cores. One core is USB
> OTG FS and the other is USB OTG HS. The USB FS core only works with its
> internal phy whilst the USB HS core can work in HS with external ULPI phy
> or in FS/LS with the on-chip FS phy.
>
> Amelie Delaunay (7):
>   dt-bindings: usb: Document the STM32F7 DWC2 USB OTG HS core binding
>   usb: dwc2: add support for STM32F7 USB OTG HS
>   ARM: dts: stm32: Add USB HS support for STM32F746 MCU

I have applied these three patches. Should I take the rest? They seems
like they could go upstream through the ARM maintainers.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlnd7L0ACgkQzL64meEa
mQZuWBAAwkgh9BmZ9M4dfOZh1yf5d7YeEVXCRNcTsgHe9pYwtsAXzQf7bEVc7NQW
MgFj8vQw6W0oGjrJV505y87NeZmatl9X+UYS4jsBFJWkDnwDwkjRnOBQEUv+kJCU
Wlyo3umQSFfhi3S0Dy+C2K86cIoThkbnriudEjaMCQRKWySfMO4X6HEOG2cxi1+0
l/rwtABAGIo+/UjYB8BIn5AxS6HoLeK4Ph4JaCyp8ZaZRzbdFOYTao3QjJj01Mlj
qKZzmClAGLtDsUbNqKdJI2CjrKaQDLgxVGmkANaJO58g9Vn2e9vtTkDDFGvcJB2e
20UbiulIvvbI/2OeF6G6OG7X1ItKhqaSxP+xGRKF3egZdGm8ywkK/mPbNF/Q3sep
LU7yp6ytHrsMRCl5+JYtYNsFwZeedW0WL21GbUJ1Sl5S5vLtoIvFR4WpbjO7IYtJ
bemjw1yp2+0UwNVbpeGE6+Oy+k5wqDa8AtZx6Oh2DEczdCyUFoZ9NdHgU1ngLrtr
GzTGl5+/SxK+/VUpun8T7OOtkLUFszytZ7gTyW2frnsGVvbnplHgrsHn3DSE4Lm3
gPgt3yUdvWr1HO5HZUNTr1dL0EXIK8OvhzyxyWL3RJGSdpuqWK4RA6O5fCz1vajF
St0sC0Hi7y/1cSymYY9QUEr7WuNreYdWtgvEaNphrKAsuRMifhs=
=e2Jh
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
