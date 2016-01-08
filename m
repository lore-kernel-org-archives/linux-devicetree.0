From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: add power-domain header for RK3368
 SoCs
Date: Fri, 8 Jan 2016 14:28:33 +0000
Message-ID: <20160108142833.GF3097@leverpostej>
References: <1452278261-16864-1-git-send-email-zhangqing@rock-chips.com>
 <1452278261-16864-2-git-send-email-zhangqing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452278261-16864-2-git-send-email-zhangqing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: zhangqing <zhangqing@rock-chips.com>
Cc: heiko@sntech.de, wxt@rock-chips.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, khilman@linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, huangtao@rock-chips.com, zyw@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 08, 2016 at 10:37:40AM -0800, zhangqing wrote:
> According to a description from TRM, add all the power domains.
> 
> Signed-off-by: zhangqing <zhangqing@rock-chips.com>
> ---
>  include/dt-bindings/power/rk3368-power.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 include/dt-bindings/power/rk3368-power.h

You also need to update the related binding file, for the new compatible
string.

Mark.

> 
> diff --git a/include/dt-bindings/power/rk3368-power.h b/include/dt-bindings/power/rk3368-power.h
> new file mode 100644
> index 0000000..93633d5
> --- /dev/null
> +++ b/include/dt-bindings/power/rk3368-power.h
> @@ -0,0 +1,28 @@
> +#ifndef __DT_BINDINGS_POWER_RK3368_POWER_H__
> +#define __DT_BINDINGS_POWER_RK3368_POWER_H__
> +
> +/* VD_CORE */
> +#define RK3368_PD_A53_L0	0
> +#define RK3368_PD_A53_L1	1
> +#define RK3368_PD_A53_L2	2
> +#define RK3368_PD_A53_L3	3
> +#define RK3368_PD_SCU_L		4
> +#define RK3368_PD_A53_B0	5
> +#define RK3368_PD_A53_B1	6
> +#define RK3368_PD_A53_B2	7
> +#define RK3368_PD_A53_B3	8
> +#define RK3368_PD_SCU_B		9
> +
> +/* VD_LOGIC */
> +#define RK3368_PD_BUS		10
> +#define RK3368_PD_PERI		11
> +#define RK3368_PD_VIO		12
> +#define RK3368_PD_ALIVE		13
> +#define RK3368_PD_VIDEO		14
> +#define RK3368_PD_GPU_0		15
> +#define RK3368_PD_GPU_1		16
> +
> +/* VD_PMU */
> +#define RK3368_PD_PMU		17
> +
> +#endif
> -- 
> 1.9.1
> 
> 
