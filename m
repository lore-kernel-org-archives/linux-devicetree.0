From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1] arm64: dts: ls1012a: Add FRWY-LS1012A board support
Date: Tue, 25 Sep 2018 22:56:40 +0800
Message-ID: <20180925145637.GC21282@dragon>
References: <20180904102345.1264-1-pramod.kumar_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180904102345.1264-1-pramod.kumar_1@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pramod Kumar <pramod.kumar_1@nxp.com>, Li Yang <leoyang.li@nxp.com>
Cc: devicetree@vger.kernel.org, Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Please copy Li Yang <leoyang.li@nxp.com> who has been added to
MAINTAINERS as co-maintainer for LayerScape platform.

On Tue, Sep 04, 2018 at 03:53:45PM +0530, Pramod Kumar wrote:
> From: Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>
> 
> FRWY-LS1012A is a different design from LS1012A-FRDM,

LS1012A-FRWY is more consistent?

> but has some common SoC features. Key feature on this
> board is Micro SD, USB 3.0, DDR, UART.
> 
> Signed-off-by: Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>
> Signed-off-by: Pramod Kumar <pramod.kumar_1@nxp.com>
> ---
>  changes in v1:
>  1. fix license identifier
>  2. remove pcie node
> 
>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>  .../boot/dts/freescale/fsl-ls1012a-frwy.dts   | 26 +++++++++++++++++++
>  2 files changed, 27 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 86e18adb695a..d1161442ff2f 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-frwy.dtb

In alphabetic order, it should go after fsl-ls1012a-frdm.dtb.

>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-frdm.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-qds.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-rdb.dtb
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts
> new file mode 100644
> index 000000000000..e75a8dc0dda5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Device Tree file for Freescale LS1012A FRWY Board.
> + *
> + * Copyright 2018 NXP
> + *
> + * Pramod Kumar <pramod.kumar_1@nxp.com>
> + *
> + */
> +/dts-v1/;
> +
> +#include "fsl-ls1012a.dtsi"
> +
> +/ {
> +	model = "LS1012A FRWY Board";
> +	compatible = "fsl,frwy-ls1012a", "fsl,ls1012a";

I think fsl,<soc>-xxx is the idiomatic approach we define a compatible.
Also the board compatible should be documented.

> +

Unneeded newline.

Shawn

> +};
> +
> +&duart0 {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +};
> -- 
> 2.17.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
