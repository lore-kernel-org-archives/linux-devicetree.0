From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] ARM64: dts: mt6795: enable basic SMP bringup for MT6795
Date: Wed, 05 Aug 2015 19:24:56 +0200
Message-ID: <3934554.inAhhRLsAY@ubix>
References: <1438656457-60278-1-git-send-email-scott.shu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438656457-60278-1-git-send-email-scott.shu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Scott Shu <scott.shu@mediatek.com>
Cc: Mars Cheng <mars.cheng@mediatek.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, loda.chou@mediatek.com, jades.shih@mediatek.com, scott.shu@gmail.com
List-Id: devicetree@vger.kernel.org

On Tuesday, August 04, 2015 10:47:37 AM Scott Shu wrote:
> This patch adds support SMP on MediaTek MT6795 Cortex-A53 Octa-core SoC.

applied to v4.2-next/arm64-2

> 
> The patch is based on v4.2-rc1 and following patch series:
> (1) Mars Cheng's "Add mt6795 basic chip support" [1]
> 
> [1] https://lkml.org/lkml/2015/7/14/63

Please this extra information below the "---" as this should not show up in 
the commit message.

Thanks,
Matthias

> 
> Signed-off-by: Scott Shu <scott.shu@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt6795.dtsi |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> b/arch/arm64/boot/dts/mediatek/mt6795.dtsi index da200e7..c85659d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -20,6 +20,11 @@
>  	#address-cells = <2>;
>  	#size-cells = <2>;
> 
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "smc";
> +	};
> +
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> @@ -27,48 +32,56 @@
>  		cpu0: cpu@0 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a53";
> +			enable-method = "psci";
>  			reg = <0x000>;
>  		};
> 
>  		cpu1: cpu@1 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a53";
> +			enable-method = "psci";
>  			reg = <0x001>;
>  		};
> 
>  		cpu2: cpu@2 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a53";
> +			enable-method = "psci";
>  			reg = <0x002>;
>  		};
> 
>  		cpu3: cpu@3 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a53";
> +			enable-method = "psci";
>  			reg = <0x003>;
>  		};
> 
>  		cpu4: cpu@100 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a53";
> +			enable-method = "psci";
>  			reg = <0x100>;
>  		};
> 
>  		cpu5: cpu@101 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a53";
> +			enable-method = "psci";
>  			reg = <0x101>;
>  		};
> 
>  		cpu6: cpu@102 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a53";
> +			enable-method = "psci";
>  			reg = <0x102>;
>  		};
> 
>  		cpu7: cpu@103 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a53";
> +			enable-method = "psci";
>  			reg = <0x103>;
>  		};
>  	};
