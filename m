From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH V4 RESEND 1/3] dt-bindings: watchdog: move i.MX system
 controller watchdog binding to SCU
Date: Sat, 8 Jun 2019 06:04:52 -0700
Message-ID: <20190608130452.GA22130@roeck-us.net>
References: <20190527070317.16904-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190527070317.16904-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, wim@linux-watchdog.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com, ulf.hansson@linaro.org, peng.fan@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, May 27, 2019 at 03:03:15PM +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> i.MX system controller watchdog depends on SCU driver to support
> interrupt function, so it needs to be subnode of SCU node in DT,
> binding doc should be moved to fsl,scu.txt as well.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> No changes, just rebase the patch to top of linux-next.
> ---
>  .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 15 ++++++++++++++
>  .../bindings/watchdog/fsl-imx-sc-wdt.txt           | 24 ----------------------
>  2 files changed, 15 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> index f378922..a575e42 100644
> --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> @@ -145,6 +145,16 @@ Optional Child nodes:
>  - Data cells of ocotp:
>    Detailed bindings are described in bindings/nvmem/nvmem.txt
>  
> +Watchdog bindings based on SCU Message Protocol
> +------------------------------------------------------------
> +
> +Required properties:
> +- compatible: should be:
> +              "fsl,imx8qxp-sc-wdt"
> +              followed by "fsl,imx-sc-wdt";
> +Optional properties:
> +- timeout-sec: contains the watchdog timeout in seconds.
> +
>  Example (imx8qxp):
>  -------------
>  aliases {
> @@ -207,6 +217,11 @@ firmware {
>  		rtc: rtc {
>  			compatible = "fsl,imx8qxp-sc-rtc";
>  		};
> +
> +		watchdog {
> +			compatible = "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
> +			timeout-sec = <60>;
> +		};
>  	};
>  };
>  
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt b/Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt
> deleted file mode 100644
> index 02b87e9..0000000
> --- a/Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -* Freescale i.MX System Controller Watchdog
> -
> -i.MX system controller watchdog is for i.MX SoCs with system controller inside,
> -the watchdog is managed by system controller, users can ONLY communicate with
> -system controller from secure mode for watchdog operations, so Linux i.MX system
> -controller watchdog driver will call ARM SMC API and trap into ARM-Trusted-Firmware
> -for watchdog operations, ARM-Trusted-Firmware is running at secure EL3 mode and
> -it will request system controller to execute the watchdog operation passed from
> -Linux kernel.
> -
> -Required properties:
> -- compatible:	Should be :
> -		"fsl,imx8qxp-sc-wdt"
> -		followed by "fsl,imx-sc-wdt";
> -
> -Optional properties:
> -- timeout-sec : Contains the watchdog timeout in seconds.
> -
> -Examples:
> -
> -watchdog {
> -	compatible = "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
> -	timeout-sec = <60>;
> -};
