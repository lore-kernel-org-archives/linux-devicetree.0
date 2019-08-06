From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Drop PMU node
Date: Tue, 6 Aug 2019 15:35:30 +0100
Message-ID: <89402d22-d432-9551-e787-c8ede16dbe5f@arm.com>
References: <20190806140135.4739-1-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190806140135.4739-1-anarsoul@gmail.com>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vasily Khoruzhick <anarsoul@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: "Jared D . McNeill" <jmcneill@NetBSD.org>, Harald Geyer <harald@ccbib.org>
List-Id: devicetree@vger.kernel.org

On 06/08/2019 15:01, Vasily Khoruzhick wrote:
> Looks like PMU in A64 is broken, it generates no interrupts at all and
> as result 'perf top' shows no events.

Does something like 'perf stat sleep 1' at least count cycles correctly? 
It could well just be that the interrupt numbers are wrong...

> Tested on Pine64-LTS.
> 
> Fixes: 34a97fcc71c2 ("arm64: dts: allwinner: a64: Add PMU node")
> Cc: Harald Geyer <harald@ccbib.org>
> Cc: Jared D. McNeill <jmcneill@NetBSD.org>
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 9cc9bdde81ac..cd92f546c483 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -142,15 +142,6 @@
>   		clock-output-names = "ext-osc32k";
>   	};
>   
> -	pmu {
> -		compatible = "arm,cortex-a53-pmu";
> -		interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;

Cross-referencing between some random DTs in the H6 BSP I happen to have 
to hand and the A64 User Manual, it looks a lot like someone just forgot 
to subtract 32 from these to satisfy the awkward GIC binding - that 
wants the SPI index rather than the actual interrupt source number, 
which implies these should probably be 120-123 rather than 152-155.

Robin.

> -		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
> -	};
> -
>   	psci {
>   		compatible = "arm,psci-0.2";
>   		method = "smc";
> 
