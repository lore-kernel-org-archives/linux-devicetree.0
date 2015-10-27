From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173 PSCI-1.0 support
Date: Tue, 27 Oct 2015 11:52:27 +0100
Message-ID: <562F576B.2050108@gmail.com>
References: <1440727919-34719-1-git-send-email-fan.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440727919-34719-1-git-send-email-fan.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: fan.chen@mediatek.com, Mark Rutland <mark.rutland@arm.com>
Cc: srv_heupstream@mediatek.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Howard Chen <howard.chen@linaro.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org



On 28/08/15 04:11, fan.chen@mediatek.com wrote:
> From: Fan Chen <fan.chen@mediatek.com>
>
> This patch adds psci comatible properties to support all mandatory
> functions of PSCI-1.0, PSCI-0.2 and PSCI-0.1, and system suspend
> can be supported in PSCI-1.0.
>
> Signed-off-by: Fan Chen <fan.chen@mediatek.com>
> ---

Applied to v4.4-next/arm64

Thanks,
Matthias

> Because PSCI-1.0 patches hadn't landed on mainline, this patch is
> based on three patch sets below:
> [0] http://www.spinics.net/lists/arm-kernel/msg425793.html
>      PSCI: system suspend support
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
>      psci/unification
> [2] http://www.spinics.net/lists/devicetree/msg82017.html
>      [PATCH 0/6] drivers: firmware: psci: add basic v1.0 support
>
> Before they are merged in, this patch still works fine with psci-0.2
> support in current mainline.
> ---
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index d18ee42..b9b4205 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -95,7 +95,7 @@
>   	};
>
>   	psci {
> -		compatible = "arm,psci";
> +		compatible = "arm,psci-1.0", "arm,psci-0.2", "arm,psci";
>   		method = "smc";
>   		cpu_suspend   = <0x84000001>;
>   		cpu_off	      = <0x84000002>;
>
