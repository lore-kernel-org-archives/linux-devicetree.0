From: Emmanuel Vadot <manu@bidouilliste.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Drop PMU node
Date: Tue, 6 Aug 2019 21:10:07 +0200
Message-ID: <20190806211007.cd9c10bd0d174f56e4998980@bidouilliste.com>
References: <20190806140135.4739-1-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190806140135.4739-1-anarsoul@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "Jared D . McNeill" <jmcneill@NetBSD.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Harald Geyer <harald@ccbib.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue,  6 Aug 2019 07:01:35 -0700
Vasily Khoruzhick <anarsoul@gmail.com> wrote:

> Looks like PMU in A64 is broken, it generates no interrupts at all and
> as result 'perf top' shows no events.
> 
> Tested on Pine64-LTS.
> 
> Fixes: 34a97fcc71c2 ("arm64: dts: allwinner: a64: Add PMU node")
> Cc: Harald Geyer <harald@ccbib.org>
> Cc: Jared D. McNeill <jmcneill@NetBSD.org>
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 9cc9bdde81ac..cd92f546c483 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -142,15 +142,6 @@
>  		clock-output-names = "ext-osc32k";
>  	};
>  
> -	pmu {
> -		compatible = "arm,cortex-a53-pmu";
> -		interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
> -	};
> -
>  	psci {
>  		compatible = "arm,psci-0.2";
>  		method = "smc";
> -- 
> 2.22.0

 It doesn't work for me too on FreeBSD, and yes the interrupts are
wrong but this is not the problem. Maybe there is a reset line but it's
not documented in the documentation.

 Reviewed-by: Emmanuel Vadot <manu@FreeBSD.org>

-- 
Emmanuel Vadot <manu@bidouilliste.com> <manu@freebsd.org>
