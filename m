From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [Patch v2 10/14] usb: doc: phy-mxs: update binding for adding
 disconnect line property
Date: Wed, 23 Oct 2013 14:31:56 +0800
Message-ID: <20131023063154.GG2839@S2101-09.ap.freescale.net>
References: <1382421528-17897-1-git-send-email-peter.chen@freescale.com>
 <1382421528-17897-11-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1382421528-17897-11-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: balbi@ti.com, rob.herring@calxeda.com, grant.likely@linaro.org, alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 22, 2013 at 01:58:44PM +0800, Peter Chen wrote:
> This property is used to disconnect line between USB PHY and
> USB controller.
> 
> Signed-off-by: Peter Chen <peter.chen@freescale.com>
> ---
>  Documentation/devicetree/bindings/usb/mxs-phy.txt |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mxs-phy.txt b/Documentation/devicetree/bindings/usb/mxs-phy.txt
> index 5837963..356c9b6 100644
> --- a/Documentation/devicetree/bindings/usb/mxs-phy.txt
> +++ b/Documentation/devicetree/bindings/usb/mxs-phy.txt
> @@ -9,6 +9,9 @@ mxs PHY verions.
>  - reg: Should contain registers location and length
>  - interrupts: Should contain phy interrupt
>  - fsl,anatop: phandle for anatop register, it is only for mx6 SoC serial
> +- disconnect-line-without-vbus: needs to disconnect
> +connection between USB PHY and controller, it can avoid
> +unexpected wakeup interrupt when the PHY is out of power

If it's a mxs-phy specific property, we may need to have vendor prefix
'fsl,' for it.

I see you set the property in imx6qdl.dtsi.  Is it true that we should
always set it for imx6q/dl?  If yes, why cannot we have the driver to
force it for imx6q type of phy.  If no, where do we need to set it and
where not?

Shawn

>  
>  Example:
>  usbphy1: usbphy@020c9000 {
> @@ -16,4 +19,5 @@ usbphy1: usbphy@020c9000 {
>  	reg = <0x020c9000 0x1000>;
>  	interrupts = <0 44 0x04>;
>  	fsl,anatop = <&anatop>;
> +	disconnect-line-without-vbus;
>  };
> -- 
> 1.7.1
> 
> 

