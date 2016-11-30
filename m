From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] Synopsys USB 2.0 Device Controller (UDC) Driver
Date: Wed, 30 Nov 2016 12:40:10 +0200
Message-ID: <874m2pntdh.fsf@linux.intel.com>
References: <1480485910-7797-1-git-send-email-raviteja.garimella@broadcom.com> <1480485910-7797-3-git-send-email-raviteja.garimella@broadcom.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480485910-7797-3-git-send-email-raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> writes:
> This is driver for Synopsys Designware Cores USB Device
> Controller (UDC) Subsystem with the AMBA Advanced High-Performance
> Bus (AHB). This driver works with Synopsys UDC20 products.
>
> Signed-off-by: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

use drivers/usb/dwc2 instead of duplicating it.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlg+rIoACgkQzL64meEa
mQaM5RAAmZrGQuv5XuTphbMyf6hYzxsSwGJKUzUMb0AbY+zHD8S5XFSW91wBy3Um
pM9+vriNVVdVea+G0ucm/BMPTapwfsWAh5DvvGumN8YZ3UeQckjXZIF9ac8iwe7c
JqbUMWT02952dhl9NpY25Z8xINhJ7e6EvxyNT5wXGPcIRhyU165tXy/cpL9wArUS
HHnXfIGB/zwpHUjnD+IZlB5PBGIKKIF783w5/C+XjQ3JtfigOxv0YfcL6aCchzFp
9bEVmuCP/bYar9O+F/haZ/Nlag7fjVwQ/U5hBhM6ixzV/UuivhZLt6D7Yp02hXRp
9t2tQ9UOkwGdr5mvElpb28DggHdT4FsdJigqyU2RUVUZhJZna8YXDgTJkwOfXQoL
kFZQFBMX4AH72+SRBknUc3wJazOEMeeyCBc2zow7UGM019CeanjAmrg2x4dKwSVW
mP6Ip9BZGA6iYaF/Z6vqJ5dq/DAYR8sD4/QMx/gaSsizXzb0XVeeePSUKoUOv0D9
mVANa4IdST/g6XVeFIXvFpmu8NbpKWPmyATytvG5golVYuMGewmNN045ZW5z7GjJ
oHNT79krMSGBrN+69vHAdBFuXmhwJ6JL35OoIa8w+DCAcAWocCPZnEnwF9B+5ezd
+5TlmA4hrBXE6F1H9kNk5VBlK4UKspaaGw7Jn5ccIM8PLi7+tXY=
=2vtj
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
