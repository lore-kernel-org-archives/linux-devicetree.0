From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [v3 PATCH 2/6] dt-bindings: usb: add binding for Type-B GPIO
 connector driver
Date: Fri, 19 Apr 2019 16:43:30 +0800
Message-ID: <1555663410.10179.205.camel@mhfsdcap03>
References: <1554257354-7440-1-git-send-email-chunfeng.yun@mediatek.com>
 <1554257354-7440-3-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1554257354-7440-3-git-send-email-chunfeng.yun@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Badhri Jagan Sridharan <badhri@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Min Guo <min.guo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Gentle ping, could you please comment on this patch?

Thanks a lot

On Wed, 2019-04-03 at 10:09 +0800, Chunfeng Yun wrote:
> It's used to support dual role switch via GPIO when use Type-B
> receptacle, typically the USB ID pin is connected to an input
> GPIO pin
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3 changes:
>  1. treat type-B connector as a virtual device, but not child device of
>     USB controller's
> 
> v2 changes:
>   1. new patch to make binding clear suggested by Hans
> ---
>  .../bindings/usb/typeb-conn-gpio.txt          | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt b/Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt
> new file mode 100644
> index 000000000000..d2e1c4e01b6d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt
> @@ -0,0 +1,49 @@
> +USB Type-B GPIO Connector
> +
> +This is a virtual device used to switch dual role mode from the USB ID pin
> +connected to an input GPIO pin.
> +
> +Required properties:
> +- compatible : Should be "linux,typeb-conn-gpio"
> +
> +Sub-nodes:
> +- connector : should be present.
> +	- compatible : should be "usb-b-connector".
> +	- id-gpios, vbus-gpios : either one of them must be present,
> +		and both can be present as well.
> +	- vbus-supply : can be present if needed when supports dual role mode.
> +	see connector/usb-connector.txt
> +
> +- port : should be present.
> +	see graph.txt
> +
> +Example:
> +
> +rsw_iddig: role_sw_iddig {
> +	compatible = "linux,typeb-conn-gpio";
> +	status = "okay";
> +
> +	connector {
> +		compatible = "usb-b-connector";
> +		label = "micro-USB";
> +		type = "micro";
> +		id-gpios = <&pio 12 GPIO_ACTIVE_HIGH>;
> +		vbus-supply = <&usb_p0_vbus>;
> +	};
> +
> +	port {
> +		bconn_ep: endpoint@0 {
> +			remote-endpoint = <&usb_role_sw>;
> +		};
> +	};
> +};
> +
> +&mtu3 {
> +	status = "okay";
> +
> +	port {
> +		usb_role_sw: endpoint@0 {
> +			remote-endpoint = <&bconn_ep>;
> +		};
> +	};
> +};
