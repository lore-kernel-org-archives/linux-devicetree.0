From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/5] dt-binding: Add Qualcomm WCNSS control binding
Date: Thu, 31 Mar 2016 09:28:17 -0500
Message-ID: <20160331142817.GA22092@rob-hp-laptop>
References: <1459226126-16725-1-git-send-email-bjorn.andersson@linaro.org>
 <1459226126-16725-3-git-send-email-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459226126-16725-3-git-send-email-bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 28, 2016 at 09:35:24PM -0700, Bjorn Andersson wrote:
> This binding describes the control interface for the Qualcomm WCNSS.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> 
> Got a reviewed-by from Andy and acked-by from Rob on the WiFi part of this
> binding. But during futher testing I spotted a timing issue, where the
> wcnss_ctrl driver must finish the uploading of NV to the core os of the wcnss
> before the wifi driver can initiate any communication with the wifi part
> (although available from the get-go).
> 
> The sanest way I could figure to model this is to describe the core part as
> parent of the wifi and bt pieces.
> 
>  .../devicetree/bindings/soc/qcom/qcom,wcnss.txt    | 104 +++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt
> new file mode 100644
> index 000000000000..5488904b6185
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt
> @@ -0,0 +1,104 @@
> +Qualcomm WCNSS Binding
> +
> +This binding describes the Qualcomm WCNSS hardware. It consists of control
> +block and a BT, WiFi and FM radio block, all useing SMD as command channels.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be: "qcom,wcnss",

This should be more specific.


> +- qcom,smd-channel:
> +	Usage: required
> +	Value type: <string>
> +	Definition: standard SMD property specifying the SMD channel used for
> +		    communication with the WiFi firmware
> +
> += SUBNODES
> +The subnodes of the wcnss node are optional and describe the individual blocks in
> +the WCNSS.
> +
> +== Bluetooth
> +The following properties are defined to the bluetooth node:
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be: "qcom,btqcomsmd"

This should be more specific to the chip and there's no need to have 
qcom twice.

> +
> +== WiFi
> +The following properties are defined to the WiFi node:
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be one of:
> +		    "qcom,wcn3620-wlan",
> +		    "qcom,wcn3660-wlan",
> +		    "qcom,wcn3680-wlan"
> +
> +- qcom,wcnss-mmio:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: should specify base address and size of the WiFi related
> +		    registers of WCNSS

This is an address visible to the cpu?

> +
> +- interrupts:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: should specify the "rx" and "tx" interrupts
> +
> +- interrupt-names:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: must contain "rx" and "tx"
> +
> +- qcom,state:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: should reference the tx-enable and tx-rings-empty SMEM states
> +
> +- qcom,state-names:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: must contain "tx-enable" and "tx-rings-empty"
> +
> += EXAMPLE
> +The following example represents a SMD node, with one edge representing the
> +"pronto" subsystem, with the wcnss device and its wcn3680 BT and WiFi blocks
> +described; as found on the 8974 platform.
> +
> +smd {
> +	compatible = "qcom,smd";
> +
> +	pronto {
> +		interrupts = <0 142 1>;
> +
> +		qcom,ipc = <&apcs 8 17>;
> +		qcom,smd-edge = <6>;
> +
> +		wcnss {
> +			compatible = "qcom,wcnss";
> +			qcom,smd-channels = "WCNSS_CTRL";
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			bt {
> +				compatible = "qcom,btqcomsmd";
> +			};
> +
> +			wifi {
> +				compatible = "qcom,wcn3680-wlan";
> +
> +				qcom,wcnss-mmio = <0xfb000000 0x21b000>;
> +
> +				interrupts = <0 145 0>, <0 146 0>;
> +				interrupt-names = "tx", "rx";
> +
> +				qcom,state = <&apps_smsm 10>, <&apps_smsm 9>;
> +				qcom,state-names = "tx-enable", "tx-rings-empty";
> +			};
> +		};
> +	};
> +};
> -- 
> 2.5.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
