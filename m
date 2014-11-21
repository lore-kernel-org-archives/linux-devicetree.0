From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v1] usb: phy: nop: device tree documentation for vbus
Date: Fri, 21 Nov 2014 12:03:00 -0600
Message-ID: <20141121180300.GW7508@saruman>
References: <1415538138-24434-1-git-send-email-robert.jarzmik@free.fr>
 <20141121154506.GG7508@saruman>
 <87r3ww5v7d.fsf@free.fr>
 <20141121172259.GU7508@saruman>
 <87ioi85tqc.fsf@free.fr>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Cf1qy2gtPj5yoBMh"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87ioi85tqc.fsf-GANU6spQydw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Cf1qy2gtPj5yoBMh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2014 at 06:49:47PM +0100, Robert Jarzmik wrote:
> Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> writes:
>=20
> > On Fri, Nov 21, 2014 at 06:17:58PM +0100, Robert Jarzmik wrote:
> >> Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> writes:
> >>=20
> >> > On Sun, Nov 09, 2014 at 02:02:18PM +0100, Robert Jarzmik wrote:
> >> >>  	hsusb1_phy {
> >> >> @@ -26,8 +31,11 @@ Example:
> >> >>  		clock-names =3D "main_clk";
> >> >>  		vcc-supply =3D <&hsusb1_vcc_regulator>;
> >> >>  		reset-gpios =3D <&gpio1 7 GPIO_ACTIVE_LOW>;
> >> >> +		vbus-gpios =3D <&gpio2 13 GPIO_ACTIVE_HIGH>;
> >> >> +		vbus-regulator =3D <&vbus_regulator>;
> >> >
> >> > not sure why you need vbus-gpios here. You can pass the gpio to the
> >> > regulator as enable-gpio, right ?
> >>=20
> >> Euh no. From my understanding a regulator enable-gpio is an _output_ g=
pio
> >> enabling the regulator. This vbus-gpio is an _input_ gpio detecting th=
e vbus
> >> assertion. Maybe a name like "vbus-detect-gpio" would be more accurant=
e ?
> >
> > aha, that clears it up, yeah. So the GPIO is detecting if we have VBUS
> > from the host side while the regulator supplies VBUS ?
> Yup, exactly. I'll amend the name for v2.

Thank you

--=20
balbi

--Cf1qy2gtPj5yoBMh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUb35UAAoJEIaOsuA1yqREKKwP/3pk5QiAYWGipDpErE70QiYj
zdvbcML0Vc2fI2rgtIOYHIuiuAPJeQ/iSNPmZX95Qru8IQXXi7KDAWXb/2vSE3m9
rrQcQyqCmhM1rPKW/dO7HGepQUGy5Dj40BPQIewe/trg7A63OHF1u/f+nyEnB2tY
1m/zKCFdO/+snTrZPPCazgS7LlGQfP4V6cwWDarxj5+/q8cFEOgmaOaSbgHiV1Lz
tdVRifugvJetdP87r1nSLfcSkxM1GfNKJta0JEXY03TSkw3iMrO1frlKc02UCS/l
pv+I7MaX8/cQnFYh8iL+buaavHuStMc5VN3fU1T69fpHV0H1LjqTenyVCBSLSlPP
/+64ErnSfMKV+44utc0VP4WyObAq0siVG4qAWhpz1rzyhJx4shNDQ2ejOt5PNZj/
wrUnuxGrm575WH5M/HnTKYvEjJE6p6asVoaey9DELq/z1EwR6IV7L0yEoMg/VKbD
sNUtYbE2I8lQFp+dJwu9XIHGQFAnfwVTARmEuz0UX2MWzATBFRV23Y+VbjgbPux8
JyN1bxW6+zxxDJQdGO8331oo/5YCjljUdJvbBzLu3aHa0hAFSt1vE5pexjEe2Gkj
ffZEVTf3QFfa/27qeMD+wUYYRrEFMmzhpUuc5K8hVhP8sUw5P9Z3aXjjusxRRjOK
qv/DHc3e+YAGNy+IFYhC
=YD70
-----END PGP SIGNATURE-----

--Cf1qy2gtPj5yoBMh--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
