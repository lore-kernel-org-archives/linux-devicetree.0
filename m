From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 4/4] musb: sunxi: Simplify dr_mode handling
Date: Wed, 15 Jun 2016 21:30:23 +0200
Message-ID: <20160615193023.GB5144@lukather>
References: <1465138776-6003-1-git-send-email-hdegoede@redhat.com>
 <1465138776-6003-4-git-send-email-hdegoede@redhat.com>
 <20160608102325.GI14179@lukather>
 <08af737c-f1f1-0966-0eca-24d4daa7423b@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <08af737c-f1f1-0966-0eca-24d4daa7423b-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 08, 2016 at 12:30:20PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 08-06-16 12:23, Maxime Ripard wrote:
> >Hi,
> >
> >On Sun, Jun 05, 2016 at 04:59:36PM +0200, Hans de Goede wrote:
> >>phy-sun4i-usb now has proper dr_mode handling, it always registers an
> >>extcon, and sends a notify with the mode (even when in peripheral- /
> >>host-only mode) at least once.
> >>
> >>So we can simply the sunxi musb glue by always registering its extcon
> >>notifier and relying on sunxi_musb_work() to enable vbus when in
> >>host-only mode.
> >>
> >>This also enables host- and peripheral-only mode with vbus monitoring.
> >>
> >>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >
> >It's been a bit painful to track all the patches needed so that it
> >applies properly, but I've finally been able to test it on a Sinlinx
> >SinA33 with peripheral-only mUSB, and it works like a charm.
> >
> >You can add my Tested-by.
>=20
> Great, thanks for testing.
>=20
> This is the board which has an otg connector with vbus not connected,
> right? Yet it does have a functional id-pin, right ?

It's that one, yes.

> In that case you should be able to put it in dual-role mode (only
> specify the id-pin in the phy dts node, no vbus / vbus-monitoring)
> and then it _should_ work in host mode if you use a powered hub.
>=20
> I'm fine with putting in peripheral-only mode, but as said
> dual-role might work with a powered hub.

Good point, I'll test that.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXYazPAAoJEBx+YmzsjxAg8YEP/2I/LQf7lS0Sg+uZa8VsPYuY
+1qRTCl9K/FZz/GmBGdizVh1prh2EYvxDBZlVes+BqL3Hax1TSHYxnjy6Hv5MePe
AaOVXjT+pqSK0qZ4Jn8rXbso/R+zyzmTjOwyhqCXXCjv7R/WF3mk38dXJ1UpzYPF
W1E2iZgu7qGWF/KQWGeoDDDmupj0wBaJQiEShlYoF2F/mG83OG3DF2xzCEmx/CAd
EotvZmkxzH0IaguMbDIm1NMPtX/Ef8wS/JeKqm9hzxb6aEKTZlwS8ck0iGP1P1LY
Fc8xudtsWuFdIAe+P2CGdaPHXPOjvNLy5LELvcDvzu9jS3dpcbhQJ8rG8VjyBGNA
HgD4Emep0EK/7dqtN3SQ1AQP8OI9rbtNQ+G2QAVQUkMymS5raJgfcMyyIySyLX3k
hUxwyIsT2jXJ2G56TllK5bbrrQr1xSzyqAxjvd3/bU/uHFfeJRM5dhJ4yFypLxrz
OEFuaAYd606KKNweZuy8GEanP69pF8MlAfxwRFpV0TCcbKuDZadlm0a2JsNR01Wu
H5Bgfv19NNtRDL2U7bC7EJkJ0YjiIpVt90kDCK1ngvuhfVQRSgn0PLmG/Wgs7EaK
nj9cS+VogPTPA8lvz9wldfqVZOzS+N1qojkvqDyXad8Om2uI9iDPDVnTJOursNNf
lHl266fvIlEOVOjJaad8
=jpVJ
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
