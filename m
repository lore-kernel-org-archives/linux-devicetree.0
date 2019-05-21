Return-Path: <SRS0=0zQd=TV=nvidia.com=jckuo@kernel.org>
Subject: Re: [Patch V3 5/8] arm64: tegra: Add xudc node for Tegra210
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-6-git-send-email-nkristam@nvidia.com>
From: JC Kuo <jckuo@nvidia.com>
Message-ID: <9a2f3c3f-1010-8390-26b4-4e2129879a2e@nvidia.com>
Date: Tue, 21 May 2019 14:08:18 +0800
MIME-Version: 1.0
In-Reply-To: <1557988772-15406-6-git-send-email-nkristam@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Nagarjuna Kristam <nkristam@nvidia.com>, balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Reviewed-by: JC Kuo <jckuo@nvidia.com>

Thanks,

JC

On 5/16/19 2:39 PM, Nagarjuna Kristam wrote:
> Tegra210 has one XUSB device mode controller, which can be operated
> HS and SS modes. Add DT support for XUSB device mode controller.
>
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> index a550c0a..edef00b 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -1184,6 +1184,25 @@
>   		status = "disabled";
>   	};
>   
> +	xudc@700d0000 {
> +		compatible = "nvidia,tegra210-xudc";
> +		reg = <0x0 0x700d0000 0x0 0x8000>,
> +			<0x0 0x700d8000 0x0 0x1000>,
> +			<0x0 0x700d9000 0x0 0x1000>;
> +		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>,
> +			<&tegra_car TEGRA210_CLK_XUSB_SS>,
> +			<&tegra_car TEGRA210_CLK_XUSB_SSP_SRC>,
> +			<&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
> +			<&tegra_car TEGRA210_CLK_XUSB_FS_SRC>;
> +		clock-names = "dev", "ss", "ss_src",
> +			      "hs_src", "fs_src";
> +		power-domains = <&pd_xusbdev>, <&pd_xusbss>;
> +		power-domain-names = "dev", "ss";
> +		nvidia,xusb-padctl = <&padctl>;
> +		status = "disabled";
> +	};
> +
>   	mipi: mipi@700e3000 {
>   		compatible = "nvidia,tegra210-mipi";
>   		reg = <0x0 0x700e3000 0x0 0x100>;
