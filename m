From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v6 4/4] ARM: imx6ul: add "fsl,imx6ul-snvs-lpgpr" node
Date: Tue, 20 Jun 2017 08:33:18 +0200
Message-ID: <254a7dc7-f532-97ac-6e76-8649b7ad2f37@i2se.com>
References: <20170620044059.16113-1-o.rempel@pengutronix.de>
 <20170620044059.16113-5-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170620044059.16113-5-o.rempel@pengutronix.de>
Content-Language: de-DE
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Oleksij Rempel <o.rempel@pengutronix.de>, devicetree@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Guy Shapiro <guy.shapiro@mobi-wize.com>
List-Id: devicetree@vger.kernel.org

Am 20.06.2017 um 06:40 schrieb Oleksij Rempel:
> snvs_lpgpr confirmed to work with imx6ul as well.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Tested-by: Guy Shapiro <guy.shapiro@mobi-wize.com>
> ---
>  Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt | 3 ++-
>  arch/arm/boot/dts/imx6ul.dtsi                          | 4 ++++
>  drivers/nvmem/snvs_lpgpr.c                             | 1 +
>  3 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt b/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
> index 21910fb3159f..d2a811f92d7f 100644
> --- a/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
> +++ b/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
> @@ -5,8 +5,9 @@ This DT node should be represented as a sub-node of a "syscon",
>  "simple-mfd" node.
>  
>  Required properties:
> -- compatible: should be:
> +- compatible: should be one of fallowing variants:

of the following

>  	"fsl,imx6q-snvs-lpgpr" for Freescale i.MX6Q/D/DL/S
> +	"fsl,imx6ul-snvs-lpgpr" for Freescale i.MX6UL

Please fold this change into patch #1. This makes review and merging easier.

>  
>  Example:
>  snvs: snvs@020cc000 {
> diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
> index b9d7d2d09402..df870abc28f5 100644
> --- a/arch/arm/boot/dts/imx6ul.dtsi
> +++ b/arch/arm/boot/dts/imx6ul.dtsi
> @@ -624,6 +624,10 @@
>  					linux,keycode = <KEY_POWER>;
>  					wakeup-source;
>  				};
> +
> +				snvs_lpgpr: snvs-lpgpr {
> +					compatible = "fsl,imx6ul-snvs-lpgpr";
> +				};

AFAIK the imx6ull.dtsi also includes the imx6ul.dtsi. Does this
compatible driver also fit for imx6ull?

If yes, please extend the devicetree binding in patch #1.
If no, this change would have unwanted side effects.

Regards
Stefan

>  			};
>  
>  			epit1: epit@020d0000 {
> diff --git a/drivers/nvmem/snvs_lpgpr.c b/drivers/nvmem/snvs_lpgpr.c
> index eb3369363e44..2b20a12918d8 100644
> --- a/drivers/nvmem/snvs_lpgpr.c
> +++ b/drivers/nvmem/snvs_lpgpr.c
> @@ -136,6 +136,7 @@ static int snvs_lpgpr_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id snvs_lpgpr_dt_ids[] = {
>  	{ .compatible = "fsl,imx6q-snvs-lpgpr", .data = &snvs_lpgpr_cfg_imx6q },
> +	{ .compatible = "fsl,imx6ul-snvs-lpgpr", .data = &snvs_lpgpr_cfg_imx6q },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, snvs_lpgpr_dt_ids);
