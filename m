Return-Path: <SRS0=0zQd=TV=nvidia.com=jckuo@kernel.org>
Subject: Re: [Patch V3 6/8] arm64: tegra: Enable xudc on Jetson TX1
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-7-git-send-email-nkristam@nvidia.com>
From: JC Kuo <jckuo@nvidia.com>
Message-ID: <f9ee9726-3621-83ba-d07f-4592e5d4ad10@nvidia.com>
Date: Tue, 21 May 2019 14:11:35 +0800
MIME-Version: 1.0
In-Reply-To: <1557988772-15406-7-git-send-email-nkristam@nvidia.com>
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
> Enable XUSB device mode driver for USB0 slot on Jetson TX1.
>
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> index a7dc319..e0e67cd 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> @@ -1483,6 +1483,20 @@
>   		vmmc-supply = <&vdd_3v3_sd>;
>   	};
>   
> +	xudc@700d0000 {
> +		phys = <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>;
> +		phy-names = "usb2";
> +		avddio-usb-supply = <&vdd_3v3_sys>;
> +		hvdd-usb-supply = <&vdd_1v8>;
> +		extcon = <&extcon_usb>;
> +		status = "okay";
> +	};
> +
> +	extcon_usb: extcon_vbus {
> +		compatible = "linux,extcon-usb-gpio";
> +		vbus-gpio = <&gpio TEGRA_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
> +	};
> +
>   	regulators {
>   		compatible = "simple-bus";
>   		#address-cells = <1>;
