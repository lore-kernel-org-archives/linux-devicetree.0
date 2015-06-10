From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] devicetree: xilinx: zynqmp: add sata node
Date: Wed, 10 Jun 2015 14:32:15 +0200
Message-ID: <55782E4F.6020708@xilinx.com>
References: <1433931416-6661-1-git-send-email-suneel.garapati@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433931416-6661-1-git-send-email-suneel.garapati-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suneel Garapati <suneel.garapati-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/10/2015 12:16 PM, Suneel Garapati wrote:
> add sata node with sata fixed clock nodes in dtsi file.
> enable sata in zynqmp-ep108.dts with broken-gen2.
> 
> Signed-off-by: Suneel Garapati <suneel.garapati-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> Note -
> Driver and bindings are added via libata/for-4.2 tree
> bindings is found in Documentation/devicetree/bindings/ata/ahci-ceva.txt
> ---
>  arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts |  5 +++++
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi      | 15 +++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
> index 0a3f40e..981e594 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
> @@ -42,6 +42,11 @@
> 	};
>  };
> 
> +&sata {
> +	status = "okay";
> +	ceva,broken-gen2;
> +};
> +
>  &uart0 {
> 	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> index 11e0b00..e7545ed 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -272,6 +272,21 @@
> 			#size-cells = <0>;
> 		};
> 
> +		sata_clk: sata_clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <75000000>;
> +		};
> +
> +		sata0: ahci@fd0c0000 {
> +			compatible = "ceva,ahci-1v84";
> +			status = "disabled";
> +			reg = <0x0 0xfd0c0000 0x2000>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <0 133 4>;
> +			clocks = <&sata_clk>;
> +		};
> +
> 		sdhci0: sdhci@ff160000 {
> 			compatible = "arasan,sdhci-8.9a";
> 			status = "disabled";
> --
> 2.1.2
> 

Reviewed-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Thanks,
Michal


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
