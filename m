From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/2] arm: shmobile: r8a7790: add USB3.0 node to r8a7790.dtsi
Date: Thu, 29 May 2014 20:08:30 +0400
Message-ID: <53875B7E.5010104@cogentembedded.com>
References: <53871338.8050606@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <53871338.8050606@renesas.com>
Sender: linux-sh-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Simon Horman <horms@verge.net.au>, SH-Linux <linux-sh@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 05/29/2014 03:00 PM, Yoshihiro Shimoda wrote:

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>   arch/arm/boot/dts/r8a7790.dtsi |   10 ++++++++++
>   1 file changed, 10 insertions(+)

> diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
> index e06c486..e6b04f2 100644
> --- a/arch/arm/boot/dts/r8a7790.dtsi
> +++ b/arch/arm/boot/dts/r8a7790.dtsi
> @@ -902,4 +902,14 @@
>   		#size-cells = <0>;
>   		status = "disabled";
>   	};
> +
> +	xhci: xhci@ee000000 {

    The node name should be "usb@ee000000", according to section 2.2.2 of the 
ePAPR standard [1]:

> +		compatible = "renesas,xhci-r8a7790";
> +		reg = <0 0xee000000 0 0xc00>;
> +		interrupts = <0 101 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&mstp3_clks R8A7790_CLK_SSUSB>;
> +		phys = <&usbphy 1 1>;

    This part is dependent on the generic PHY support in the USB HCD in order 
to work.

> +		phy-names = "usb";
> +		status = "disabled";
> +	};
>   };

[1] http://www.power.org/resources/downloads/Power_ePAPR_APPROVED_v1.0.pdf

WBR, Sergei

