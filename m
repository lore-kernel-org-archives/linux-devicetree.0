From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add binding for IT6505.
Date: Tue, 3 Sep 2019 18:48:44 +0100
Message-ID: <20190903174844.GA4044@bogus>
References: <1567507915-9844-1-git-send-email-allen.chen@ite.com.tw>
 <1567507915-9844-2-git-send-email-allen.chen@ite.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1567507915-9844-2-git-send-email-allen.chen@ite.com.tw>
Sender: linux-kernel-owner@vger.kernel.org
To: allen <allen.chen@ite.com.tw>
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, CK Hu <ck.hu@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 03, 2019 at 06:51:53PM +0800, allen wrote:
> From: Allen Chen <allen.chen@ite.com.tw>
> 
> Add a DT binding documentation for IT6505.
> 
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> 
> ---
> Comments in v1 would be addressed later in v3.
> ---
>  .../bindings/display/bridge/ite,it6505.txt         | 30 ++++++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6505.txt

This won't apply. Base your patches on current (latest -rc) kernels.

We've moved to a DT schema format. Minimally vendor-prefixes.txt will 
have to change. It's also preferred for display bridges.

> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.txt b/Documentation/devicetree/bindings/display/bridge/ite,it6505.txt
> new file mode 100644
> index 0000000..c3506ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.txt
> @@ -0,0 +1,30 @@
> +iTE it6505 DP bridge bindings
> +
> +Required properties:
> +        - compatible: "ite,it6505"
> +        - reg: i2c address of the bridge
> +        - ovdd-supply: I/O voltage
> +        - pwr18-supply: Core voltage
> +        - interrupts: interrupt specifier of INT pin
> +        - reset-gpios: gpio specifier of RESET pin
> +
> +Example:
> +	it6505dptx: it6505dptx@5c {

dp-bridge@5c

> +                compatible = "ite,it6505";
> +                status = "okay";

Don't show status in examples.

> +                interrupt-parent = <&pio>;

And interrupt-parent.

> +                interrupts = <152 IRQ_TYPE_EDGE_RISING 152 0>;
> +                reg = <0x5c>;
> +                pinctrl-names = "default";
> +                pinctrl-0 = <&it6505_pins>;
> +                ovdd-supply = <&mt6358_vsim1_reg>;
> +                pwr18-supply = <&it6505_pp18_reg>;
> +                reset-gpios = <&pio 179 1>;
> +                hpd-gpios = <&pio 9 0>;

This goes in a connector node.

> +                extcon = <&usbc_extcon>;

extcon is deprecated. Drop or use the usb-connector binding.

Plus this is not documented above.

> +                port {

Need to list what each port is. You're going to need an output port too 
for a dp-connector or usb-c connector.

> +                        it6505_in: endpoint {
> +                                remote-endpoint = <&dpi_out>;
> +                        };
> +                };
> +        };
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 2c3fc51..c088646 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -184,6 +184,7 @@ iom	Iomega Corporation
>  isee	ISEE 2007 S.L.
>  isil	Intersil
>  issi	Integrated Silicon Solutions Inc.
> +ite	iTE Tech. Inc.
>  itead	ITEAD Intelligent Systems Co.Ltd
>  iwave  iWave Systems Technologies Pvt. Ltd.
>  jdi	Japan Display Inc.
> -- 
> 1.9.1
> 
