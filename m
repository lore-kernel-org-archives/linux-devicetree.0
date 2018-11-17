From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: Documentation for qcom,eud
Date: Sat, 17 Nov 2018 08:47:05 -0600
Message-ID: <20181117144705.GA18155@bogus>
References: <1542310374-18474-1-git-send-email-pheragu@codeaurora.org>
 <1542310374-18474-2-git-send-email-pheragu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542310374-18474-2-git-send-email-pheragu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, ckadabi@codeaurora.org, tsoni@codeaurora.org, bryanh@codeaurora.org, psodagud@codeaurora.org, rnayak@codeaurora.org, Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 15, 2018 at 11:32:53AM -0800, Prakruthi Deepak Heragu wrote:
> Documentation for Embedded USB Debugger (EUD) device tree bindings.

I asked questions on v2 which were never answered.

> 
> Signed-off-by: Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
> Signed-off-by: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,msm-eud.txt  | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt
> new file mode 100644
> index 0000000..6d339e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt
> @@ -0,0 +1,43 @@
> +* Qualcomm Technologies Inc Embedded USB Debugger (EUD)
> +
> +The EUD (Embedded USB Debugger) is a mini-USB hub implemented
> +on chip to support the USB-based debug and trace capabilities.
> +
> +Required properties:
> +
> + - compatible:  Should be "qcom,msm-eud"
> + - interrupts:  Interrupt number
> + - reg: Should be address and size of EUD register space
> +
> +EUD notifies clients for VBUS attach/detach and charger enable/disable
> +events. The link between client and EUD is established via a directed
> +graph. EUD has one endpoint of the graph link mentioning EUD as an
> +output link and clients of EUD should have the other endpoint of the
> +graph link as an input link.
> +
> +An example for EUD device node:
> +
> +	eud: qcom,msm-eud@88e0000 {
> +		compatible = "qcom,msm-eud";
> +		interrupts = <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH>;
> +		reg = <0x88e0000 0x4000>;
> +		usb_con: connector {
> +                compatible = "usb-c-connector";
> +                label = "USB-C";
> +                port {
> +                	    eud_usb_output: endpoint {
> +                        	    remote-endpoint = <&eud_usb3_input>;
> +                        };
> +        	    };
> +        };
> +	};
> +
> +An example for EUD client:
> +
> +	usb3 {
> +		port {
> +                eud_usb3_input: endpoint {
> +                        remote-endpoint = <&eud_usb_output>;
> +                };
> +        };
> +	};
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
