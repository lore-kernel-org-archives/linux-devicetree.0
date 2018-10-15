From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 6/6] arm64: dts: xilinx: ultra96: Standardize LED labels
 and triggers
Date: Mon, 15 Oct 2018 21:56:01 +0200
Message-ID: <20181015185147.GA29649@amd>
References: <20181009140522.6492-1-manivannan.sadhasivam@linaro.org>
 <20181009140522.6492-7-manivannan.sadhasivam@linaro.org>
 <7b94c09d-ecbd-e48e-6583-127566715a76@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="L6iaP+gRLNZHKoI4"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7b94c09d-ecbd-e48e-6583-127566715a76@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, robh+dt@kernel.org, heiko@sntech.de, ezequiel@collabora.com, xuwei5@hisilicon.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, linus.walleij@linaro.org, koen.kooi@linaro.org
List-Id: devicetree@vger.kernel.org


--L6iaP+gRLNZHKoI4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2018-10-10 09:25:24, Michal Simek wrote:
> On 9.10.2018 16:05, Manivannan Sadhasivam wrote:
> > For all 96Boards, the following standard is used for onboard LEDs.
> >=20
> > device-name:green:user1  default-trigger: heartbeat
> > device-name:green:user2  default-trigger: mmc0/disk-activity
> >                                           (onboard-storage)
> > device-name:green:user3  default-trigger: mmc1 (SD-card)
> > device-name:green:user4  default-trigger: none, panic-indicator

Actually, having one LED as heartbeat and second as panic indicator
only... Could those be merged and remaining LED used to something
useful?

> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---

> > index eb5e8bddb610..565ceb390f99 100644
> > --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> > +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> > @@ -57,29 +57,30 @@
> >  	leds {
> >  		compatible =3D "gpio-leds";
> >  		ds2 {
> > -			label =3D "ds2";
> > +			label =3D "zynqmp-zcu100-revC:green:user1";
>=20
> The purpose of this series should be standardize Led labels that's why I
> would expect that leds will be called in the same way on all these
> boards that's why I am not getting why there is board name.
>=20
> green:user1 or just user1 should be enough.

green:user1 is better. Also... I guess this should go to the LEDs
list... and if you want to make names standard, maybe there's better
naming than user1..user4?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--L6iaP+gRLNZHKoI4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvE8NEACgkQMOfwapXb+vJHYACgg4mhvWXArstGIqpZD5bClCm2
Wq8AoKo0xwMF3vYNemfu1pJwqXBbKS8n
=qjFQ
-----END PGP SIGNATURE-----

--L6iaP+gRLNZHKoI4--
