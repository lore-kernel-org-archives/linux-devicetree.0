From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: usb: musb: Add support for MediaTek
 musb controller
Date: Thu, 3 Jan 2019 16:14:14 -0600
Message-ID: <20190103221414.GA14639@bogus>
References: <1545896066-897-1-git-send-email-min.guo@mediatek.com>
 <1545896066-897-2-git-send-email-min.guo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1545896066-897-2-git-send-email-min.guo@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: min.guo@mediatek.com
Cc: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 27, 2018 at 03:34:23PM +0800, min.guo@mediatek.com wrote:
> From: Min Guo <min.guo@mediatek.com>
> 
> This adds support for MediaTek musb controller in
> host, peripheral and otg mode
> 
> Signed-off-by: Min Guo <min.guo@mediatek.com>
> ---
>  .../devicetree/bindings/usb/mediatek,musb.txt      | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,musb.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.txt b/Documentation/devicetree/bindings/usb/mediatek,musb.txt
> new file mode 100644
> index 0000000..e899c9b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/mediatek,musb.txt
> @@ -0,0 +1,49 @@
> +MediaTek musb DRC/OTG controller
> +-------------------------------------------
> +
> +Required properties:
> + - compatible      : should be "mediatek,<soc-model>-musb",
> +   "mediatek,mtk-musb", soc-model is the name of SoC, such as
> +   mt2701, when using "mediatek,mtk-musb" compatible string, you
> +   need SoC specific ones in addition, one of:
> +   - "mediatek,mt2701-musb"

This isn't very clear. Just drop the <soc-model and enumerate the SoCs:

compatible: should be one of:
    "mediatek,mt2701-musb"
    ...
  followed by "mediatek,mtk-musb"

> + - reg             : specifies physical base address and size of
> +   the registers
> + - interrupts      : interrupt used by musb controller
> + - interrupt-names : must be "mc"

-names is pointless when there is only one.

> + - phys            : PHY specifier for the OTG phy
> + - phy-names       : should be "usb2-phy"

Same here.

> + - dr_mode         : should be one of "host", "peripheral" or "otg",
> +   refer to usb/generic.txt
> + - clocks          : a list of phandle + clock-specifier pairs, one for
> +   each entry in clock-names
> + - clock-names     : must contain "main","mcu","univpll"

space needed after each comma.

> +   for clocks of controller
> +
> +Optional properties:
> + - extcon : external connector for VBUS and IDPIN changes detection,
> +   needed when supports dual-role mode.

Don't use extcon for new bindings. The usb-connector binding should be 
used instead.

> + - vbus-supply : reference to the VBUS regulator, needed when supports
> +   dual-role mode.

The controller is powered from Vbus? Probably not. This belongs in the 
connector or maybe the phy (if the phy is powered from Vbus).

> + - power-domains   : a phandle to USB power domain node to control USB's
> +   MTCMOS
> +
> +Example:
> +
> +usb2: usb@11200000 {
> +	compatible = "mediatek,mt2701-musb";
> +		"mediatek,mtk-musb";
> +	reg = <0 0x11200000 0 0x1000>;
> +	interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
> +	interrupt-names = "mc";
> +	phys = <&u2port2 PHY_TYPE_USB2>;
> +	phy-names = "usb2-phy";
> +	vbus-supply = <&usb_vbus>;
> +	extcon = <&extcon_usb>;
> +	dr_mode = "otg";
> +	clocks = <&pericfg CLK_PERI_USB0>,
> +		 <&pericfg CLK_PERI_USB0_MCU>,
> +		 <&pericfg CLK_PERI_USB_SLV>;
> +	clock-names = "main","mcu","univpll";
> +	power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
> +};
> -- 
> 1.9.1
> 
