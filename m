From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/2] ARM: DTS: Fix register map for virt-capable GIC
Date: Wed, 18 Jan 2017 12:25:00 +0100
Message-ID: <2229087.5bOlf9DNaK@diego>
References: <1484736811-24002-1-git-send-email-marc.zyngier@arm.com>
 <1484736811-24002-3-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Tony Lindgren <tony@atomide.com>, arm@kernel.org, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@free-electrons.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, =?ISO-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>, Fabio Estevam <fabio.estevam@nxp.com>, Maxime
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 18. Januar 2017, 10:53:31 CET schrieb Marc Zyngier:
> Since everybody copied my own mistake from the DT binding example,
> let's address all the offenders in one swift go.
> 
> Most of them got the CPU interface size wrong (4kB, while it should
> be 8kB), except for both keystone platforms which got the control
> interface wrong (4kB instead of 8kB).
> 
> In the couple of cases were I knew for sure what implementation
> was used, I've added the "arm,gic-400" compatible string. I'm 99%
> sure that this is what everyong is using, but short of having the
> TRM for all the other SoCs, I've let them alone.
> 
> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>

for the Rockchip parts
Acked-by: Heiko Stuebner <heiko@sntech.de>

> diff --git a/arch/arm/boot/dts/rk1108.dtsi b/arch/arm/boot/dts/rk1108.dtsi
> index d770023..d6194bf 100644
> --- a/arch/arm/boot/dts/rk1108.dtsi
> +++ b/arch/arm/boot/dts/rk1108.dtsi
> @@ -215,7 +215,7 @@
>  		#address-cells = <0>;
> 
>  		reg = <0x32011000 0x1000>,
> -		      <0x32012000 0x1000>,
> +		      <0x32012000 0x2000>,
>  		      <0x32014000 0x2000>,
>  		      <0x32016000 0x2000>;
>  		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(1) | 
IRQ_TYPE_LEVEL_HIGH)>;
> diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
> index 4ed49a2..ff9b90b 100644
> --- a/arch/arm/boot/dts/rk3036.dtsi
> +++ b/arch/arm/boot/dts/rk3036.dtsi
> @@ -189,7 +189,7 @@
>  		#address-cells = <0>;
> 
>  		reg = <0x10139000 0x1000>,
> -		      <0x1013a000 0x1000>,
> +		      <0x1013a000 0x2000>,
>  		      <0x1013c000 0x2000>,
>  		      <0x1013e000 0x2000>;
>  		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | 
IRQ_TYPE_LEVEL_HIGH)>;
> diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
> index 9d3aee5..9dff822 100644
> --- a/arch/arm/boot/dts/rk322x.dtsi
> +++ b/arch/arm/boot/dts/rk322x.dtsi
> @@ -443,7 +443,7 @@
>  		#address-cells = <0>;
> 
>  		reg = <0x32011000 0x1000>,
> -		      <0x32012000 0x1000>,
> +		      <0x32012000 0x2000>,
>  		      <0x32014000 0x2000>,
>  		      <0x32016000 0x2000>;
>  		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | 
IRQ_TYPE_LEVEL_HIGH)>;
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 4fad133..af46cba 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -1110,7 +1110,7 @@
>  		#address-cells = <0>;
> 
>  		reg = <0xffc01000 0x1000>,
> -		      <0xffc02000 0x1000>,
> +		      <0xffc02000 0x2000>,
>  		      <0xffc04000 0x2000>,
>  		      <0xffc06000 0x2000>;
>  		interrupts = <GIC_PPI 9 0xf04>;
