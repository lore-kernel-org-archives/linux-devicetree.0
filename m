From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: Documentation for qcom,eud
Date: Tue, 25 Sep 2018 14:25:07 -0500
Message-ID: <20180925192507.GA19360@bogus>
References: <1536096853-30473-1-git-send-email-pheragu@codeaurora.org>
 <1536096853-30473-2-git-send-email-pheragu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1536096853-30473-2-git-send-email-pheragu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, ckadabi@codeaurora.org, tsoni@codeaurora.org, rnayak@codeaurora.org, bryanh@codeaurora.org, psodagud@codeaurora.org, Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 04, 2018 at 02:34:12PM -0700, Prakruthi Deepak Heragu wrote:
> Documentation for Embedded USB Debugger (EUD) device tree bindings.
> 
> Signed-off-by: Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
> Signed-off-by: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,msm-eud.txt  | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt
> new file mode 100644
> index 0000000..a03021a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt
> @@ -0,0 +1,41 @@
> +* Qualcomm Technologies Inc Embedded USB Debugger (EUD)
> +
> +The EUD (Embedded USB Debugger) is a mini-USB hub implemented
> +on chip to support the USB-based debug and trace capabilities.

Is it just for debug and normally bypassed? 

> +
> +Required properties:
> +
> + - compatible:  Should be "qcom,msm-eud"

Needs to be SoC specific (though a fallback is fine).

> + - interrupts:  Interrupt number
> + - reg: Should be address and size of EUD register space
> +
> +Driver notifies clients for VBUS attach/detach and charger enable/disable

Bindings are for h/w blocks, not drivers.

> +events. The link between client and EUD is established via a directed
> +graph. EUD driver has one endpoint of the graph link mentioning EUD as an
> +output link and clients registered for these notifications from the EUD
> +should have the other endpoint of the graph link as an input link. 

OF graph is for describing data flows (i.e. h/w connections), not 
clients wanting some event.

> Each of
> +these endpoints should contain a 'remote-endpoint' phandle property that
> +points to the corresponding endpoint in the port of the remote device.

You don't need to describe how the graph binding works. Just what the 
port assignments are.

I worry this is going to collide with using the graph binding for USB 
connectors.

> +
> +An example for EUD device node:
> +
> +	eud: qcom,msm-eud@88e0000 {
> +		compatible = "qcom,msm-eud";
> +		interrupts = <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH>;
> +		reg = <0x88e0000 0x4000>;
> +		port {
> +                	eud_output: endpoint {
> +                        	remote-endpoint = <&usb3_input>;
> +                        };
> +        	};
> +	};
> +
> +An example for EUD client:

What are possible clients? Could we want to switch clients at runtime?

> +
> +	usb3 {
> +		port {
> +                	usb3_input: endpoint {
> +                        	remote-endpoint = <&eud_output>;
> +                        };
> +        	};
> +	};
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
