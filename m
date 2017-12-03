From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: Add missing interrupt-controller
 properties to Exynos5410 PMU
Date: Sun, 3 Dec 2017 13:07:27 +0100
Message-ID: <20171203120727.f32ynwpgploef7eu@kozik-lap>
References: <20171129183610.26305-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171129183610.26305-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 29, 2017 at 07:36:10PM +0100, Krzysztof Kozlowski wrote:
> PMU (system-controller@10040000) is used as interrupt-parent for certain
> nodes thus it should be marked as interrupt-controller to silence
> warnings when building Exynos5410-based DTBs:
> 
>   arch/arm/boot/dts/exynos5410-odroidxu.dtb: Warning (interrupts_property):
>     Missing interrupt-controller or interrupt-map property in /soc/system-controller@10040000
>   arch/arm/boot/dts/exynos5410-odroidxu.dtb: Warning (interrupts_property):
>     Missing #interrupt-cells in interrupt-parent /soc/system-controller@10040000
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/exynos5410.dtsi | 3 +++
>  1 file changed, 3 insertions(+)

For the record, applied.

Best regards,
Krzysztof
