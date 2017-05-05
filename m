From: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [RFC v2 3/3] dt: bindings: Add a binding for referencing EEPROM
 from camera sensors
Date: Fri, 5 May 2017 11:10:17 +0200
Message-ID: <20170505091017.3z7tu32a7ubrfsxk@earth>
References: <1493974110-26510-1-git-send-email-sakari.ailus@linux.intel.com>
 <1493974110-26510-4-git-send-email-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="evfdzugpiahk5lk6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1493974110-26510-4-git-send-email-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
List-Id: devicetree@vger.kernel.org


--evfdzugpiahk5lk6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 05, 2017 at 11:48:30AM +0300, Sakari Ailus wrote:
> Many camera sensor devices contain EEPROM chips that describe the
> properties of a given unit --- the data is specific to a given unit can
> thus is not stored e.g. in user space or the driver.
>=20
> Some sensors embed the EEPROM chip and it can be accessed through the
> sensor's I2C interface. This property is to be used for devices where the
> EEPROM chip is accessed through a different I2C address than the sensor.
>=20
> The intent is to later provide this information to the user space.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>

Reviewed-by: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt=
 b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index 0a33240..38e3916 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -79,6 +79,9 @@ Optional properties
> =20
>  - lens-focus: A phandle to the node of the focus lens controller.
> =20
> +- eeprom: A phandle to the node of the EEPROM describing the camera sens=
or
> +  (i.e. device specific calibration data), in case it differs from the
> +  sensor node.
> =20
>  Optional endpoint properties
>  ----------------------------

-- Sebastian

--evfdzugpiahk5lk6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlkMQXkACgkQ2O7X88g7
+pr0zA/+NQ7TvQX1dzqsuvXJEnD6xSoUZykgYjEVpvX0GxdFt23iW1jwfEspDx+1
JqiFNDLc1gOIppDpPtR6214nDOLW3F/6y02Hv1y8UniJ5J/1j5y6yjdKuApyoDR1
G7JvzuYhNy2uwj4BMrB+N+fTHcmFvU7TiHkPqxYgh8GESn/UJPNcMpAe+If3fqD8
ANUdZWOhrdzr0YJ0k+s4BgQbNvHz4aBwFRAKc7zJKWTP3oO8MVoDRpnci323SV+n
YL4x6sgxJAbSypsclATuH320xVFvnCwYEDGzR08u0dr7H80KxRXdAT1nLXuViB0V
jH1phLGr+A7kvoeKW6Xl+Cj9UTeg4Q4pr0jIbQMqy+NnQu9/5X9HfHR/XtqjkH4G
5j2DlQlZLElxRZMd65I3ysX6CldxsQLkPpE2QKCZYK3g6zB945EWjsgtgVqsmGzA
0O9HJ8Vd1ZF1/0WrWgPSFgfR/0J3fI1irguT2Am1TMKPnRw3RbOUR40gHQYyTxG7
cI9ojrMDAmBzScxY64SNBXNS7yORkejgTTHoQ46MfWW9DsFASC4g9afEBuiZppH3
joSnm99dxWuI8Cs/K6e4vkSjyZmojJMrHSQMGieiCotvV1kxgfG2f60LgWu3qGYm
3sucOqW+tuYpe8DrLQD0SuJYblzcewq1+cgzoDqrW8PQHBa6wBU=
=u3aX
-----END PGP SIGNATURE-----

--evfdzugpiahk5lk6--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
