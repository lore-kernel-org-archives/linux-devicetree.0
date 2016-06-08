From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 4/4] musb: sunxi: Simplify dr_mode handling
Date: Wed, 8 Jun 2016 12:23:25 +0200
Message-ID: <20160608102325.GI14179@lukather>
References: <1465138776-6003-1-git-send-email-hdegoede@redhat.com>
 <1465138776-6003-4-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzX0AQGjRQPusK/O"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465138776-6003-4-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--NzX0AQGjRQPusK/O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jun 05, 2016 at 04:59:36PM +0200, Hans de Goede wrote:
> phy-sun4i-usb now has proper dr_mode handling, it always registers an
> extcon, and sends a notify with the mode (even when in peripheral- /
> host-only mode) at least once.
>=20
> So we can simply the sunxi musb glue by always registering its extcon
> notifier and relying on sunxi_musb_work() to enable vbus when in
> host-only mode.
>=20
> This also enables host- and peripheral-only mode with vbus monitoring.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

It's been a bit painful to track all the patches needed so that it
applies properly, but I've finally been able to test it on a Sinlinx
SinA33 with peripheral-only mUSB, and it works like a charm.

You can add my Tested-by.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--NzX0AQGjRQPusK/O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXV/IdAAoJEBx+YmzsjxAg9zEP/jAf8F90573009BWlQOaNlld
Atdr/E5TH7ars9fFM7RuQ7Nd5c07FjjTc5idiWNrlDR3Jfw+CAf/KrKvkpi16dFe
0G++l8RWo5FxKfLl4GLCfpk683QBKn1SrX0Jcj7lkBmbJdOJQgPiz0sNXrGBdzjU
ReQtA1eClVXFPRhfQSmtTx6I0xZlf7Z/md77Rq3Zzzik8Yt3IEfFJY2BcvD/p54V
pwS6TnkouXRpciU8jcMuvlgDKVjhwXadOeMbcIsjD3yqp2+3g9BKJ2AWn6calrC3
bk/Oj35GvrC6uOhAC2DRv0VXhpi6ic4L1Yo8bUoGWWVEkzNtCe0+3a78gxC3NHjK
4nLDuAWyehcQUvCkN1PYsk+VnwsAM31teume4HjtgCoIRkn1Tpf+cIVYXwjCCfhL
fb/hJBav/hrzSqgo/5I6dXRC5wJcJ71JHRcSaLCZi4FD7R0eJbHuAMG87TF4g2wN
Wbj93gyPzcRiQkLfXv6Cb0GG9K5ubieCF8C0ivpg8ns/NHW/M3GkvGjZiaO0W7N4
acps91ocNfiRaVo9NW8i5FEVNmct07Yq/34S45Tzti2AycuGVk4uoOUc7iM29gSM
YsqbKPetw8whX5mqR58GZgV/pEmLLzYgVZn8XSpH7G08ZwXyWolG1GXIbxhhUhVg
j0HXibXTbuavYNccRmES
=d6ry
-----END PGP SIGNATURE-----

--NzX0AQGjRQPusK/O--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
