From: Frank Li <frank.li@nxp.com>
Subject: RE: [PATCH 3/3] arm64: defconfig: Build imx8 ddr pmu as module
Date: Tue, 16 Jul 2019 13:35:40 +0000
Message-ID: <VI1PR04MB4910CFB4D94CF4AE23A7F38A88CE0@VI1PR04MB4910.eurprd04.prod.outlook.com>
References: <cover.1562230183.git.leonard.crestez@nxp.com>
 <e51a2f95044f0a9003c3be2e82c3c4b2653670a7.1562230183.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e51a2f95044f0a9003c3be2e82c3c4b2653670a7.1562230183.git.leonard.crestez@nxp.com>
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
> Subject: [PATCH 3/3] arm64: defconfig: Build imx8 ddr pmu as module
> 
> This is available on all imx8 but is not "boot critical" in any way so build as a
> module.
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Acked-by: Frank Li <frank.li@nxp.com>

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 812fe887477d..134a4067846f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -766,10 +766,11 @@ CONFIG_PHY_ROCKCHIP_INNO_USB2=y
> CONFIG_PHY_ROCKCHIP_PCIE=m  CONFIG_PHY_ROCKCHIP_TYPEC=y
> CONFIG_PHY_UNIPHIER_USB2=y  CONFIG_PHY_UNIPHIER_USB3=y
> CONFIG_PHY_TEGRA_XUSB=y
> +CONFIG_FSL_IMX8_DDR_PMU=m
>  CONFIG_HISI_PMU=y
>  CONFIG_QCOM_L2_PMU=y
>  CONFIG_QCOM_L3_PMU=y
>  CONFIG_NVMEM_SUNXI_SID=y
>  CONFIG_NVMEM_IMX_OCOTP=y
> --
> 2.17.1
