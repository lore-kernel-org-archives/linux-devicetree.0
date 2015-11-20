From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] Documentation: usb: dwc3: qcom: Add TCSR mux usage
Date: Fri, 20 Nov 2015 08:33:51 -0600
Message-ID: <20151120143351.GA9240@rob-hp-laptop>
References: <1448008509-8913-1-git-send-email-agross@codeaurora.org>
 <1448008509-8913-5-git-send-email-agross@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1448008509-8913-5-git-send-email-agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 20, 2015 at 02:35:09AM -0600, Andy Gross wrote:
> This patch adds documentation for the optional syscon-tcsr property in the
> Qualcomm DWC3 node.  The syscon-tcsr specifies the register and bit used to
> configure the TCSR USB phy mux register.
> 
> Signed-off-by: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> index ca164e7..dfa222d 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> @@ -8,6 +8,10 @@ Required properties:
>    "core"		Master/Core clock, have to be >= 125 MHz for SS
>  				operation and >= 60MHz for HS operation
>  
> +Optional properties:
> +- syscon-tcsr	Specifies TCSR handle, register offset, and bit position for
> +			configuring the phy mux setting.
> +
>  Optional clocks:
>    "iface"		System bus AXI clock.  Not present on all platforms
>    "sleep"		Sleep clock, used when USB3 core goes into low
> @@ -22,6 +26,11 @@ Documentation/devicetree/bindings/phy/qcom,dwc3-usb-phy.txt
>  
>  Example device nodes:
>  
> +		tcsr: syscon@1a400000 {
> +			compatible = "qcom,tcsr-ipq8064", "syscon";
> +			reg = <0x1a400000 0x100>;
> +		};
> +
>  		hs_phy: phy@100f8800 {
>  			compatible = "qcom,dwc3-hs-usb-phy";
>  			reg = <0x100f8800 0x30>;
> @@ -51,6 +60,8 @@ Example device nodes:
>  
>  			ranges;
>  
> +			syscon-tcsr = <&tcsr 0xb0 0x1>;
> +
>  			status = "ok";
>  
>  			dwc3@10000000 {
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> hosted by The Linux Foundation
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
