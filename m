From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH] ARM: dts: imx6: add missing compatible and clock
 properties for kpp
Date: Mon, 9 Jun 2014 10:15:36 +0800
Message-ID: <20140609021535.GX8860@dragon>
References: <1402052579-22803-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1402052579-22803-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 06, 2014 at 01:02:59PM +0200, Lothar Wa=DFmann wrote:
>=20
> Signed-off-by: Lothar Wa=DFmann <LW@KARO-electronics.de>
> ---
>  arch/arm/boot/dts/imx6qdl.dtsi |    2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Shawn

>=20
> diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6q=
dl.dtsi
> index ce05991..3266d01 100644
> --- a/arch/arm/boot/dts/imx6qdl.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl.dtsi
> @@ -466,8 +466,10 @@
>  			};
> =20
>  			kpp: kpp@020b8000 {
> +				compatible =3D "fsl,imx6q-kpp", "fsl,imx21-kpp";
>  				reg =3D <0x020b8000 0x4000>;
>  				interrupts =3D <0 82 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&clks 62>; /* IPG clock */
>  			};
> =20
>  			wdog1: wdog@020bc000 {
> --=20
> 1.7.10.4
>=20
