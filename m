From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: Add binding for IT6505.
Date: Thu, 13 Jun 2019 13:59:03 -0600
Message-ID: <20190613195903.GA23650@bogus>
References: <1557307985-21228-1-git-send-email-allen.chen@ite.com.tw>
 <1557307985-21228-2-git-send-email-allen.chen@ite.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557307985-21228-2-git-send-email-allen.chen@ite.com.tw>
Sender: linux-kernel-owner@vger.kernel.org
To: allen <allen.chen@ite.com.tw>
Cc: Pi-Hsun Shih <pihsun@chromium.org>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <treding@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>, Johan Hovold <johan@kernel.org>, Nickey Yang <nickey.yang@rock-chips.com>, Michal Simek <monstr@monstr.eu>, Linus Walleij <linus.walleij@linaro.org>, Ben Whitten <ben.whitten@gmail.com>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 08, 2019 at 05:31:56PM +0800, allen wrote:
> From: Allen Chen <allen.chen@ite.com.tw>
> 
> Add a DT binding documentation for IT6505.
> 
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> 
> ---
>  .../bindings/display/bridge/ite,it6505.txt         | 30 ++++++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6505.txt
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
> +                compatible = "ite,it6505";
> +                status = "okay";
> +                interrupt-parent = <&pio>;
> +                interrupts = <152 IRQ_TYPE_EDGE_RISING 152 0>;
> +                reg = <0x5c>;
> +                pinctrl-names = "default";
> +                pinctrl-0 = <&it6505_pins>;
> +                ovdd-supply = <&mt6358_vsim1_reg>;
> +                pwr18-supply = <&it6505_pp18_reg>;
> +                reset-gpios = <&pio 179 1>;
> +                hpd-gpios = <&pio 9 0>;

HPD would be part of the connector, not this bridge chip if a GPIO is 
used.

> +                extcon = <&usbc_extcon>;

This should use the usb-connector binding if this is a Type C connector. 
Or it should have a dp-connector node connection if just a DP connector.


> +                port {
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

This file is a schema now, so you'll have to update this.

>  itead	ITEAD Intelligent Systems Co.Ltd
>  iwave  iWave Systems Technologies Pvt. Ltd.
>  jdi	Japan Display Inc.
> -- 
> 1.9.1
> 
