From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] arm64: dts: meson: Fix IRQ trigger type for macirq
Date: Tue, 04 Dec 2018 20:52:45 +0100
Message-ID: <5C06DB0D.3010306@baylibre.com>
References: <20181204160447.27869-1-ccaione@baylibre.com>
 <20181204160447.27869-2-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204160447.27869-2-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <ccaione@baylibre.com>, robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, martin.blumenstingl@googlemail.com
List-Id: devicetree@vger.kernel.org

Hi Carlo,

Le 04/12/2018 17:04, Carlo Caione a =E9crit :
> A long running stress test on a custom board shipping an AXG SoCs and a
> Realtek RTL8211F PHY revealed that after a few hours the connection
> speed would drop drastically, from ~1000Mbps to ~3Mbps. At the same time
> the 'macirq' (eth0) IRQ would stop being triggered at all and as
> consequence the GMAC IRQs never ACKed.
> =

> After a painful investigation the problem seemed to be due to a wrong
> defined IRQ type for the GMAC IRQ that should be LEVEL_HIGH instead of
> EDGE_RISING.

This is a good news !

Kevin,
What's the best procedure here to make it apply on the 4.19, 4.14 and 4.9 s=
table
trees ? for 4.14 and 4.9 it will need to be reworked to apply correctly.

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

> =

> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  arch/arm/boot/dts/meson.dtsi               | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
> index 0d9faf1a51ea..a86b89086334 100644
> --- a/arch/arm/boot/dts/meson.dtsi
> +++ b/arch/arm/boot/dts/meson.dtsi
> @@ -263,7 +263,7 @@
>  			compatible =3D "amlogic,meson6-dwmac", "snps,dwmac";
>  			reg =3D <0xc9410000 0x10000
>  			       0xc1108108 0x4>;
> -			interrupts =3D <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
> +			interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names =3D "macirq";
>  			status =3D "disabled";
>  		};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot=
/dts/amlogic/meson-axg.dtsi
> index df017dbd2e57..b1a42e99cb67 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -143,7 +143,7 @@
>  			compatible =3D "amlogic,meson-axg-dwmac", "snps,dwmac";
>  			reg =3D <0x0 0xff3f0000 0x0 0x10000
>  			       0x0 0xff634540 0x0 0x8>;
> -			interrupts =3D <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
> +			interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names =3D "macirq";
>  			clocks =3D <&clkc CLKID_ETH>,
>  				 <&clkc CLKID_FCLK_DIV2>,
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/=
dts/amlogic/meson-gx.dtsi
> index f1e5cdbade5e..58e6bcaac1d8 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -462,7 +462,7 @@
>  			compatible =3D "amlogic,meson-gx-dwmac", "amlogic,meson-gxbb-dwmac", =
"snps,dwmac";
>  			reg =3D <0x0 0xc9410000 0x0 0x10000
>  			       0x0 0xc8834540 0x0 0x4>;
> -			interrupts =3D <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
> +			interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names =3D "macirq";
>  			status =3D "disabled";
>  		};
> =
