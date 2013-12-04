From: Peter Chen <peter.chen@freescale.com>
Subject: Re: [PATCH 1/4] usb: chipidea: msm: Add device tree binding
 information
Date: Wed, 4 Dec 2013 13:40:04 +0800
Message-ID: <20131204054003.GB29552@shlinux1.ap.freescale.net>
References: <1384176937-1658-1-git-send-email-iivanov@mm-sol.com>
 <1384176937-1658-2-git-send-email-iivanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1384176937-1658-2-git-send-email-iivanov@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: alexander.shishkin@linux.intel.com, gregkh@linuxfoundation.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, davidb@codeaurora.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 11, 2013 at 03:35:34PM +0200, Ivan T. Ivanov wrote:
> From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
> 

Please add something in commit log

> Signed-off-by: Ivan T. Ivanov <iivanov@mm-sol.com>
> Cc: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/usb/msm-hsusb.txt          |   16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/msm-hsusb.txt b/Documentation/devicetree/bindings/usb/msm-hsusb.txt
> index 5ea26c6..0a85eba 100644
> --- a/Documentation/devicetree/bindings/usb/msm-hsusb.txt
> +++ b/Documentation/devicetree/bindings/usb/msm-hsusb.txt
> @@ -15,3 +15,19 @@ Example EHCI controller device node:
>  		usb-phy = <&usb_otg>;
>  	};
>  
> +CI13xxx (Chipidea) USB controllers
> +

We have already renamed ci13xxx to ci_hdrc.

> +Required properties:
> +- compatible: 	should contain "qcom,ci-hdrc"
> +- reg: 			offset and length of the register set in the memory map
> +- interrupts: 	interrupt-specifier for the controller interrupt.
> +- usb-phy:		phandle for the PHY device
> +- dr_mode: 		Sould be "peripheral"
> +

Please keep alignment for "reg"

Peter

> +	gadget@f9a55000 {
> +		compatible = "qcom,ci-hdrc";
> +		reg = <0xf9a55000 0x400>;
> +		dr_mode = "peripheral";
> +		interrupts = <0 134 0>;
> +		usb-phy = <&usb_otg>;
> +	};
> \ No newline at end of file
> -- 
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 

Best Regards,
Peter Chen
