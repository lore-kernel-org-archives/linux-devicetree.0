From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v1] usb: phy: nop: device tree documentation for vbus
Date: Fri, 21 Nov 2014 11:22:59 -0600
Message-ID: <20141121172259.GU7508@saruman>
References: <1415538138-24434-1-git-send-email-robert.jarzmik@free.fr>
 <20141121154506.GG7508@saruman>
 <87r3ww5v7d.fsf@free.fr>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FfX2iGK5t5ehHnsE"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87r3ww5v7d.fsf-GANU6spQydw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--FfX2iGK5t5ehHnsE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2014 at 06:17:58PM +0100, Robert Jarzmik wrote:
> Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> writes:
>=20
> > On Sun, Nov 09, 2014 at 02:02:18PM +0100, Robert Jarzmik wrote:
> >>  	hsusb1_phy {
> >> @@ -26,8 +31,11 @@ Example:
> >>  		clock-names =3D "main_clk";
> >>  		vcc-supply =3D <&hsusb1_vcc_regulator>;
> >>  		reset-gpios =3D <&gpio1 7 GPIO_ACTIVE_LOW>;
> >> +		vbus-gpios =3D <&gpio2 13 GPIO_ACTIVE_HIGH>;
> >> +		vbus-regulator =3D <&vbus_regulator>;
> >
> > not sure why you need vbus-gpios here. You can pass the gpio to the
> > regulator as enable-gpio, right ?
>=20
> Euh no. From my understanding a regulator enable-gpio is an _output_ gpio
> enabling the regulator. This vbus-gpio is an _input_ gpio detecting the v=
bus
> assertion. Maybe a name like "vbus-detect-gpio" would be more accurante ?

aha, that clears it up, yeah. So the GPIO is detecting if we have VBUS
=66rom the host side while the regulator supplies VBUS ?

--=20
balbi

--FfX2iGK5t5ehHnsE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUb3TzAAoJEIaOsuA1yqREv/oQALaqnIeL7zfqTZyoDm3cQ9/y
UmdRLn8Pa0wZ7nXt1DArGR7z5oG3zFtLTh8+VNuQYtIHN4DRDwgYktpyPTTnV1pX
z3u0AqI6uUCQ3zchR5LXmXTmyDvcNDTeH6X4InUg19NevLkheuCjjPli0tg7lH3v
pfmgLJSmQUXnIAdbDvHsFmQu/O/Pyws8hyh/807vx5KQWYArE6jQK3fHuggX2qBr
GYFM9/L7BkU5mkhzxSQBPFNzI8E2GVWXn44t4pB1wv92i2E6dfofv8uK31GOlKJ3
pgY/ioXA11F6LqEFw3+KOow51bzlvmVChP5jopYWz22Jn6zXUnPGUOSF8mdg5axs
VBXdEhMpQ+6m7dX1PL9+g/H88XwZvgE5aqHeChEaJPFm/tpRAzgSI0j465EBlb9R
FIbj5oofGyjCDsIOEHgn7higIJpmdCmi8t9UjKTvkT+59BBDjNv1i6modCnyaH3l
Tv6IkzKZz5uRgDzh5B7GvzBk3lDU40eD0jDVTZcY83SYrCfBkby+iW5N/+QKoZi6
R/HZgQht54EYYaLXaUE1ANXsbrABm0/csVQWIkM4XQC7ePDuoQ0GdquFkxPcpUCB
EmsL/tPEXQIYwDoJOn7uoavLcsjd23lsMbnXl3zWeVet52fNXqVJ7mOvynBPct72
BfOrMQSbensecEdmu6N5
=6VR0
-----END PGP SIGNATURE-----

--FfX2iGK5t5ehHnsE--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
