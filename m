From: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH] ARM: dts: vf610-bk4: fix incorrect #address-cells for
 dspi3
Date: Sat, 12 Jan 2019 22:10:40 +0100
Message-ID: <20190112221040.5a5e85ee@jawa>
References: <20190112011514.8527-1-shawnguo@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1919492495679358674=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190112011514.8527-1-shawnguo@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============1919492495679358674==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7DEwXGI51mwPs19E5D8Tv7Z"; protocol="application/pgp-signature"

--Sig_/7DEwXGI51mwPs19E5D8Tv7Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

> The dspi3 is used as slave controller on vf610-bk4, and the default
> '#address-cells =3D <1>;' setting in vfxxx.dtsi causes the following DTC
> warning.
>=20
>   DTC     arch/arm/boot/dts/vf610-bk4.dtb
> ../arch/arm/boot/dts/vfxxx.dtsi:550.24-563.6: Warning
> (spi_bus_bridge): /soc/aips-bus@40080000/spi@400ad000: incorrect
> #address-cells for SPI bus also defined
> at ../arch/arm/boot/dts/vf610-bk4.dts:107.8-119.3
> arch/arm/boot/dts/vf610-bk4.dtb: Warning (spi_bus_reg): Failed
> prerequisite 'spi_bus_bridge'
>=20
> For spi device used as slave controller, '#address-cells' should be 0.
> Let's overwrite the property in vf610-bk4.dts to fix the warning.
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>
> ---
>  arch/arm/boot/dts/vf610-bk4.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/vf610-bk4.dts
> b/arch/arm/boot/dts/vf610-bk4.dts index 689c8930dce3..b08d561d6748
> 100644 --- a/arch/arm/boot/dts/vf610-bk4.dts
> +++ b/arch/arm/boot/dts/vf610-bk4.dts
> @@ -110,11 +110,11 @@
>  	bus-num =3D <3>;
>  	status =3D "okay";
>  	spi-slave;
> +	#address-cells =3D <0>;
> =20
> -	slave@0 {
> +	slave {
>  		compatible =3D "lwn,bk4";
>  		spi-max-frequency =3D <30000000>;
> -		reg =3D <0>;
>  	};
>  };
> =20

Thanks for fixing this problem,

Reviewed-by: Lukasz Majewski <lukma@denx.de>


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/7DEwXGI51mwPs19E5D8Tv7Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlw6V9AACgkQAR8vZIA0
zr2t/Qf/YsmybKRa3QAFSpTV21UmPyhfPZM1SOpPNQb1ku+XdHj+rF9xtkqNIqlu
AHU9XBs4qa9fv4F3eJzFMJoxl8UkRqr5Y6pnO0EcPwcBRx+Gd1vppr/j6Kxw05bv
ZN0CyxC/n+u76GsxuAhystEanlBPGJ3Fq5Q4rx/p/1pvKa0pGGdP3UOgiF0eGb3p
WH7N1kfEUu74OyW6ostOwHhmPm3frJmutYpJKEW/pyCOVJpo3dC5pAM2uKj57CqK
RvmDks7kUsQjMaP/15/gKDtK8olCYoVhWYl8uiqsDNpK5M2rcrdBNL7/XhyKX8Ns
cHBpZXcQd6L/BQk1iXFZvNFzNpVWlQ==
=iqxb
-----END PGP SIGNATURE-----

--Sig_/7DEwXGI51mwPs19E5D8Tv7Z--


--===============1919492495679358674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1919492495679358674==--
