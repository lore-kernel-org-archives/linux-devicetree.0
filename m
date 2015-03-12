From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [RFC PATCH v2 3/3] ARM: dts: exynos5420: add async-bridge clocks
 to disp1 power domain
Date: Thu, 12 Mar 2015 14:00:07 +0100
Message-ID: <55018DD7.2010608@samsung.com>
References: <54D48701.10105@collabora.co.uk>
 <1423220154-5333-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1423220154-5333-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, javier.martinez@collabora.co.uk, Liquid.Acid@gmx.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 06/02/15 11:55, Andrzej Hajda wrote:
> FIMD and MIXER IPs in disp1 power domain have async-bridges (to GSCALER),
> therefore their clocks should be enabled during power domain switch.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index e1fa800..58579f5 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -293,9 +293,11 @@
>  			 <&clock CLK_MOUT_SW_ACLK300>,
>  			 <&clock CLK_MOUT_USER_ACLK300_DISP1>,
>  			 <&clock CLK_MOUT_SW_ACLK400>,
> -			 <&clock CLK_MOUT_USER_ACLK400_DISP1>;
> +			 <&clock CLK_MOUT_USER_ACLK400_DISP1>,
> +			 <&clock CLK_FIMD1>, <&clock CLK_MIXER>;
>  		clock-names = "oscclk", "pclk0", "clk0",
> -			      "pclk1", "clk1", "pclk2", "clk2";
> +			      "pclk1", "clk1", "pclk2", "clk2",
> +			      "asb0", "asb1";
>  	};

In general I don't like those clock/clock-names properties in the power
domain nodes, since the power domains are not really consumers of those
clocks. However these clocks are essential for the exynos power domains
operation. There are more dependencies between the clocks and the power
domains which adding of those properties does not cover. And we'll need
to address those dependencies somehow.
Anyway, the subject patch looks OK to me, given that support for clocks/
clock-names in the exynos power domain device nodes has been merged
for quite long already.
The entire feature has been merged without PM or clk subsystem
maintainer ACK, I don't see a reason not to merge this small addition
of more clocks, especially that it fixes a real bug.

Please feel free to add:
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
Regards,
Sylwester
