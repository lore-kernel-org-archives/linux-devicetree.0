From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 12/13] ARM: dts: berlin: add BG2CD nodes for USB support
Date: Tue, 18 Nov 2014 20:38:02 +0100
Message-ID: <546BA01A.6050707@gmail.com>
References: <1416231347-27193-1-git-send-email-antoine.tenart@free-electrons.com> <1416231347-27193-13-git-send-email-antoine.tenart@free-electrons.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416231347-27193-13-git-send-email-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 17.11.2014 14:35, Antoine Tenart wrote:
> From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Adds nodes describing the Marvell Berlin BG2CD USB PHY and USB. The BG2CD
> SoC has 2 USB ChipIdea controllers, with usb0 host-only and usb1 dual-role
> capable.
>
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Applied to berlin/dt with usb-phy nodes reordered correctly (ethernet
nodes came in between in the meantime).

Thanks!

> ---
>   arch/arm/boot/dts/berlin2cd.dtsi | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>
> diff --git a/arch/arm/boot/dts/berlin2cd.dtsi b/arch/arm/boot/dts/berlin2cd.dtsi
> index 68f7032b4686..af5e628547ce 100644
> --- a/arch/arm/boot/dts/berlin2cd.dtsi
> +++ b/arch/arm/boot/dts/berlin2cd.dtsi
> @@ -66,6 +66,22 @@
>   			clocks = <&chip CLKID_TWD>;
>   		};
>
> +		usb_phy0: usb-phy@b74000 {
> +			compatible = "marvell,berlin2cd-usb-phy";
> +			reg = <0xb74000 0x128>;
> +			#phy-cells = <0>;
> +			resets = <&chip 0x178 23>;
> +			status = "disabled";
> +		};
> +
> +		usb_phy1: usb-phy@b78000 {
> +			compatible = "marvell,berlin2cd-usb-phy";
> +			reg = <0xb78000 0x128>;
> +			#phy-cells = <0>;
> +			resets = <&chip 0x178 24>;
> +			status = "disabled";
> +		};
> +
>   		apb@e80000 {
>   			compatible = "simple-bus";
>   			#address-cells = <1>;
> @@ -242,6 +258,26 @@
>   			};
>   		};
>
> +		usb0: usb@ed0000 {
> +			compatible = "chipidea,usb2";
> +			reg = <0xed0000 0x200>;
> +			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&chip CLKID_USB0>;
> +			phys = <&usb_phy0>;
> +			phy-names = "usb-phy";
> +			status = "disabled";
> +		};
> +
> +		usb1: usb@ee0000 {
> +			compatible = "chipidea,usb2";
> +			reg = <0xee0000 0x200>;
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
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
