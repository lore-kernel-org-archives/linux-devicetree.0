From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/5] arm64: allwinner: h6: add USB3 device nodes
Date: Tue, 8 May 2018 11:31:27 +0300
Message-ID: <9a25a561-b643-a77b-3287-8082780fce60@cogentembedded.com>
References: <20180507151817.55663-1-icenowy@aosc.io>
 <20180507151817.55663-5-icenowy@aosc.io>
Reply-To: sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Return-path: <linux-sunxi+bncBC6MFNV32EFRBY6AYXLQKGQEEVTIPQQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180507151817.55663-5-icenowy-h8G6r0blFSE@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello!

On 5/7/2018 6:18 PM, Icenowy Zheng wrote:

> Allwinner H6 SoC features USB3 functionality, with a DWC3 controller and
> a custom PHY.
> 
> Add device tree nodes for them.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 38 ++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> index c72da8cd9ef5..9564c938717c 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -174,6 +174,44 @@
>   			status = "disabled";
>   		};
>   
> +		usb3: usb@5200000 {

    I don't think <unit-address> is allowed for a node having no "reg" prop...

> +			compatible = "allwinner,sun50i-h6-dwc3";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			clocks = <&ccu CLK_BUS_XHCI>;
> +			clock-names = "bus";
> +			resets = <&ccu RST_BUS_XHCI>;
> +			reset-names = "bus";
> +			status = "disabled";
> +
> +			dwc3: dwc3 {

    Contrariwise, need <unit-address> here...

> +				compatible = "snps,dwc3";
> +				reg = <0x5200000 0x10000>;
> +				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +				/*
> +				 * According to Wink from Allwinner, the
> +				 * USB3 port on H6 is not capable of OTG;
> +				 * the datasheet doesn't mention OTG at all
> +				 * either, so the dr_mode is default to
> +				 * "host" here.
> +				 */
> +				dr_mode = "host";
> +				phys = <&usb3phy>;
> +				phy-names = "usb3-phy";
> +				status = "disabled";
> +			};
> +		};
[...]

MBR, Sergei
