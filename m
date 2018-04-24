Return-Path: <robherring2@gmail.com>
Date: Tue, 24 Apr 2018 09:35:42 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH/RFC 02/11] dt-bindings: usb: add usb role switch driver
Message-ID: <20180424143542.xvl4oa4nt6evgtaq@rob-hp-laptop>
References: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1524039005-30618-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1524039005-30618-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: gregkh@linuxfoundation.org, mark.rutland@arm.com, frowand.list@gmail.com, heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, p.zabel@pengutronix.de, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 18, 2018 at 05:09:56PM +0900, Yoshihiro Shimoda wrote:
> This patch adds a new documentation for a usb role switch driver.
> The usb role switch framework will parse this to get each device
> pointer by using each remote-endpoint.

Bindings describe h/w, not drivers. This doesn't look like a h/w device.

> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../devicetree/bindings/usb/usb-role-switch.txt    | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-role-switch.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-role-switch.txt b/Documentation/devicetree/bindings/usb/usb-role-switch.txt
> new file mode 100644
> index 0000000..941d582
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/usb-role-switch.txt
> @@ -0,0 +1,42 @@
> +USB role switch driver
> +
> +Optional nodes:
> +- If a role switch driver has OF graph ports, the usb role switch framework
> +  will parse the remote-endpoints in usb_role_switch_register(). The OF graph
> +  port number as follows:
> +    0: USB 2.0 host port
> +    1: USB 3.0 host port
> +    2: UDC port
> +
> +For example:
> +	usb-role-sw {
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				usb2_host_sw0: endpoint {
> +					remote-endpoint = <&usb2_host_ep0>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				usb3_host_sw0: endpoint {
> +					remote-endpoint = <&usb3_host_ep0>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				udc_sw0: endpoint {
> +					remote-endpoint = <&udc_ep0>;
> +				};
> +			};
> +		};
> +	};
> -- 
> 1.9.1
> 
