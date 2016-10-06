From: Lukasz Majewski <l.majewski@majess.pl>
Subject: Re: [PATCH v2 5/6] arm: dts: imx7-colibri: Use pwm polarity control
Date: Thu, 6 Oct 2016 08:40:07 +0200
Message-ID: <20161006084007.44c5cbae@jawa>
References: <20161001101235.24598-1-bhuvanchandra.dv@toradex.com>
 <20161001101235.24598-6-bhuvanchandra.dv@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0532153823552747268=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161001101235.24598-6-bhuvanchandra.dv@toradex.com>
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

--===============0532153823552747268==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/1M1c4/hkseFO=vm9j.XhEtg"; protocol="application/pgp-signature"

--Sig_/1M1c4/hkseFO=vm9j.XhEtg
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 1 Oct 2016 15:42:34 +0530
Bhuvanchandra DV <bhuvanchandra.dv@toradex.com> wrote:

> Configure PWM polarity control.
>=20
> Signed-off-by: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
> ---
>  arch/arm/boot/dts/imx7-colibri.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi
> b/arch/arm/boot/dts/imx7-colibri.dtsi index a9cc657..2af5e3e 100644
> --- a/arch/arm/boot/dts/imx7-colibri.dtsi
> +++ b/arch/arm/boot/dts/imx7-colibri.dtsi
> @@ -43,7 +43,7 @@
>  / {
>  	bl: backlight {
>  		compatible =3D "pwm-backlight";
> -		pwms =3D <&pwm1 0 5000000>;
> +		pwms =3D <&pwm1 0 5000000 0>;

My recommendation would be to add:
#include <dt-bindings/pwm/pwm.h>

and then define pwms as:

pwms =3D <&pwm1 0 5000000 PWM_POLARITY_NORMAL>;

It would be more readable

Best regards,
=C5=81ukasz Majewski

>  	};
> =20
>  	reg_module_3v3: regulator-module-3v3 {


--Sig_/1M1c4/hkseFO=vm9j.XhEtg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlf18c0ACgkQf9/hG2YwgjHdIwCeILjOaWYtSp/GYVwMSa0kVM0W
WHEAn3O5VMxz47KcETkkNCWWpevf2R4W
=hIWY
-----END PGP SIGNATURE-----

--Sig_/1M1c4/hkseFO=vm9j.XhEtg--


--===============0532153823552747268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0532153823552747268==--
