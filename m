From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH 1/2] dt-bindings: bcm-ns-usb2-phy: rework binding to use
 CRU syscon
Date: Mon, 7 Jan 2019 10:44:00 -0800
Message-ID: <0ff798e3-55ed-9043-2136-4431f7f4a020@broadcom.com>
References: <20190107082545.5529-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107082545.5529-1-zajec5@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, bcm-kernel-feedback-list@broadcom.com, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-Id: devicetree@vger.kernel.org



On 1/7/2019 12:25 AM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> USB 2.0 PHY is a hardware block that happens to use two registers from
> the CRU block to setup a single PLL. It's not part of the CRU or DMU
> and so its binding shouldn't cover the whole DMU.
> 
> The correct way of handling this is to reference CRU block node using a
> syscon. Document that & deprecate the old way.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../devicetree/bindings/phy/bcm-ns-usb2-phy.txt    | 27 ++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/bcm-ns-usb2-phy.txt b/Documentation/devicetree/bindings/phy/bcm-ns-usb2-phy.txt
> index a7aee9ea8926..36b634d2f0ca 100644
> --- a/Documentation/devicetree/bindings/phy/bcm-ns-usb2-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/bcm-ns-usb2-phy.txt
> @@ -2,19 +2,38 @@ Driver for Broadcom Northstar USB 2.0 PHY
>  
>  Required properties:
>  - compatible: brcm,ns-usb2-phy
> -- reg: iomem address range of DMU (Device Management Unit)
> -- reg-names: "dmu", the only needed & supported reg right now
> +- syscon-cru: phandle to the CRU (Central Resource Unit) syscon
>  - clocks: USB PHY reference clock
>  - clock-names: "phy-ref-clk", the only needed & supported clock right now
>  
> +Deprecated:
> +
> +PHY block should not claim the whole DMU so such a binding has been deprecated.
> +It only requires to access few CRU (a DMU subblock) registers and that should be
> +handled with a syscon since CRU is a MFD (Multi-Function Device).
> +
> +- reg: iomem address range of DMU (Device Management Unit)
> +- reg-names: "dmu", the only needed & supported reg right now
> +
>  To initialize USB 2.0 PHY driver needs to setup PLL correctly. To do this it
>  requires passing phandle to the USB PHY reference clock.
>  
>  Example:
> +	dmu@1800c000 {
> +		compatible = "simple-bus";
> +		ranges = <0 0x1800c000 0x1000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		cru: cru@100 {

cru: syscon@100 {

> +			compatible = "syscon", "simple-mfd";
> +			reg = <0x100 0x1a4>;
> +		};
> +	};
> +
>  	usb2-phy {
>  		compatible = "brcm,ns-usb2-phy";
> -		reg = <0x1800c000 0x1000>;
> -		reg-names = "dmu";
> +		syscon-cru = <&cru>;
>  		#phy-cells = <0>;
>  		clocks = <&genpll BCM_NSP_GENPLL_USB_PHY_REF_CLK>;
>  		clock-names = "phy-ref-clk";
> 
