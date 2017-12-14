From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] arm64: dts: Remove leading 0x and 0s from bindings
 notation
Date: Thu, 14 Dec 2017 19:03:46 +0100
Message-ID: <98a7dc30-e736-eaf8-204f-2ac2b3ea79b9@gmail.com>
References: <20171214165352.27902-1-malat@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20171214165352.27902-1-malat@debian.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mathieu Malaterre <malat@debian.org>, Rob Herring <robh+dt@kernel.org>
Cc: Wei Xu <xuwei5@hisilicon.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 12/14/2017 05:53 PM, Mathieu Malaterre wrote:
[...]
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 26396ef53bde..0446b122a6e2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -249,7 +249,7 @@
>  			reg = <0 0x10005000 0 0x1000>;
>  		};
>  
> -		pio: pinctrl@0x10005000 {
> +		pio: pinctrl@10005000 {
>  			compatible = "mediatek,mt8173-pinctrl";
>  			reg = <0 0x1000b000 0 0x1000>;
>  			mediatek,pctl-regmap = <&syscfg_pctl_a>;

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
