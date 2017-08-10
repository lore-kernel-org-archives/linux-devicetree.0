From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: add device tree binding for Allwinner
 XR819 SDIO Wi-Fi
Date: Thu, 10 Aug 2017 11:46:18 -0500
Message-ID: <20170810164618.wtdptpw4reqbtxwf@rob-hp-laptop>
References: <20170803010259.45971-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170803010259.45971-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Thu, Aug 03, 2017 at 09:02:59AM +0800, Icenowy Zheng wrote:
> Allwinner XR819 is a SDIO Wi-Fi chip, which has the functionality to use
> an out-of-band interrupt pin instead of SDIO in-band interrupt.
> 
> Add the device tree binding of this chip, in order to make it possible
> to add this interrupt pin to device trees.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v2:
> - Removed status property in example.
> - Added required property reg.
> 
>  .../bindings/net/wireless/allwinner,xr819.txt      | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/allwinner,xr819.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/allwinner,xr819.txt b/Documentation/devicetree/bindings/net/wireless/allwinner,xr819.txt
> new file mode 100644
> index 000000000000..4d4d0781ca35
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/allwinner,xr819.txt
> @@ -0,0 +1,38 @@
> +Allwinner XRadio wireless SDIO devices
> +
> +This node provides properties for controlling the XRadio wireless device. The
> +node is expected to be specified as a child node to the SDIO controller that
> +connects the device to the system.
> +
> +Required properties:
> +
> + - reg : The SDIO function number, see "Use of function subnodes" in
> +	../../mmc/mmc.txt.
> + - compatible : Should be "allwinner,xr819".
> +
> +Optional properties:
> + - interrupt-parent : the phandle for the interrupt controller to which the
> +	device interrupts are connected.
> + - interrupts : specifies attributes for the out-of-band interrupt (host-wake).
> +	When not specified the device will use in-band SDIO interrupts.
> +
> +Example:
> +
> +mmc1: mmc@01c10000 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc1_pins_a>;
> +	vmmc-supply = <&reg_vcc_wifi>;
> +	mmc-pwrseq = <&wifi_pwrseq>;
> +	bus-width = <4>;
> +	non-removable;
> +
> +	xr819: sdio_wifi@1 {

You missed one previous comment:

s/sdio_wifi/wifi/

With that,

Acked-by: Rob Herring <robh@kernel.org>
