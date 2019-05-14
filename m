From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/6] dt-bindings: usb: add binding for Type-B GPIO
 connector driver
Date: Tue, 14 May 2019 13:12:04 -0500
Message-ID: <20190514181204.GA13949@bogus>
References: <1557823643-8616-1-git-send-email-chunfeng.yun@mediatek.com>
 <1557823643-8616-3-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557823643-8616-3-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 14, 2019 at 04:47:19PM +0800, Chunfeng Yun wrote:
> It's used to support dual role switch via GPIO when use Type-B
> receptacle, typically the USB ID pin is connected to an input
> GPIO pin
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v5 changes:
>  1. treat type-B connector as child device of USB controller's, but not
>     as a separate virtual device, suggested by Rob
>  2. put connector's port node under connector node, suggested by Rob
> 
> v4 no changes
> 
> v3 changes:
>  1. treat type-B connector as a virtual device, but not child device of
>     USB controller's
> 
> v2 changes:
>   1. new patch to make binding clear suggested by Hans
> ---
>  .../bindings/usb/typeb-conn-gpio.txt          | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt b/Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt
> new file mode 100644
> index 000000000000..20dd3499a348
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt
> @@ -0,0 +1,42 @@
> +USB Type-B GPIO Connector
> +
> +This is used to switch dual role mode from the USB ID pin connected to
> +an input GPIO pin.
> +
> +Required properties:
> +- compatible : should include "linux,typeb-conn-gpio" and "usb-b-connector".

I don't think we need "linux,typeb-conn-gpio". A driver can decide to 
handle GPIO lines if they present or we assume the parent device handles 
ID and/or Vbus if they are not present.

> +- id-gpios, vbus-gpios : either one of them must be present, and both
> +	can be present as well.

Please clarify that vbus-gpios is an input to sense Vbus presence as an 
output it should be modelled as a regulator only.

These should be added to usb-connector.txt.

The result of all this is you don't need this file. Just additions to 
usb-connector.txt.

> +- vbus-supply : can be present if needed when supports dual role mode or
> +	host mode.
> +	see connector/usb-connector.txt
> +
> +Sub-nodes:
> +- port : should be present.
> +	see graph.txt
> +
> +Example:
> +
> +&mtu3 {
> +	status = "okay";

Don't show status in examples.

> +
> +	connector {
> +		compatible = "linux,typeb-conn-gpio", "usb-b-connector";
> +		label = "micro-USB";
> +		type = "micro";
> +		id-gpios = <&pio 12 GPIO_ACTIVE_HIGH>;
> +		vbus-supply = <&usb_p0_vbus>;
> +
> +		port {
> +			bconn_ep: endpoint@0 {
> +				remote-endpoint = <&usb_role_sw>;
> +			};
> +		};
> +	};
> +
> +	port {
> +		usb_role_sw: endpoint@0 {
> +			remote-endpoint = <&bconn_ep>;
> +		};
> +	};

When the host controller is the parent of the connector, you don't need 
the graph unless you're describing the alternate modes in Type-C.

> +};
> -- 
> 2.21.0
> 
