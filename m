From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 12/15] ARM: dts: sun4i: Enable USB DRC on Chuwi V7 CW0825
Date: Tue, 10 Mar 2015 16:07:41 +0100
Message-ID: <20150310150741.GW5085@lukather>
References: <1425933628-9672-1-git-send-email-hdegoede@redhat.com>
 <1425933628-9672-13-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0zDq8CFkxn2hi9iJ"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425933628-9672-13-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--0zDq8CFkxn2hi9iJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Mon, Mar 09, 2015 at 09:40:25PM +0100, Hans de Goede wrote:
> Enable the otg/drc usb controller on the Chuwi V7 CW0825 tablet.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts | 31 +++++++++++++++++++=
++++++
>  1 file changed, 31 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts b/arch/arm/b=
oot/dts/sun4i-a10-chuwi-v7-cw0825.dts
> index 97fca89..034396c 100644
> --- a/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
> +++ b/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
> @@ -111,6 +111,26 @@
>  	status =3D "okay";
>  };
> =20
> +&pio {
> +	usb0_id_detect_pin: usb0_id_detect_pin@0 {
> +		allwinner,pins =3D "PH4";
> +		allwinner,function =3D "gpio_in";
> +		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull =3D <SUN4I_PINCTRL_PULL_UP>;
> +	};
> +
> +	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
> +		allwinner,pins =3D "PH5";
> +		allwinner,function =3D "gpio_in";
> +		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull =3D <SUN4I_PINCTRL_PULL_DOWN>;
> +	};
> +};
> +
> +&reg_usb0_vbus {
> +	status =3D "okay";
> +};
> +
>  &reg_usb2_vbus {
>  	status =3D "okay";
>  };
> @@ -121,7 +141,18 @@
>  	status =3D "okay";
>  };
> =20
> +&usb_otg {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&usb0_id_detect_pin
> +		     &usb0_vbus_detect_pin>;
> +	id_det-gpio =3D <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
> +	vbus_det-gpio =3D <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
> +	dr_mode =3D "otg";

Is there a reason to not put that in the DTSI?

All the users seem to be wiring it as OTG.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--0zDq8CFkxn2hi9iJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU/wi9AAoJEBx+YmzsjxAgSfEQAL5j0hogSix5aufHm5NyRMwR
ilDxGjfO9U7lJdlPZDqROYtreJb2UqsPzMhjlqE5C+rrfaVq2jJxc/nkYidQGBTi
yga8i8q2Mlccd0Mj7PEElOcOXLQHMllXBSSJezdimWmERqUcfK7mx1wkQ0t38o9g
ritkHQMnLRpegk64Eq7MzhdrnO+yYbIzyupwVnUvyNWXd4NNoGCnNuGQUrtPzJ67
RbYjCaS0MyJPRAYj3394PohvI3/mdrcvTPSB0r9cs7ouyQOsTnBdD9Wnb3IJGgPp
czlXz4mWquoHvCWtcpG7bDRyaBjalFK3k/7fRZ4cDrSSJhdUTICfPkerjmBcjok0
BRlHW9A+6HQ5kFQwLxUoh2TYzuJGymagHlHKrjj9EntoZ67CzLfQlHhGwieZiM3T
0AJMgrUX9xF38q89zNcWzNrDa74AAKTMAmGb6E1vM+GeEkDtVdGalz1FcD+8Usb8
66i4KMaZSWGhvf6CIVer3M74ityVd8cslGwYtXOjYc2ET2khYBfGlaHNylaiKLeF
UFG7KKeW7yzgaydPzKBO0yEqTrtYomzDXR5bUvT4Wi3vmA3FVORR3fhZpubvhsST
nTGK6IUV5WHnHmwq52iRH5QPDBInBsr4Y0wRsRu6nQPD3Kchs7uOLklQzgd0TQaY
D3KShhdmLz1NWEy0BQn9
=cj8f
-----END PGP SIGNATURE-----

--0zDq8CFkxn2hi9iJ--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
