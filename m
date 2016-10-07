From: Lukasz Majewski <l.majewski@majess.pl>
Subject: Re: [PATCH v2 5/6] arm: dts: imx7-colibri: Use pwm polarity control
Date: Fri, 7 Oct 2016 08:41:20 +0200
Message-ID: <20161007084120.32a92ca8@jawa>
References: <20161001101235.24598-1-bhuvanchandra.dv@toradex.com>
 <20161001101235.24598-6-bhuvanchandra.dv@toradex.com>
 <20161006084007.44c5cbae@jawa>
 <5fd194a3-5bfb-2fab-af82-95c87a0e7af1@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8463018458340299999=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5fd194a3-5bfb-2fab-af82-95c87a0e7af1@toradex.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
Cc: devicetree@vger.kernel.org, stefan@agner.ch, thierry.reding@gmail.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============8463018458340299999==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/uUwdY2XtvbRIN1i_3ABmIU4"; protocol="application/pgp-signature"

--Sig_/uUwdY2XtvbRIN1i_3ABmIU4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Oct 2016 11:38:52 +0530
Bhuvanchandra DV <bhuvanchandra.dv@toradex.com> wrote:

> On 10/06/16 12:10, Lukasz Majewski wrote:
>=20
> > On Sat, 1 Oct 2016 15:42:34 +0530
> > Bhuvanchandra DV <bhuvanchandra.dv@toradex.com> wrote:
> >
> >> Configure PWM polarity control.
> >>
> >> Signed-off-by: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
> >> ---
> >>   arch/arm/boot/dts/imx7-colibri.dtsi | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi
> >> b/arch/arm/boot/dts/imx7-colibri.dtsi index a9cc657..2af5e3e 100644
> >> --- a/arch/arm/boot/dts/imx7-colibri.dtsi
> >> +++ b/arch/arm/boot/dts/imx7-colibri.dtsi
> >> @@ -43,7 +43,7 @@
> >>   / {
> >>   	bl: backlight {
> >>   		compatible =3D "pwm-backlight";
> >> -		pwms =3D <&pwm1 0 5000000>;
> >> +		pwms =3D <&pwm1 0 5000000 0>;
> > My recommendation would be to add:
> > #include <dt-bindings/pwm/pwm.h>
> >
> > and then define pwms as:
> >
> > pwms =3D <&pwm1 0 5000000 PWM_POLARITY_NORMAL>;
>=20
> Addendum:
> There is no "PWM_POLARITY_NORMAL" defined in "#include
> <dt-bindings/pwm/pwm.h>" I guess it is helpful when polarity
> inversion is enabled.

Yes, you are right :-), the normal polarity is assumed to be the
default.

There is only defined flag for inversion.

Sorry for the noise.

Best regards,
=C5=81ukasz Majewski

>=20
> --
> Bhuvan
>=20
> >
> > It would be more readable
> >
> > Best regards,
> > =C5=81ukasz Majewski
> >
> >>   	};
> >>  =20
> >>   	reg_module_3v3: regulator-module-3v3 {
>=20


--Sig_/uUwdY2XtvbRIN1i_3ABmIU4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlf3Q5YACgkQf9/hG2YwgjGZ+wCgrveQiYMc4sQJUTASJKXhXbGU
qx8An2GGjvMhDEb4dYhtpBI4Ee0xqeJ7
=bRwB
-----END PGP SIGNATURE-----

--Sig_/uUwdY2XtvbRIN1i_3ABmIU4--


--===============8463018458340299999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8463018458340299999==--
