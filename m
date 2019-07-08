From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 1/6] dt-bindings: usb: musb: Add support for MediaTek
 musb controller
Date: Mon, 8 Jul 2019 16:30:35 -0600
Message-ID: <20190708223035.GA7005@bogus>
References: <1559648359-6569-1-git-send-email-min.guo@mediatek.com>
 <1559648359-6569-2-git-send-email-min.guo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559648359-6569-2-git-send-email-min.guo@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: min.guo@mediatek.com
Cc: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, tony@atomide.com, hdegoede@redhat.com
List-Id: devicetree@vger.kernel.org

On Tue, Jun 04, 2019 at 07:39:14PM +0800, min.guo@mediatek.com wrote:
> From: Min Guo <min.guo@mediatek.com>
> 
> This adds support for MediaTek musb controller in
> host, peripheral and otg mode.
> 
> Signed-off-by: Min Guo <min.guo@mediatek.com>
> ---
> changes in v6:
> 1. Modify usb connector child node
> 
> changes in v5:
> suggested by Rob:
> 1. Modify compatible as 
> - compatible : should be one of:
>                "mediatek,mt-2701"

No, should be: mediatek,mt2701-musb

>                ...
>                followed by "mediatek,mtk-musb"
> 2. Add usb connector child node
> 
> changes in v4:
> suggested by Sergei:
> 1. String alignment
> 
> changes in v3:
> 1. no changes
> 
> changes in v2:
> suggested by Bin:
> 1. Modify DRC to DRD
> suggested by Rob:
> 2. Drop the "<soc-model>-musb" in compatible
> 3. Remove phy-names
> 4. Add space after comma in clock-names
> ---
>  .../devicetree/bindings/usb/mediatek,musb.txt      | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,musb.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.txt b/Documentation/devicetree/bindings/usb/mediatek,musb.txt
> new file mode 100644
> index 0000000..7434299
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/mediatek,musb.txt
> @@ -0,0 +1,55 @@
> +MediaTek musb DRD/OTG controller
> +-------------------------------------------
> +
> +Required properties:
> + - compatible      : should be one of:
> +                     "mediatek,mt-2701"
> +                     ...
> +                     followed by "mediatek,mtk-musb"
> + - reg             : specifies physical base address and size of
> +                     the registers
> + - interrupts      : interrupt used by musb controller
> + - interrupt-names : must be "mc"
> + - phys            : PHY specifier for the OTG phy
> + - dr_mode         : should be one of "host", "peripheral" or "otg",
> +                     refer to usb/generic.txt
> + - clocks          : a list of phandle + clock-specifier pairs, one for
> +                     each entry in clock-names
> + - clock-names     : must contain "main", "mcu", "univpll"
> +                     for clocks of controller
> +
> +Optional properties:
> + - power-domains   : a phandle to USB power domain node to control USB's
> +                     MTCMOS
> +
> +Required child nodes:
> + usb connector node as defined in bindings/connector/usb-connector.txt
> +Optional properties:
> + - id-gpios        : input GPIO for USB ID pin.
> + - vbus-gpios      : input GPIO for USB VBUS pin.
> + - vbus-supply     : reference to the VBUS regulator, needed when supports
> +                     dual-role mode
> +
> +Example:
> +
> +usb2: usb@11200000 {
> +	compatible = "mediatek,mt2701-musb",
> +		     "mediatek,mtk-musb";
> +	reg = <0 0x11200000 0 0x1000>;
> +	interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
> +	interrupt-names = "mc";
> +	phys = <&u2port2 PHY_TYPE_USB2>;
> +	dr_mode = "otg";
> +	clocks = <&pericfg CLK_PERI_USB0>,
> +		 <&pericfg CLK_PERI_USB0_MCU>,
> +		 <&pericfg CLK_PERI_USB_SLV>;
> +	clock-names = "main","mcu","univpll";
> +	power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
> +	connector{
> +		compatible = "linux,typeb-conn-gpio", "usb-b-connector";

linux,typeb-conn-gpio is not an accepted compatible string.

> +		label = "micro-USB";
> +		type = "micro";
> +		id-gpios = <&pio 44 GPIO_ACTIVE_HIGH>;
> +		vbus-supply = <&usb_vbus>;
> +	};
> +};
> -- 
> 1.9.1
> 
