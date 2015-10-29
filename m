From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH 3/3] ARM64: zynqmp: DT: Add interrupt-controller property
 to GPIO
Date: Thu, 29 Oct 2015 17:37:40 +0100
Message-ID: <56324B54.9000607@monstr.eu>
References: <1445617532-10228-1-git-send-email-soren.brinkmann@xilinx.com>
 <1445617532-10228-3-git-send-email-soren.brinkmann@xilinx.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8419831019698149823=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1445617532-10228-3-git-send-email-soren.brinkmann@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Soren Brinkmann <soren.brinkmann@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Michal Simek <michal.simek@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8419831019698149823==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="ADT3o35XgVgetxBnXPHq6SqcdP3lsiXNm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ADT3o35XgVgetxBnXPHq6SqcdP3lsiXNm
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 10/23/2015 06:25 PM, Soren Brinkmann wrote:
> GPIO can be used as interrupt-controller. Add the missing properties to=

> the GPIO node.
>=20
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> ---
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/d=
ts/xilinx/zynqmp.dtsi
> index 857eda5c7217..200fb588d0f5 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -133,6 +133,8 @@
>  			clocks =3D <&misc_clk>;
>  			interrupt-parent =3D <&gic>;
>  			interrupts =3D <0 16 4>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
>  			reg =3D <0x0 0xff0a0000 0x1000>;
>  		};
> =20
>=20

Applied.

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--ADT3o35XgVgetxBnXPHq6SqcdP3lsiXNm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iEYEARECAAYFAlYyS1cACgkQykllyylKDCFMLQCeIjUq0Dqz+WvlAx7mWB0XnCHn
GR0Ani1mwDjDIyM1TPRuHzD9eo3yrFy5
=BFeq
-----END PGP SIGNATURE-----

--ADT3o35XgVgetxBnXPHq6SqcdP3lsiXNm--


--===============8419831019698149823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8419831019698149823==--
