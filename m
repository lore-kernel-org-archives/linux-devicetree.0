From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun8i: Add dts file for the Orange Pi Lite
 SBC
Date: Mon, 22 Aug 2016 20:18:10 +0200
Message-ID: <20160822181810.GV7104@lukather>
References: <1470579404-28081-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gPQW1Pk7T/0rhUBV"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470579404-28081-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--gPQW1Pk7T/0rhUBV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 07, 2016 at 04:16:44PM +0200, Hans de Goede wrote:
> The Orange Pi Lite SBC is a small H3 based SBC, with 512MB RAM,
> micro-sd slot, HDMI out, 2 USB-A connectors, 1 micro-USB connector,
> sdio attached rtl8189ftv wifi and an ir receiver.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
> -Fix the wifi ethernet alias to be ethernet0 as the comment says, rather
>  then ethernet1 (copy and paste error).

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--gPQW1Pk7T/0rhUBV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXu0HiAAoJEBx+YmzsjxAgbQUP/1jBZ8f+Rs9yQKSDzu8IhPzq
3gbagnJ1KONBO9yXi0HZPUe1oS2tTJ3zaAkjfxRbxX2Vs/kKwr+euhqweTKU1ht6
dZdY/qGySZ4K4bQkE5iykmkJgM6DBnmqanLBkmDMMRSyLBB+uBUmpadgltaoj7P3
VYVNhJM39Vnh3HsDj0nVEkn6u5YCb2HfcIlf+i/apJ8MFmTXLAyzmz9KbG5BnXfv
aYEoVDZYASZzyngmOXOubVVR9f0BrPZH3fTOHzQqiLOWysXMHj0D8CZIpoi2Z3a5
rR93865ISWAWVxN/O3NF4x1j1KRj48FnNQn0PwipoYNv5JefkHCx/EVZLjEZrao4
lL107fHgRx1j2KEJk5C9rjChNUjybebLi0KY36ovToUSelfMZqoSo7lnj5YrVBxu
RjjrgYVp0ybUV1HM7tt4CXoY8tg6Txw4pwOBLvnQgmYATEQN1R3qEjklrmyGe70E
/jwN+OUQXzzF3Aq0462PTsEFUNHb/Qi2T33vHSZNxwfOdy9g6AiPInEuUntB8Eu7
u2tuHD94RrwkUBWwVvAHty6KhFima08wf9jsGBdK9IUF4B+UFkfx7qJhFDSsrFl6
O2n3y1h4LBRFbnpyW7v2odeJho0WjM+XvX1hRmqwz5C1jIQhQiMb6y5XF2qCpn2g
xHkVlKcal6uKo8nohyWr
=+ee5
-----END PGP SIGNATURE-----

--gPQW1Pk7T/0rhUBV--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
