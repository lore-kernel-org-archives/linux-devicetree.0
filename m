From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v13 2/4] arm64: dts: fsl: librem5: Add a device tree for
  the Librem5 devkit
Date: Fri, 24 May 2019 00:06:10 +0200
Message-ID: <20190523220610.GB15523@amd>
References: <20190520142330.3556-1-angus@akkea.ca>
 <20190520142330.3556-3-angus@akkea.ca>
 <20190523191922.GA3803@xo-6d-61-c0.localdomain>
 <9626cd324eaaab2b49c37cf3c824aa5e@www.akkea.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9626cd324eaaab2b49c37cf3c824aa5e@www.akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Angus Ainslie <angus@akkea.ca>
Cc: angus.ainslie@puri.sm, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kernel-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>This is for the development kit board for the Librem 5. The current
> >>level
> >>of support yields a working console and is able to boot userspace from
> >>the network or eMMC.
> >>
> >>Additional subsystems that are active :
> >
> >>- haptic motor
> >
> >Haptic motor is not a LED. It should be controlled by input subsystem.
> >
> >>+	pwmleds {
> >>+		compatible =3D "pwm-leds";
> >>+
> >>+		haptic {
> >>+			label =3D "librem5::haptic";
> >>+			pwms =3D <&pwm2 0 200000>;
> >>+			active-low;
> >>+			max-brightness =3D <255>;
> >>+			power-supply =3D <&reg_3v3_p>;
> >>+		};
> >>+	};
> >
> >You can take a look at N900, that has reasonable interface.
>=20
> I wanted to control the haptic with the pwm-vibra driver but "fsl,imx27-p=
wm"
> doesn't seem to respect the PWM_POLARITY_INVERTED flag so when I start the
> system the vibrator is full on.

Ok, lets fix that :-).

> I could use gpio-vibrator but that seemed like a waste when the device is
> connected to pwm.
>=20
> I figured the using the pwm-leds interface was a reasonable compromise un=
til
> I had an opportunity to make changes the the imx27-pwm driver.

I guess in such case it would be best to leave out this section for
now... or keep it disabled / something. We don't want incorrect device
trees to stick around.

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlznGVIACgkQMOfwapXb+vKN/gCfWaysTUeuBj2xcwWEq2OylDMS
zFsAnRLEFwUNhwGErAbVlCaxo8N8aM47
=iExp
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--
