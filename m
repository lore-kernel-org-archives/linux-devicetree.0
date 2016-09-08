From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 2/8] dts: sun8i-h3: clarify uart1 pinmux definition name
Date: Thu, 8 Sep 2016 08:18:51 +0200
Message-ID: <20160908061851.GB8913@lukather>
References: <1473235141-12768-1-git-send-email-jorik@kippendief.biz>
 <1473235141-12768-3-git-send-email-jorik@kippendief.biz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5072638541977728648=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1473235141-12768-3-git-send-email-jorik@kippendief.biz>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============5072638541977728648==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Content-Disposition: inline


--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 07, 2016 at 09:58:55AM +0200, jorik@kippendief.biz wrote:
> From: Jorik Jonker <jorik@kippendief.biz>
>=20
> Signed-off-by: Jorik Jonker <jorik@kippendief.biz>

Commit log?

> ---
>  arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts | 2 +-
>  arch/arm/boot/dts/sun8i-h3.dtsi                 | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts b/arch/arm/b=
oot/dts/sun8i-h3-bananapi-m2-plus.dts
> index 3779280..45f623b 100644
> --- a/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
> @@ -185,7 +185,7 @@
> =20
>  &uart1 {
>  	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&uart1_pins_a>;
> +	pinctrl-0 =3D <&uart1_rts_cts_pins>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3=
=2Edtsi
> index ee10004..933d42c 100644
> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> @@ -367,7 +367,7 @@
>  				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
>  			};
> =20
> -			uart1_pins_a: uart1@0 {
> +			uart1_rts_cts_pins: uart1_rts_cts {
>  				allwinner,pins =3D "PG6", "PG7", "PG8", "PG9";

I'd prefer to have one pinctrl node for RX/TX, and one for
RTS/CTS. That way, we don't have to duplicate the nodes for the boards
that want to enable only RX/TX

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0QLLAAoJEBx+YmzsjxAgP/sQAI7aFJTFbBjrFyNkMR0gPQ29
07vZXp25syoNRdmBAku+ctzpGMS86IpivVy9oji9veRqdEcAepkM2PghAx3Cp7O0
jw2GxTyiLz8LVcktB4Ff3Wrg1wFwQws1fDDlfqF+lum7W4+oWwYBQEf3BErVWXaC
0/TjW9QN0h8sU3G183C4rc/VH2qnMEJKIO4tA+nLkQ06e+PH93SM2im/B5YQpdDf
J5vY16lOH7Lp0viCrmAjsxsCxud1KYWQ2vum4GGYx+Ut1JuQL8pnuaUJ5maJajAn
48DlNIiqhBOSwNwtl6BkoZYW8ZBnnmdjqq/P4BGOJrX8a/5Bg/MLDSUuJ9UGeU/b
6Uelq0UwiEo/D0hQjDWXrqDUzWBosLFindrK+OF9LlRiAdyY2rQZ32H38jX8I2Ah
0f7oau5xCTzk0BCpFdOxRAGgTfOHuUKayVrKWYYKnDVarfrbqXFVe8BUZ+ALnli+
iLFLyUZhzicQQ5tA1RTQtEBYO8M6flk88uNOqqFGrWyh695yAhd8yvFoPM/O+Kmc
veEGhKXZc6FL/6ayNfBJTonrI3z0+KJRSMytgCV+DZcgfX/a4+VFhoTT1ilEtd6l
+YwMKvJIsNnixEBDp4pyKyLMWlDs4FVJPuWmFmtMBm78XpS3Hhg+O058dArBMWX9
8tEOj3S1+wDqy7Wj7WFc
=C/BN
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--


--===============5072638541977728648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5072638541977728648==--
