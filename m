From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Devicetree node to turn off LCD when backlight is 'disabled'
Date: Tue, 12 Feb 2013 08:04:18 +0100
Message-ID: <20130212070418.GC28850@avionic-0098.mockup.avionic-design.de>
References: <1360563905.4130.6.camel@gitbox>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3171350012637744902=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1360563905.4130.6.camel@gitbox>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Cc: Devicetree Mailing List <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arm Kernel Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============3171350012637744902==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VywGB/WGlW4DM4P8"
Content-Disposition: inline


--VywGB/WGlW4DM4P8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 11, 2013 at 07:25:05PM +1300, Tony Prisk wrote:
> I was just wondering if the following would be an acceptable way to turn
> off an lcd backlight when the pwm-backlight driver is set to level 0.
> The LCD backlight is 'powered' by the gpio.
>=20
> leds {
> 	compatible =3D "gpio-leds";
> 	backlight {
> 		label =3D "lcd-power";
> 		gpios =3D <&gpio 0 0 0>;  /* bank pin active_low */
> 		linux,default-trigger =3D "backlight";
> 		default-state =3D "on";
> 	};
> };
>=20
> The method has been tested by an end-user and confirmed as working - I
> just wanted to check whether it is the 'accepted' way of doing it.

I don't quite see how this is related to pwm-backlight. Maybe you can
post a more complete example? Representing the backlight power as a GPIO
controlled LED seems somewhat kludgy.

That said, there is currently no "accepted" way to use a GPIO to control
the power to the backlight in pwm-backlight. There was some work by Alex
(Cc'ed) to integrate this using generic power-sequences, but there was
some pushback on that. Your best bet currently would seem to integrate
this with the CDF (Common Display Framework). Unfortunately that'd mean
you'd need to write a whole new driver to abstract the panel. Even in
CDF there are ongoing discussions about how to hook it up with the
backlight framework. I know this doesn't give you a solution right away
but I think it's the best way to represent the actual hardware and it
takes into account a number of other aspect about displays as well.

Thierry

--VywGB/WGlW4DM4P8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRGelyAAoJEN0jrNd/PrOhUt0QAKKqA9+xDSSgUsPF1D3NAutW
RrvxRGSgcy8XtePUw5qsicNGLm6dGzciZ/Sgl0j2VRD/Vb0vlK3b/YKBCiE/aK3D
gj0Rwk4bEc0aBH34Vctk9raiMJgEv003niYrVJHeLoJSj9YnFZ7DswoqzAUO+7jy
mNXQ009EYElSSNVQNnHedeYluCRq9PObvcWuc7blLoKG02X+jG7idcR0nFnIO4IW
nt2KkvD1IOQ7rvTe6wKn4IqPylurBJbAYZVjXa5LdVOmmFL3p0++xkRUGyIDPsjA
yeY44JYUW8G8dRRdaXVZrOKIIECy4ANl79o4V7tgAsXZjRtuyd5IU7qtGHFCLA/l
bOe9LrKTUcaU9sxIGQJK5EsLlJYz0i998dAmF18jlRBrUBg46qzsD0vKzzJpu6aF
19+SvfD6RNyMhUyg9sv+yWane+niLTlbCa9kOOIfepjVG/LVaN6r8dpGfgFKtRia
AfBaetguzZJPJjjGGMW75l4rKpzdjlXzzee7CxsdX5bEtg9ufE0cVWOnvW2D+X1d
w2jCY1Ukf+1vun8O+hglvkAXR9435pGR6AiNouWmh51W7JjN+BbmJbOrpLwDmbh1
qmLsghd2ZtKm2lu8JeVzYi9XOtj5tyVQPIw3DD+o08tzuiuDrDtGUw/KwfC33Akg
opRwB1TiWTbhZ11tl6wU
=3NpJ
-----END PGP SIGNATURE-----

--VywGB/WGlW4DM4P8--

--===============3171350012637744902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3171350012637744902==--
