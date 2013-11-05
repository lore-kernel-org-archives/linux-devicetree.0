From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v3 03/11] usb: doc: phy-mxs: update binding for adding
 anatop phandle
Date: Tue, 5 Nov 2013 10:34:06 +0800
Message-ID: <20131105023404.GF19770@S2101-09.ap.freescale.net>
References: <1383616183-10511-1-git-send-email-peter.chen@freescale.com>
 <1383616183-10511-4-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1383616183-10511-4-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: balbi@ti.com, rob.herring@calxeda.com, grant.likely@linaro.org, alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 05, 2013 at 09:49:35AM +0800, Peter Chen wrote:
> Add anatop phandle which is used to access anatop registers to
> control PHY's power and other USB operations.
> 
> Signed-off-by: Peter Chen <peter.chen@freescale.com>
> ---
>  Documentation/devicetree/bindings/usb/mxs-phy.txt |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mxs-phy.txt b/Documentation/devicetree/bindings/usb/mxs-phy.txt
> index 5835b27..e2d5211 100644
> --- a/Documentation/devicetree/bindings/usb/mxs-phy.txt
> +++ b/Documentation/devicetree/bindings/usb/mxs-phy.txt
> @@ -4,10 +4,12 @@ Required properties:
>  - compatible: Should be "fsl,imx23-usbphy"

This needs update too, as we now have another two compatible strings.

>  - reg: Should contain registers location and length
>  - interrupts: Should contain phy interrupt
> +- fsl,anatop: phandle for anatop register, it is only for mx6 SoC serial

imx6 SoC series

Shawn

>  
>  Example:
>  usbphy1: usbphy@020c9000 {
>  	compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
>  	reg = <0x020c9000 0x1000>;
>  	interrupts = <0 44 0x04>;
> +	fsl,anatop = <&anatop>;
>  };
> -- 
> 1.7.1
> 
> 

