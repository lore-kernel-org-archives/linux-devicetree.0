From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH 2/2] ARM: DTS: Fix register map for virt-capable GIC
Date: Wed, 18 Jan 2017 13:49:42 +0100
Message-ID: <20170118124942.vms6kihbokmtpeex@kwain>
References: <1484736811-24002-1-git-send-email-marc.zyngier@arm.com>
 <1484736811-24002-3-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9153246443267714184=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484736811-24002-3-git-send-email-marc.zyngier@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>, Tony Lindgren <tony@atomide.com>, arm@kernel.org, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@free-electrons.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>Fabio Estevam <f>
List-Id: devicetree@vger.kernel.org


--===============9153246443267714184==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2iuntmyv7ubsaokf"
Content-Disposition: inline


--2iuntmyv7ubsaokf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Mark,

On Wed, Jan 18, 2017 at 10:53:31AM +0000, Marc Zyngier wrote:
> Since everybody copied my own mistake from the DT binding example,
> let's address all the offenders in one swift go.
>=20
> Most of them got the CPU interface size wrong (4kB, while it should
> be 8kB), except for both keystone platforms which got the control
> interface wrong (4kB instead of 8kB).
>=20
> In the couple of cases were I knew for sure what implementation
> was used, I've added the "arm,gic-400" compatible string. I'm 99%
> sure that this is what everyong is using, but short of having the
> TRM for all the other SoCs, I've let them alone.
>=20
> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> ---
>  arch/arm/boot/dts/alpine.dtsi        | 2 +-

For the Alpine SoC,

Acked-by: Antoine Tenart <antoine.tenart@free-electrons.com>

Thanks!

