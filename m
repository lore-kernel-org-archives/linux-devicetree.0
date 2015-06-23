From: Peter Chen <peter.chen@freescale.com>
Subject: Re: [PATCH] usb: ci_hdrc_imx: add optional hub clock
Date: Tue, 23 Jun 2015 10:55:35 +0800
Message-ID: <20150623025534.GA15147@shlinux2>
References: <5586EC36.1070403@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5586EC36.1070403@maciej.szmigiero.name>
Sender: linux-kernel-owner@vger.kernel.org
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: USB list <linux-usb@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Markus Pargmann <mpa@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 22, 2015 at 12:54:14AM +0800, Maciej S. Szmigiero wrote:
> This patch adds ability to define optional clock of connected
> USB hub to ChipIdea i.MX usb controller driver.
> 
> This is needed for example for UDOO board.
> Previously, this board DT file used a fact that non-core registers
> of this USB controller have a separate driver (usbmisc_imx) which
> did allow defining a separate clock.
> 
> Because the non-core registers are in fact using the same clock as
> main controller this allowed to use one of such clock definitions
> to enable USB hub clock instead.
> 
> However, since commit 73dea4a912b2
> ("usb: chipidea: usbmisc_imx: delete clock information") this
> possibility no longer exists and loading USB support on this board
> results in a hard SoC lockup.
> 
> Note that this is not specific to particular USB hub chip used,
> rather than to a particular board.
> Since this is a DT-based board there is no board platform file to
> put such clock enable.
> Also, USB bus devices aren't instantiated in DT file since it is an
> enumerable bus.
> 
> NOP PHY also can't be used as clock consumer since this
> USB controller needs a true MXS phy definition, which accepts only
> one clock (different from USB controller one).
> 
> Based on a patch previously submitted by Fabio Estevam, with consent.
> 
> Signed-off-by: Maciej Szmigiero <mail@maciej.szmigiero.name>
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt
> index 38a5480..fc65f1c 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt
> @@ -5,6 +5,8 @@ Required properties:
>  - reg: Should contain registers location and length
>  - interrupts: Should contain controller interrupt
>  - fsl,usbphy: phandle of usb phy that connects to the port
> +- clocks: phandles of clocks that drive the controller and optionally
> +  an USB hub connected to it
>  
>  Recommended properies:
>  - phy_type: the type of the phy connected to the core. Should be one
> @@ -20,12 +22,14 @@ Optional properties:
>  - external-vbus-divider: enables off-chip resistor divider for Vbus
>  - maximum-speed: limit the maximum connection speed to "full-speed".
>  - tpl-support: TPL (Targeted Peripheral List) feature for targeted hosts
> +- clock-names: must be "default", "hub" if optional USB hub clock is used
>  
>  Examples:
>  usb@02184000 { /* USB OTG */
>  	compatible = "fsl,imx6q-usb", "fsl,imx27-usb";
>  	reg = <0x02184000 0x200>;
>  	interrupts = <0 43 0x04>;
> +	clocks = <&clks IMX6QDL_CLK_USBOH3>;
>  	fsl,usbphy = <&usbphy1>;
>  	fsl,usbmisc = <&usbmisc 0>;
>  	disable-over-current;
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 389f0e0..bb7f859 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -65,6 +65,7 @@ struct ci_hdrc_imx_data {
>  	struct usb_phy *phy;
>  	struct platform_device *ci_pdev;
>  	struct clk *clk;
> +	struct clk *clk_hub;
>  	struct imx_usbmisc_data *usbmisc_data;
>  	bool supports_runtime_pm;
>  	bool in_lpm;
> @@ -196,6 +197,16 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  		goto disable_device;
>  	}
>  
> +	data->clk_hub = devm_clk_get(&pdev->dev, "hub");
> +	if (!IS_ERR(data->clk_hub)) {
> +		ret = clk_prepare_enable(data->clk_hub);
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"Failed to enable clk_hub: %d\n", ret);
> +			goto disable_device;
> +		}
> +	}
> +

Hi Maciej,

As I said before, the USB HUB is just an USB peripheral, we should
not put a peripheral's clock information to controller driver, I think
hub driver should take responsibilities for it, just like other usb
pheripheral drivers, like usb modem, etc. You can talk it with Alan
Stern about it.

>  	platform_set_drvdata(pdev, data);
>  
>  	if (data->supports_runtime_pm) {
> @@ -223,6 +234,8 @@ static int ci_hdrc_imx_remove(struct platform_device *pdev)
>  		pm_runtime_disable(&pdev->dev);
>  		pm_runtime_put_noidle(&pdev->dev);
>  	}
> +	if (!IS_ERR(data->clk_hub))
> +		clk_disable_unprepare(data->clk_hub);
>  	ci_hdrc_remove_device(data->ci_pdev);
>  	clk_disable_unprepare(data->clk);
>  
> 

-- 

Best Regards,
Peter Chen
