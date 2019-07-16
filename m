From: Frank Li <frank.li@nxp.com>
Subject: RE: [PATCH 1/3] perf/imx_ddr: Add MODULE_DEVICE_TABLE
Date: Tue, 16 Jul 2019 13:34:17 +0000
Message-ID: <VI1PR04MB49100BE846047F44034DB9E388CE0@VI1PR04MB4910.eurprd04.prod.outlook.com>
References: <cover.1562230183.git.leonard.crestez@nxp.com>
 <6e88abe2ed5f361469cbb8ccccd4586036fc2fa2.1562230183.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <6e88abe2ed5f361469cbb8ccccd4586036fc2fa2.1562230183.git.leonard.crestez@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Leonard Crestez <leonard.crestez@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Leonard Crestez <leonard.crestez@nxp.com>
> Sent: Thursday, July 4, 2019 3:53 AM
> To: Shawn Guo <shawnguo@kernel.org>; Will Deacon <will@kernel.org>; Frank
> Li <frank.li@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Andrey Smirnov
> <andrew.smirnov@gmail.com>; Mark Rutland <mark.rutland@arm.com>;
> Aisheng Dong <aisheng.dong@nxp.com>; Fabio Estevam
> <fabio.estevam@nxp.com>; Jacky Bai <ping.bai@nxp.com>;
> devicetree@vger.kernel.org; kernel@pengutronix.de; dl-linux-imx <linux-
> imx@nxp.com>; linux-arm-kernel@lists.infradead.org
> Subject: [PATCH 1/3] perf/imx_ddr: Add MODULE_DEVICE_TABLE
> 
> This is required for automatic probing when driver is built as a module.
> 
> Fixes: 9a66d36cc7ac ("drivers/perf: imx_ddr: Add DDR performance counter
> support to perf")
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Acked-by: Frank Li <frank.li@nxp.com>

> ---
>  drivers/perf/fsl_imx8_ddr_perf.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/perf/fsl_imx8_ddr_perf.c b/drivers/perf/fsl_imx8_ddr_perf.c
> index 63fe21600072..0e3310dbb145 100644
> --- a/drivers/perf/fsl_imx8_ddr_perf.c
> +++ b/drivers/perf/fsl_imx8_ddr_perf.c
> @@ -45,10 +45,11 @@ static DEFINE_IDA(ddr_ida);  static const struct
> of_device_id imx_ddr_pmu_dt_ids[] = {
>  	{ .compatible = "fsl,imx8-ddr-pmu",},
>  	{ .compatible = "fsl,imx8m-ddr-pmu",},
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, imx_ddr_pmu_dt_ids);
> 
>  struct ddr_pmu {
>  	struct pmu pmu;
>  	void __iomem *base;
>  	unsigned int cpu;
> --
> 2.17.1
