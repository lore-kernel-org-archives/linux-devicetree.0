From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 10/13] ARM: dts: berlin: add BG2Q nodes for USB support
Date: Tue, 18 Nov 2014 20:36:49 +0100
Message-ID: <546B9FD1.6040801@gmail.com>
References: <1416231347-27193-1-git-send-email-antoine.tenart@free-electrons.com> <1416231347-27193-11-git-send-email-antoine.tenart@free-electrons.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416231347-27193-11-git-send-email-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 17.11.2014 14:35, Antoine Tenart wrote:
> Adds nodes describing the Marvell Berlin BG2Q USB PHY and USB. The BG2Q
> SoC has 3 USB host controller, compatible with ChipIdea.
>
> Signed-off-by: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Applied to berlin/dt with the whitespace removed that Sergei pointed
out.

Thanks!

> ---
>   arch/arm/boot/dts/berlin2q.dtsi | 55 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 55 insertions(+)
>
> diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
> index 2de8d6f8973c..834142bdfbb1 100644
> --- a/arch/arm/boot/dts/berlin2q.dtsi
> +++ b/arch/arm/boot/dts/berlin2q.dtsi
> @@ -114,6 +114,40 @@
>   			#interrupt-cells = <3>;
>   		};
>
> +		usb_phy2: phy@a2f400 {
> +			compatible = "marvell,berlin2-usb-phy";
> +			reg = <0xa2f400 0x128>;
> +			#phy-cells = <0>;
> +			resets = <&chip 0x104 14>;
> +			status = "disabled";
> +		};
> +
> +		usb2: usb@a30000 {
> +			compatible = "chipidea,usb2";
> +			reg = <0xa30000 0x10000>;
> +			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&chip CLKID_USB2>;
> +			phys = <&usb_phy2>;
> +			phy-names = "usb-phy";
> +			status = "disabled";
> +		};
> +
> +		usb_phy0: phy@b74000 {
> +			compatible = "marvell,berlin2-usb-phy";
> +			reg = <0xb74000 0x128>;
> +			#phy-cells = <0>;
> +			resets = <&chip 0x104 12>;
> +			status = "disabled";
> +		};
> +
> +		usb_phy1: phy@b78000 {
> +			compatible = "marvell,berlin2-usb-phy";
> +			reg = <0xb78000 0x128>;
> +			#phy-cells = <0>;
> +			resets = <&chip 0x104 13>;
> +			status = "disabled";
> +		};
> +
>   		eth0: ethernet@b90000 {
>   			compatible = "marvell,pxa168-eth";
>   			reg = <0xb90000 0x10000>;
> @@ -365,6 +399,26 @@
>   			};
>   		};
>
> +		usb0: usb@ed0000 {
> +			compatible = "chipidea,usb2";
> +			reg = <0xed0000 0x10000>;
> +			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&chip CLKID_USB0>;
> +			phys = <&usb_phy0>;
> +			phy-names = "usb-phy";
> +			status = "disabled";
> +		};
> +
> +		usb1: usb@ee0000 {
> +			compatible = "chipidea,usb2";
> +			reg = <0xee0000 0x10000>;
> +			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&chip CLKID_USB1>;
> +			phys = <&usb_phy1>;
> +			phy-names = "usb-phy";
> +			status = "disabled";
> +		};
> +
>   		apb@fc0000 {
>   			compatible = "simple-bus";
>   			#address-cells = <1>;
> @@ -457,5 +511,6 @@
>   				interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
>   			};
>   		};
> +
>   	};
>   };
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
