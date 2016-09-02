From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 4/7] dts: sun8i-h3: add UART1-3 to Orange Pi Plus
Date: Fri, 2 Sep 2016 09:04:25 +0200
Message-ID: <20160902070425.GB6313@lukather>
References: <1472671858-29220-1-git-send-email-jorik@kippendief.biz>
 <1472671858-29220-5-git-send-email-jorik@kippendief.biz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7793460851939266052=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1472671858-29220-5-git-send-email-jorik@kippendief.biz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jorik@kippendief.biz
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============7793460851939266052==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 31, 2016 at 09:30:55PM +0200, jorik@kippendief.biz wrote:
> From: Jorik Jonker <jorik@kippendief.biz>
>=20
> This board has UARTS1-3 exposed on its expansion header
>=20
> Signed-off-by: Jorik Jonker <jorik@kippendief.biz>
> ---
>  arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts b/arch/arm/boot=
/dts/sun8i-h3-orangepi-plus.dts
> index b0cb417..7a17839 100644
> --- a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
> @@ -90,6 +90,21 @@
>  	};
>  };
> =20
> +&uart1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart1_pins_a>;
> +};
> +
> +&uart2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart2_pins_a>;
> +};
> +
> +&uart3 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart3_pins_a>;
> +};
> +

Unfortunately, these pins can be used for other purposes as well, so
we cannot make force that decision down to our users.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXySR5AAoJEBx+YmzsjxAga9wQALWe2ruLMnmkXl8uSJ0mU3fQ
Ks7EgO6xDO/2Ozi83zoDNIUcH4+I1G0CV8fH6spkAXuSQ5nMTjATOCw9Txfq3eVq
pMNaSFP+bBYa4dKjre1tIXcjinIZ67KsSdOfMN+kroO/cDAKuWbqavIWltpi/VfO
f6TjmUT0wkbhTcTboF4ApRrff/eJRacvU/v/sZEo/CqLd2nG6DquG8wJVICVKXX5
A1ccGoK4eYcd1c8mJhbWZLmAvHL4Zd2BTRPH83IC4+D9poTv/2/fWTAePOJgD1b3
777WgO6I4AeSFxm6SqBqPpQaxp3oEYqIAa94mdK+FPbZ89l8OS3XwxZYjYj/tMYL
YU6TK2brW2xZCPH1P+1z1Y9QSr4/Psy6L7M4P9aSZ+YdPnZcAK6UgNApB18fPFT4
pzSo9xekhWFwQmXCA+FmC0ecapr/uo9B0pR25Ns0W6+++3GxNB5+qSjY04Ho7qF4
2/RnQrzl/A2yHoZqWyclB0KzpQoVEUAYHBG+6iKQFctHAdQ5Ve1UGK9WpSxcXy/S
hCIcMlos4xn6LYmZDjoQKlq8XatXm+f0y1xpU+fLzKYyoeYj+waWkcUnqYrlreD0
qJVmt7MdTfVixNkzrNCspO2MmiyHuMcUhvsDiIc6sg+2mTiQOu+gLrCGBsTPT+rA
WcbMMEHwTwzm5kaoirtp
=qwlI
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--


--===============7793460851939266052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7793460851939266052==--