>  arch/arm/boot/dts/axm55xx.dtsi       | 2 +-
>  arch/arm/boot/dts/dra7.dtsi          | 2 +-
>  arch/arm/boot/dts/ecx-2000.dts       | 2 +-
>  arch/arm/boot/dts/exynos3250.dtsi    | 2 +-
>  arch/arm/boot/dts/exynos5.dtsi       | 2 +-
>  arch/arm/boot/dts/exynos5260.dtsi    | 2 +-
>  arch/arm/boot/dts/exynos5440.dtsi    | 2 +-
>  arch/arm/boot/dts/imx6ul.dtsi        | 4 ++--
>  arch/arm/boot/dts/keystone-k2g.dtsi  | 2 +-
>  arch/arm/boot/dts/keystone.dtsi      | 2 +-
>  arch/arm/boot/dts/ls1021a.dtsi       | 4 ++--
>  arch/arm/boot/dts/mt2701.dtsi        | 2 +-
>  arch/arm/boot/dts/mt6580.dtsi        | 2 +-
>  arch/arm/boot/dts/mt6589.dtsi        | 2 +-
>  arch/arm/boot/dts/mt7623.dtsi        | 2 +-
>  arch/arm/boot/dts/mt8127.dtsi        | 2 +-
>  arch/arm/boot/dts/mt8135.dtsi        | 2 +-
>  arch/arm/boot/dts/omap5.dtsi         | 2 +-
>  arch/arm/boot/dts/r8a73a4.dtsi       | 2 +-
>  arch/arm/boot/dts/r8a7743.dtsi       | 2 +-
>  arch/arm/boot/dts/r8a7745.dtsi       | 2 +-
>  arch/arm/boot/dts/r8a7790.dtsi       | 2 +-
>  arch/arm/boot/dts/r8a7791.dtsi       | 2 +-
>  arch/arm/boot/dts/r8a7792.dtsi       | 2 +-
>  arch/arm/boot/dts/r8a7793.dtsi       | 2 +-
>  arch/arm/boot/dts/r8a7794.dtsi       | 2 +-
>  arch/arm/boot/dts/rk1108.dtsi        | 2 +-
>  arch/arm/boot/dts/rk3036.dtsi        | 2 +-
>  arch/arm/boot/dts/rk322x.dtsi        | 2 +-
>  arch/arm/boot/dts/rk3288.dtsi        | 2 +-
>  arch/arm/boot/dts/sun6i-a31.dtsi     | 2 +-
>  arch/arm/boot/dts/sun7i-a20.dtsi     | 4 ++--
>  arch/arm/boot/dts/sun8i-a23-a33.dtsi | 2 +-
>  arch/arm/boot/dts/sun8i-a83t.dtsi    | 2 +-
>  arch/arm/boot/dts/sun8i-h3.dtsi      | 2 +-
>  arch/arm/boot/dts/sun9i-a80.dtsi     | 2 +-
>  37 files changed, 40 insertions(+), 40 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/alpine.dtsi b/arch/arm/boot/dts/alpine.dtsi
> index db8752f..d0eefc3 100644
> --- a/arch/arm/boot/dts/alpine.dtsi
> +++ b/arch/arm/boot/dts/alpine.dtsi
> @@ -93,7 +93,7 @@
>  			interrupt-controller;
>  			reg =3D <0x0 0xfb001000 0x0 0x1000>,
>  			      <0x0 0xfb002000 0x0 0x2000>,
> -			      <0x0 0xfb004000 0x0 0x1000>,
> +			      <0x0 0xfb004000 0x0 0x2000>,
>  			      <0x0 0xfb006000 0x0 0x2000>;
>  			interrupts =3D
>  				<GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> diff --git a/arch/arm/boot/dts/axm55xx.dtsi b/arch/arm/boot/dts/axm55xx.d=
tsi
> index a9d6d59..47799f5 100644
> --- a/arch/arm/boot/dts/axm55xx.dtsi
> +++ b/arch/arm/boot/dts/axm55xx.dtsi
> @@ -62,7 +62,7 @@
>  		#address-cells =3D <0>;
>  		interrupt-controller;
>  		reg =3D <0x20 0x01001000 0 0x1000>,
> -		      <0x20 0x01002000 0 0x1000>,
> +		      <0x20 0x01002000 0 0x2000>,
>  		      <0x20 0x01004000 0 0x2000>,
>  		      <0x20 0x01006000 0 0x2000>;
>  		interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) |
> diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
> index 1faf24a..a9ffa49 100644
> --- a/arch/arm/boot/dts/dra7.dtsi
> +++ b/arch/arm/boot/dts/dra7.dtsi
> @@ -57,7 +57,7 @@
>  		interrupt-controller;
>  		#interrupt-cells =3D <3>;
>  		reg =3D <0x0 0x48211000 0x0 0x1000>,
> -		      <0x0 0x48212000 0x0 0x1000>,
> +		      <0x0 0x48212000 0x0 0x2000>,
>  		      <0x0 0x48214000 0x0 0x2000>,
>  		      <0x0 0x48216000 0x0 0x2000>;
>  		interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIG=
H)>;
> diff --git a/arch/arm/boot/dts/ecx-2000.dts b/arch/arm/boot/dts/ecx-2000.=
dts
> index 2ccbb57f..c15e7e0 100644
> --- a/arch/arm/boot/dts/ecx-2000.dts
> +++ b/arch/arm/boot/dts/ecx-2000.dts
> @@ -99,7 +99,7 @@
>  			interrupt-controller;
>  			interrupts =3D <1 9 0xf04>;
>  			reg =3D <0xfff11000 0x1000>,
> -			      <0xfff12000 0x1000>,
> +			      <0xfff12000 0x2000>,
>  			      <0xfff14000 0x2000>,
>  			      <0xfff16000 0x2000>;
>  		};
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos=
3250.dtsi
> index ba17ee1..9c28ef4 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -234,7 +234,7 @@
>  			#interrupt-cells =3D <3>;
>  			interrupt-controller;
>  			reg =3D <0x10481000 0x1000>,
> -			      <0x10482000 0x1000>,
> +			      <0x10482000 0x2000>,
>  			      <0x10484000 0x2000>,
>  			      <0x10486000 0x2000>;
>  			interrupts =3D <GIC_PPI 9
> diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.d=
tsi
> index 7fd870e..678c08e 100644
> --- a/arch/arm/boot/dts/exynos5.dtsi
> +++ b/arch/arm/boot/dts/exynos5.dtsi
> @@ -94,7 +94,7 @@
>  			#interrupt-cells =3D <3>;
>  			interrupt-controller;
>  			reg =3D	<0x10481000 0x1000>,
> -				<0x10482000 0x1000>,
> +				<0x10482000 0x2000>,
>  				<0x10484000 0x2000>,
>  				<0x10486000 0x2000>;
>  			interrupts =3D <GIC_PPI 9
> diff --git a/arch/arm/boot/dts/exynos5260.dtsi b/arch/arm/boot/dts/exynos=
5260.dtsi
> index 5818718..5e88c96 100644
> --- a/arch/arm/boot/dts/exynos5260.dtsi
> +++ b/arch/arm/boot/dts/exynos5260.dtsi
> @@ -167,7 +167,7 @@
>  			#size-cells =3D <0>;
>  			interrupt-controller;
>  			reg =3D <0x10481000 0x1000>,
> -				<0x10482000 0x1000>,
> +				<0x10482000 0x2000>,
>  				<0x10484000 0x2000>,
>  				<0x10486000 0x2000>;
>  			interrupts =3D <GIC_PPI 9
> diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos=
5440.dtsi
> index 2a2e570..77d35bb 100644
> --- a/arch/arm/boot/dts/exynos5440.dtsi
> +++ b/arch/arm/boot/dts/exynos5440.dtsi
> @@ -40,7 +40,7 @@
>  		#interrupt-cells =3D <3>;
>  		interrupt-controller;
>  		reg =3D	<0x2E1000 0x1000>,
> -			<0x2E2000 0x1000>,
> +			<0x2E2000 0x2000>,
>  			<0x2E4000 0x2000>,
>  			<0x2E6000 0x2000>;
>  		interrupts =3D <GIC_PPI 9
> diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
> index 39845a7..ac5371a 100644
> --- a/arch/arm/boot/dts/imx6ul.dtsi
> +++ b/arch/arm/boot/dts/imx6ul.dtsi
> @@ -91,11 +91,11 @@
>  	};
> =20
>  	intc: interrupt-controller@00a01000 {
> -		compatible =3D "arm,cortex-a7-gic";
> +		compatible =3D "arm,gic-400", "arm,cortex-a7-gic";
>  		#interrupt-cells =3D <3>;
>  		interrupt-controller;
>  		reg =3D <0x00a01000 0x1000>,
> -		      <0x00a02000 0x1000>,
> +		      <0x00a02000 0x2000>,
>  		      <0x00a04000 0x2000>,
>  		      <0x00a06000 0x2000>;
>  	};
> diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keys=
tone-k2g.dtsi
> index 63c7cf0..07bf300 100644
> --- a/arch/arm/boot/dts/keystone-k2g.dtsi
> +++ b/arch/arm/boot/dts/keystone-k2g.dtsi
> @@ -45,7 +45,7 @@
>  		interrupt-controller;
>  		reg =3D <0x0 0x02561000 0x0 0x1000>,
>  		      <0x0 0x02562000 0x0 0x2000>,
> -		      <0x0 0x02564000 0x0 0x1000>,
> +		      <0x0 0x02564000 0x0 0x2000>,
>  		      <0x0 0x02566000 0x0 0x2000>;
>  		interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) |
>  				IRQ_TYPE_LEVEL_HIGH)>;
> diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone=
=2Edtsi
> index 02708ba..aaff6816 100644
> --- a/arch/arm/boot/dts/keystone.dtsi
> +++ b/arch/arm/boot/dts/keystone.dtsi
> @@ -35,7 +35,7 @@
>  		interrupt-controller;
>  		reg =3D <0x0 0x02561000 0x0 0x1000>,
>  		      <0x0 0x02562000 0x0 0x2000>,
> -		      <0x0 0x02564000 0x0 0x1000>,
> +		      <0x0 0x02564000 0x0 0x2000>,
>  		      <0x0 0x02566000 0x0 0x2000>;
>  		interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) |
>  				IRQ_TYPE_LEVEL_HIGH)>;
> diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.d=
tsi
> index 282d854..45ea57f 100644
> --- a/arch/arm/boot/dts/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/ls1021a.dtsi
> @@ -110,11 +110,11 @@
>  		ranges;
> =20
>  		gic: interrupt-controller@1400000 {
> -			compatible =3D "arm,cortex-a7-gic";
> +			compatible =3D "arm,gic-400", "arm,cortex-a7-gic";
>  			#interrupt-cells =3D <3>;
>  			interrupt-controller;
>  			reg =3D <0x0 0x1401000 0x0 0x1000>,
> -			      <0x0 0x1402000 0x0 0x1000>,
> +			      <0x0 0x1402000 0x0 0x2000>,
>  			      <0x0 0x1404000 0x0 0x2000>,
>  			      <0x0 0x1406000 0x0 0x2000>;
>  			interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HI=
GH)>;
> diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
> index 7eab6f4..454d099 100644
> --- a/arch/arm/boot/dts/mt2701.dtsi
> +++ b/arch/arm/boot/dts/mt2701.dtsi
> @@ -170,7 +170,7 @@
>  		#interrupt-cells =3D <3>;
>  		interrupt-parent =3D <&gic>;
>  		reg =3D <0 0x10211000 0 0x1000>,
> -		      <0 0x10212000 0 0x1000>,
> +		      <0 0x10212000 0 0x2000>,
>  		      <0 0x10214000 0 0x2000>,
>  		      <0 0x10216000 0 0x2000>;
>  	};
> diff --git a/arch/arm/boot/dts/mt6580.dtsi b/arch/arm/boot/dts/mt6580.dtsi
> index 06fdf6c..a349dba 100644
> --- a/arch/arm/boot/dts/mt6580.dtsi
> +++ b/arch/arm/boot/dts/mt6580.dtsi
> @@ -91,7 +91,7 @@
>  		#interrupt-cells =3D <3>;
>  		interrupt-parent =3D <&gic>;
>  		reg =3D <0x10211000 0x1000>,
> -		      <0x10212000 0x1000>,
> +		      <0x10212000 0x2000>,
>  		      <0x10214000 0x2000>,
>  		      <0x10216000 0x2000>;
>  	};
> diff --git a/arch/arm/boot/dts/mt6589.dtsi b/arch/arm/boot/dts/mt6589.dtsi
> index 88b3cb1..0d6f60a 100644
> --- a/arch/arm/boot/dts/mt6589.dtsi
> +++ b/arch/arm/boot/dts/mt6589.dtsi
> @@ -102,7 +102,7 @@
>  			#interrupt-cells =3D <3>;
>  			interrupt-parent =3D <&gic>;
>  			reg =3D <0x10211000 0x1000>,
> -			      <0x10212000 0x1000>,
> +			      <0x10212000 0x2000>,
>  			      <0x10214000 0x2000>,
>  			      <0x10216000 0x2000>;
>  		};
> diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
> index fd2b614..19a54a3 100644
> --- a/arch/arm/boot/dts/mt7623.dtsi
> +++ b/arch/arm/boot/dts/mt7623.dtsi
> @@ -104,7 +104,7 @@
>  		#interrupt-cells =3D <3>;
>  		interrupt-parent =3D <&gic>;
>  		reg =3D <0 0x10211000 0 0x1000>,
> -		      <0 0x10212000 0 0x1000>,
> +		      <0 0x10212000 0 0x2000>,
>  		      <0 0x10214000 0 0x2000>,
>  		      <0 0x10216000 0 0x2000>;
>  	};
> diff --git a/arch/arm/boot/dts/mt8127.dtsi b/arch/arm/boot/dts/mt8127.dtsi
> index 52086c8..916c095 100644
> --- a/arch/arm/boot/dts/mt8127.dtsi
> +++ b/arch/arm/boot/dts/mt8127.dtsi
> @@ -129,7 +129,7 @@
>  			#interrupt-cells =3D <3>;
>  			interrupt-parent =3D <&gic>;
>  			reg =3D <0 0x10211000 0 0x1000>,
> -			      <0 0x10212000 0 0x1000>,
> +			      <0 0x10212000 0 0x2000>,
>  			      <0 0x10214000 0 0x2000>,
>  			      <0 0x10216000 0 0x2000>;
>  		};
> diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135.dtsi
> index 1d7f92b..a97b4ee 100644
> --- a/arch/arm/boot/dts/mt8135.dtsi
> +++ b/arch/arm/boot/dts/mt8135.dtsi
> @@ -221,7 +221,7 @@
>  			#interrupt-cells =3D <3>;
>  			interrupt-parent =3D <&gic>;
>  			reg =3D <0 0x10211000 0 0x1000>,
> -			      <0 0x10212000 0 0x1000>,
> +			      <0 0x10212000 0 0x2000>,
>  			      <0 0x10214000 0 0x2000>,
>  			      <0 0x10216000 0 0x2000>;
>  		};
> diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
> index 7cd92ba..71b4809 100644
> --- a/arch/arm/boot/dts/omap5.dtsi
> +++ b/arch/arm/boot/dts/omap5.dtsi
> @@ -92,7 +92,7 @@
>  		interrupt-controller;
>  		#interrupt-cells =3D <3>;
>  		reg =3D <0 0x48211000 0 0x1000>,
> -		      <0 0x48212000 0 0x1000>,
> +		      <0 0x48212000 0 0x2000>,
>  		      <0 0x48214000 0 0x2000>,
>  		      <0 0x48216000 0 0x2000>;
>  		interrupt-parent =3D <&gic>;
> diff --git a/arch/arm/boot/dts/r8a73a4.dtsi b/arch/arm/boot/dts/r8a73a4.d=
tsi
> index 53183ff..14a66ca 100644
> --- a/arch/arm/boot/dts/r8a73a4.dtsi
> +++ b/arch/arm/boot/dts/r8a73a4.dtsi
> @@ -465,7 +465,7 @@
>  		#address-cells =3D <0>;
>  		interrupt-controller;
>  		reg =3D <0 0xf1001000 0 0x1000>,
> -			<0 0xf1002000 0 0x1000>,
> +			<0 0xf1002000 0 0x2000>,
>  			<0 0xf1004000 0 0x2000>,
>  			<0 0xf1006000 0 0x2000>;
>  		interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIG=
H)>;
> diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.d=
tsi
> index 216cb1f..172a944 100644
> --- a/arch/arm/boot/dts/r8a7743.dtsi
> +++ b/arch/arm/boot/dts/r8a7743.dtsi
> @@ -55,7 +55,7 @@
>  			#address-cells =3D <0>;
>  			interrupt-controller;
>  			reg =3D <0 0xf1001000 0 0x1000>,
> -			      <0 0xf1002000 0 0x1000>,
> +			      <0 0xf1002000 0 0x2000>,
>  			      <0 0xf1004000 0 0x2000>,
>  			      <0 0xf1006000 0 0x2000>;
>  			interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) |
> diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.d=
tsi
> index 0b2e2f3..7390ec0 100644
> --- a/arch/arm/boot/dts/r8a7745.dtsi
> +++ b/arch/arm/boot/dts/r8a7745.dtsi
> @@ -55,7 +55,7 @@
>  			#address-cells =3D <0>;
>  			interrupt-controller;
>  			reg =3D <0 0xf1001000 0 0x1000>,
> -			      <0 0xf1002000 0 0x1000>,
> +			      <0 0xf1002000 0 0x2000>,
>  			      <0 0xf1004000 0 0x2000>,
>  			      <0 0xf1006000 0 0x2000>;
>  			interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) |
> diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.d=
tsi
> index 0c8900d..ac38764 100644
> --- a/arch/arm/boot/dts/r8a7790.dtsi
> +++ b/arch/arm/boot/dts/r8a7790.dtsi
> @@ -183,7 +183,7 @@
>  		#address-cells =3D <0>;
>  		interrupt-controller;
>  		reg =3D <0 0xf1001000 0 0x1000>,
> -			<0 0xf1002000 0 0x1000>,
> +			<0 0xf1002000 0 0x2000>,
>  			<0 0xf1004000 0 0x2000>,
>  			<0 0xf1006000 0 0x2000>;
>  		interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIG=
H)>;
> diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.d=
tsi
> index 8721466..28039db 100644
> --- a/arch/arm/boot/dts/r8a7791.dtsi
> +++ b/arch/arm/boot/dts/r8a7791.dtsi
> @@ -114,7 +114,7 @@
>  		#address-cells =3D <0>;
>  		interrupt-controller;
>  		reg =3D <0 0xf1001000 0 0x1000>,
> -			<0 0xf1002000 0 0x1000>,
> +			<0 0xf1002000 0 0x2000>,
>  			<0 0xf1004000 0 0x2000>,
>  			<0 0xf1006000 0 0x2000>;
>  		interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIG=
H)>;
> diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.d=
tsi
> index 6ced3c1..1ed5c88 100644
> --- a/arch/arm/boot/dts/r8a7792.dtsi
> +++ b/arch/arm/boot/dts/r8a7792.dtsi
> @@ -88,7 +88,7 @@
>  			#interrupt-cells =3D <3>;
>  			interrupt-controller;
>  			reg =3D <0 0xf1001000 0 0x1000>,
> -			      <0 0xf1002000 0 0x1000>,
> +			      <0 0xf1002000 0 0x2000>,
>  			      <0 0xf1004000 0 0x2000>,
>  			      <0 0xf1006000 0 0x2000>;
>  			interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) |
> diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.d=
tsi
> index 2fb527c..934c097 100644
> --- a/arch/arm/boot/dts/r8a7793.dtsi
> +++ b/arch/arm/boot/dts/r8a7793.dtsi
> @@ -105,7 +105,7 @@
>  		#address-cells =3D <0>;
>  		interrupt-controller;
>  		reg =3D <0 0xf1001000 0 0x1000>,
> -			<0 0xf1002000 0 0x1000>,
> +			<0 0xf1002000 0 0x2000>,
>  			<0 0xf1004000 0 0x2000>,
>  			<0 0xf1006000 0 0x2000>;
>  		interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIG=
H)>;
> diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.d=
tsi
> index fb576db..09f7823 100644
> --- a/arch/arm/boot/dts/r8a7794.dtsi
> +++ b/arch/arm/boot/dts/r8a7794.dtsi
> @@ -71,7 +71,7 @@
>  		#address-cells =3D <0>;
>  		interrupt-controller;
>  		reg =3D <0 0xf1001000 0 0x1000>,
> -			<0 0xf1002000 0 0x1000>,
> +			<0 0xf1002000 0 0x2000>,
>  			<0 0xf1004000 0 0x2000>,
>  			<0 0xf1006000 0 0x2000>;
>  		interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIG=
H)>;
> diff --git a/arch/arm/boot/dts/rk1108.dtsi b/arch/arm/boot/dts/rk1108.dtsi
> index d770023..d6194bf 100644
> --- a/arch/arm/boot/dts/rk1108.dtsi
> +++ b/arch/arm/boot/dts/rk1108.dtsi
> @@ -215,7 +215,7 @@
>  		#address-cells =3D <0>;
> =20
>  		reg =3D <0x32011000 0x1000>,
> -		      <0x32012000 0x1000>,
> +		      <0x32012000 0x2000>,
>  		      <0x32014000 0x2000>,
>  		      <0x32016000 0x2000>;
>  		interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIG=
H)>;
> diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
> index 4ed49a2..ff9b90b 100644
> --- a/arch/arm/boot/dts/rk3036.dtsi
> +++ b/arch/arm/boot/dts/rk3036.dtsi
> @@ -189,7 +189,7 @@
>  		#address-cells =3D <0>;
> =20
>  		reg =3D <0x10139000 0x1000>,
> -		      <0x1013a000 0x1000>,
> +		      <0x1013a000 0x2000>,
>  		      <0x1013c000 0x2000>,
>  		      <0x1013e000 0x2000>;
>  		interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIG=
H)>;
> diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
> index 9d3aee5..9dff822 100644
> --- a/arch/arm/boot/dts/rk322x.dtsi
> +++ b/arch/arm/boot/dts/rk322x.dtsi
> @@ -443,7 +443,7 @@
>  		#address-cells =3D <0>;
> =20
>  		reg =3D <0x32011000 0x1000>,
> -		      <0x32012000 0x1000>,
> +		      <0x32012000 0x2000>,
>  		      <0x32014000 0x2000>,
>  		      <0x32016000 0x2000>;
>  		interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIG=
H)>;
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 4fad133..af46cba 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -1110,7 +1110,7 @@
>  		#address-cells =3D <0>;
> =20
>  		reg =3D <0xffc01000 0x1000>,
> -		      <0xffc02000 0x1000>,
> +		      <0xffc02000 0x2000>,
>  		      <0xffc04000 0x2000>,
>  		      <0xffc06000 0x2000>;
>  		interrupts =3D <GIC_PPI 9 0xf04>;
> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a=
31.dtsi
> index 2b26175..6ed505a 100644
> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
> @@ -861,7 +861,7 @@
>  		gic: interrupt-controller@01c81000 {
>  			compatible =3D "arm,cortex-a7-gic", "arm,cortex-a15-gic";
>  			reg =3D <0x01c81000 0x1000>,
> -			      <0x01c82000 0x1000>,
> +			      <0x01c82000 0x2000>,
>  			      <0x01c84000 0x2000>,
>  			      <0x01c86000 0x2000>;
>  			interrupt-controller;
> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a=
20.dtsi
> index f7db067..3c24832 100644
> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> @@ -1686,9 +1686,9 @@
>  		};
> =20
>  		gic: interrupt-controller@01c81000 {
> -			compatible =3D "arm,cortex-a7-gic", "arm,cortex-a15-gic";
> +			compatible =3D "arm,gic-400", "arm,cortex-a7-gic", "arm,cortex-a15-gi=
c";
>  			reg =3D <0x01c81000 0x1000>,
> -			      <0x01c82000 0x1000>,
> +			      <0x01c82000 0x2000>,
>  			      <0x01c84000 0x2000>,
>  			      <0x01c86000 0x2000>;
>  			interrupt-controller;
> diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun=
8i-a23-a33.dtsi
> index e4991a7..49dfe86 100644
> --- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> @@ -489,7 +489,7 @@
>  		gic: interrupt-controller@01c81000 {
>  			compatible =3D "arm,cortex-a7-gic", "arm,cortex-a15-gic";
>  			reg =3D <0x01c81000 0x1000>,
> -			      <0x01c82000 0x1000>,
> +			      <0x01c82000 0x2000>,
>  			      <0x01c84000 0x2000>,
>  			      <0x01c86000 0x2000>;
>  			interrupt-controller;
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-=
a83t.dtsi
> index d3473f8..04c3fdd 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -217,7 +217,7 @@
>  		gic: interrupt-controller@01c81000 {
>  			compatible =3D "arm,cortex-a7-gic", "arm,cortex-a15-gic";
>  			reg =3D <0x01c81000 0x1000>,
> -			      <0x01c82000 0x1000>,
> +			      <0x01c82000 0x2000>,
>  			      <0x01c84000 0x2000>,
>  			      <0x01c86000 0x2000>;
>  			interrupt-controller;
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3=
=2Edtsi
> index 6c14a6f..292abd0 100644
> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> @@ -580,7 +580,7 @@
>  		gic: interrupt-controller@01c81000 {
>  			compatible =3D "arm,cortex-a7-gic", "arm,cortex-a15-gic";
>  			reg =3D <0x01c81000 0x1000>,
> -			      <0x01c82000 0x1000>,
> +			      <0x01c82000 0x2000>,
>  			      <0x01c84000 0x2000>,
>  			      <0x01c86000 0x2000>;
>  			interrupt-controller;
> diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a=
80.dtsi
> index 979ad1a..b7b5831 100644
> --- a/arch/arm/boot/dts/sun9i-a80.dtsi
> +++ b/arch/arm/boot/dts/sun9i-a80.dtsi
> @@ -613,7 +613,7 @@
>  		gic: interrupt-controller@01c41000 {
>  			compatible =3D "arm,cortex-a7-gic", "arm,cortex-a15-gic";
>  			reg =3D <0x01c41000 0x1000>,
> -			      <0x01c42000 0x1000>,
> +			      <0x01c42000 0x2000>,
>  			      <0x01c44000 0x2000>,
>  			      <0x01c46000 0x2000>;
>  			interrupt-controller;
> --=20
> 2.1.4
>=20

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--2iuntmyv7ubsaokf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJYf2RmAAoJEFxNi8it27zYPKcP/i0qZs9R2ziBLvGyH1o6Do29
h7IHTSaL8IfwU2nbOBdtuHutqEcMzRah1oY1/swS7bEJBFDObhys9bHKNuYhUuZu
+484SRnxotToqmeIpj0UKG1DwoC6PdU1pzAIJ42wSkpQPyXSdR9IbshKfKXliALC
wLmkCCsgX69vlbyDyAULDQY5BYtFmVi+bqRzCTGsinlnaNJ31cnFzcfvFP7MIQpf
1gMm4HF7s5jyVpmPOZyXcAEDv0gOkx8hs8QlT+jiwxBEUJUcgguHz0KQ1UWoZqJS
OHNdkagBQS1hoWwknaPB/OFKDgJNL2TZLvJRAg6QR/O1Nuej2qaDkWGltc+jIm2T
jXutZNNWn1fPyo/1YyBHPn645bDpC8wRuSH1JVHzYV9FhUhBG0YtIXnWD2WVrbhy
2WtpCdrywrqHO9zNAGbe5DkZw8j+9808yfkWvpIhtmgXByM3w2cQh7/ArFjrIoal
n5RxjbC8JJOolJKaJUNfmVLeTLV86c0Wql5bSQP814XGHjxfps/G6nMtf0UDq+ss
MgDq/vZSr0KoJpJCbl8FhJL8/1oT8aOu2odmG0SuzP6+aHaHnSaBuhEtzvOamQK2
AudSrbVdlkFnWJpc7Ol101/Pg5hJAxDVhg5SkQCYW1BU1ZU85fpkldcEL+FvoD3R
rngUL5TmB5lI+uL9wnln
=9z14
-----END PGP SIGNATURE-----

--2iuntmyv7ubsaokf--


--===============9153246443267714184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============9153246443267714184==--
