From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] ARM: dts: berlin: add PPI cpu mask to twd timer
 interrupts
Date: Wed, 07 Jan 2015 15:39:18 +0100
Message-ID: <54AD4516.7050608@gmail.com>
References: <1419584281-4811-1-git-send-email-jszhang@marvell.com> <1419584281-4811-3-git-send-email-jszhang@marvell.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419584281-4811-3-git-send-email-jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 26.12.2014 09:58, Jisheng Zhang wrote:
> According to the gic binding document, "bits[15:8] PPI interrupt cpu
> mask.  Each bit corresponds to each of the 8 possible cpus attached to
> the GIC.  A bit set to '1' indicated the interrupt is wired to that
> CPU." This patch wants to add the PPI cpu mask for completeness.
>
> Signed-off-by: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>

Applied to berlin/dt.

Thanks!

> ---
>   arch/arm/boot/dts/berlin2.dtsi   | 2 +-
>   arch/arm/boot/dts/berlin2cd.dtsi | 2 +-
>   arch/arm/boot/dts/berlin2q.dtsi  | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/berlin2.dtsi b/arch/arm/boot/dts/berlin2.dtsi
> index 015a06c..63d00a6 100644
> --- a/arch/arm/boot/dts/berlin2.dtsi
> +++ b/arch/arm/boot/dts/berlin2.dtsi
> @@ -104,7 +104,7 @@
>   		local-timer@ad0600 {
>   			compatible = "arm,cortex-a9-twd-timer";
>   			reg = <0xad0600 0x20>;
> -			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
>   			clocks = <&chip CLKID_TWD>;
>   		};
>
> diff --git a/arch/arm/boot/dts/berlin2cd.dtsi b/arch/arm/boot/dts/berlin2cd.dtsi
> index a318bc3..81b670a 100644
> --- a/arch/arm/boot/dts/berlin2cd.dtsi
> +++ b/arch/arm/boot/dts/berlin2cd.dtsi
> @@ -76,7 +76,7 @@
>   		local-timer@ad0600 {
>   			compatible = "arm,cortex-a9-twd-timer";
>   			reg = <0xad0600 0x20>;
> -			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
>   			clocks = <&chip CLKID_TWD>;
>   		};
>
> diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
> index 933dcbb..41a683f 100644
> --- a/arch/arm/boot/dts/berlin2q.dtsi
> +++ b/arch/arm/boot/dts/berlin2q.dtsi
> @@ -112,7 +112,7 @@
>   			compatible = "arm,cortex-a9-twd-timer";
>   			reg = <0xad0600 0x20>;
>   			clocks = <&chip CLKID_TWD>;
> -			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>   		};
>
>   		gic: interrupt-controller@ad1000 {
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
