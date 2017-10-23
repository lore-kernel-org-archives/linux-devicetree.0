From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] phy: add combo phy driver for HiSilicon STB SoCs
Date: Mon, 23 Oct 2017 17:28:50 -0500
Message-ID: <20171023222850.ecavz6jm2mnoplea@rob-hp-laptop>
References: <1508042882-20922-1-git-send-email-shawnguo@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1508042882-20922-1-git-send-email-shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 15, 2017 at 12:48:02PM +0800, Shawn Guo wrote:
> From: Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> 
> Add combo phy driver for HiSilicon STB SoCs. This phy can be
> used as pcie-phy, sata-phy or usb-phy.
> 
> Signed-off-by: Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../bindings/phy/phy-hi3798cv200-combphy.txt       |  21 ++

Please split bindings to separate patch especially for new ones.

>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/hisilicon/Kconfig                      |   9 +
>  drivers/phy/hisilicon/Makefile                     |   1 +
>  drivers/phy/hisilicon/phy-histb-combphy.c          | 236 +++++++++++++++++++++
>  5 files changed, 268 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-hi3798cv200-combphy.txt
>  create mode 100644 drivers/phy/hisilicon/phy-histb-combphy.c
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-hi3798cv200-combphy.txt b/Documentation/devicetree/bindings/phy/phy-hi3798cv200-combphy.txt
> new file mode 100644
> index 000000000000..c7121cdcaed9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-hi3798cv200-combphy.txt
> @@ -0,0 +1,21 @@
> +HiSilicon STB PCIE/SATA/USB3 PHY
> +
> +Properties:
> +- compatible: Should be "hisilicon,hi3798cv200-combphy"
> +- #phy-cells: Should be 1.  The cell number is used to select the phy mode:
> +	0: PCIe mode
> +	1: USB 3.0 mode
> +	2: SATA mode
> +- clocks: The phandle to clock provider and clock specifier pair.
> +- resets: The phandle to reset controller and reset specifier pair.
> +- hisilicon,peripheral-syscon: The phandle to the peripheral controller.

Could just be a child of the syscon instead?

> +
> +Example:
> +
> +combphy1: phy {
> +	compatible = "hisilicon,hi3798cv200-combphy";
> +	#phy-cells = <1>;
> +	clocks = <&crg HISTB_COMBPHY1_CLK>;
> +	resets = <&crg 0x188 12>;
> +	hisilicon,peripheral-syscon = <&peri_ctrl>;
> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
