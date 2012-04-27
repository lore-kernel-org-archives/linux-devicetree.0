From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v3 3/4] pinctrl: pinctrl-imx: add imx6q pinctrl driver
Date: Fri, 27 Apr 2012 08:45:19 +0200
Message-ID: <20120427064519.GO17184@pengutronix.de>
References: <1335451227-27709-1-git-send-email-b29396@freescale.com>
 <1335451227-27709-3-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1335451227-27709-3-git-send-email-b29396@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <b29396@freescale.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linus.walleij@stericsson.com, swarren@wwwdotorg.org, shawn.guo@freescale.com, kernel@pengutronix.de, grant.likely@secretlab.ca, rob.herring@calxeda.com, cjb@laptop.org, b20223@freescale.com
List-Id: devicetree@vger.kernel.org

On Thu, Apr 26, 2012 at 10:40:26PM +0800, Dong Aisheng wrote:
> From: Dong Aisheng <dong.aisheng@linaro.org>
> 
> Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
> ---
> ChangeLog v1-v2:
> * add binding doc for pinctrl-imx6q
> * refactor the probe
> ---
>  .../bindings/pinctrl/fsl,imx6q-pinctrl.txt         | 1605 ++++++++++++++
>  drivers/pinctrl/Kconfig                            |    8 +
>  drivers/pinctrl/Makefile                           |    1 +
>  drivers/pinctrl/pinctrl-imx6q.c                    | 2331 ++++++++++++++++++++
>  4 files changed, 3945 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6q-pinctrl.txt
>  create mode 100644 drivers/pinctrl/pinctrl-imx6q.c
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx6q-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx6q-pinctrl.txt
> new file mode 100644
> index 0000000..13d474f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx6q-pinctrl.txt
> @@ -0,0 +1,1605 @@
> +* Freescale IMX6Q IOMUX Controller
> +
> +Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
> +and usage.
> +
> +Required properties:
> +- compatible: "fsl,imx6q-iomuxc"
> +- fsl,pins: two integers array, represents a group of pins mux and config
> +  setting. The format is fsl,pins = <PIN_FUNC_ID CONFIG>, PIN_FUNC_ID is a
> +  pin working on a specific function, CONFIG is the pad setting value like
> +  pull-up for this pin. Please refer to imx6q datasheet for the valid pad
> +  config settings.

Wouldn't it make sense to document the CONFIG bits here? Something like

Pull keeper enabled (pke)	(1 << 7)
...

Not all bits are available on all pins, refer to the datasheet...

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
