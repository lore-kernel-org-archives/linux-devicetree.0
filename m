From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: sun5i: Add dts file for the Empire
 Electronix M712 tablet
Date: Sat, 27 Aug 2016 00:33:36 +0200
Message-ID: <20160826223336.GL3165@lukather>
References: <20160826144226.29969-1-hdegoede@redhat.com>
 <20160826144226.29969-3-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="37cJpJlYZwAfNbm5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160826144226.29969-3-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--37cJpJlYZwAfNbm5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2016 at 04:42:25PM +0200, Hans de Goede wrote:
> Add a dts file for the Empire Electronix M712 tablet, this is a 7" A13
> tablet, with micro-usb (otg), headphone and micro-sd slots on the
> outside. It uses a Goodix gt811 touchscreen controller, a RTL8188CTV
> wifi chip and a DMART06 (1238a4) accelerometer.
>=20
> Note currently the dts for this is somewhat empty. This will change
> once we add support for the touchscreen and accelerometer.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Thanks very much for that reference design rework, it makes things
much easier to review :)

Applied.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--37cJpJlYZwAfNbm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXwMPAAAoJEBx+YmzsjxAgKr0P/iRehbAUTKYL500OMTdM7MVL
GAObXFnzev+ci9Ry7RVTqLEvUizoDtVXzbskPColvj/8nxEPuvmo06VZqKatOFE5
ZmjU1flRg4e/BlQuL6PSn2bnbAJ50sPy/lMuY9v5CDgUaAIJ+Jk6utQUU9jjtZIG
iWHZk+W4MLRSUq70Nz1Raoa77TxwPJoo2+9xCebMD5JM2JYRDv2ly3cvajHXUJRA
HkUw7UFR4ydPwSdH6ALFx32c7p3vba3WAEJcI/KPQyUkp70Iq/KRK+Jc4PVWEf9y
H0Z5GMP1n1hxexzBt2yOTKYZPWVXRickteUXwzjZ7M1dZBVLiQAxyrLTFX1YOcZu
l+0VOu3jNaVFo6WBrE0wp/4Vmf8qGPO6+UovRSsZyZc3lThbJGZnMWRWEfqisIn8
TEx7CBYFnRYamBUQZGMwxYpe9SG5lwKXUqwl+ezocToxewuqtu1NWQLvAhI2vG4d
6CBi3Aq7/R+xUs4D8qnvZ2w6u2oJ15d9HkRJO2+rExK7Y12o8iakUN+xXBOg4jN9
u3tP9Af4Cb/oY6Tvssbow9UtzSCo9PAE6ZX+AlWv39MrGlCIv1GHlFav2aOFQTen
xZ7HrBqzocMVZ+37VUOJfkRN8qrpS8pqHXbraNUjy3/hZRcW8kddyDaQ+yXdGNMO
kDX9nBuu1Z2q9iObGmm4
=rfLT
-----END PGP SIGNATURE-----

--37cJpJlYZwAfNbm5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
