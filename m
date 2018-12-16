From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v5 1/6] arm64: add basic Kconfig symbols for i.MX8
Date: Sun, 16 Dec 2018 17:14:06 +0800
Message-ID: <20181216091405.GK13243@dragon>
References: <1544365552-30270-1-git-send-email-abel.vesa@nxp.com>
 <1544365552-30270-2-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544365552-30270-2-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>, Abel Vesa <abelvesa@linux.com>, dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 09, 2018 at 02:26:06PM +0000, Abel Vesa wrote:
> From: Lucas Stach <l.stach@pengutronix.de>
> 
> Add basic Kconfig symbols to make the MXC architecture available
> in the ARM64 world.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  arch/arm64/Kconfig.platforms | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 28f0521..7e1545a 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -142,6 +142,20 @@ config ARCH_MVEBU
>  	   - Armada 7K SoC Family
>  	   - Armada 8K SoC Family
>  
> +config ARCH_MXC
> +	bool "ARMv8 based NXP i.MX SoC family"
> +	help
> +	  This enables support for the ARMv8 based SoCs in the
> +	  NXP i.MX family.
> +
> +config SOC_IMX8MQ
> +	bool "i.MX8MQ support"
> +	depends on ARCH_MXC
> +	select ARM64_ERRATUM_843419
> +	select ARM64_ERRATUM_845719
> +	help
> +	  This enables support for the i.MX8MQ SoC.
> +

As we agreed in principle that option SOC_IMX8MQ should be drop from
ARM64 platform.  I updated the patch as below.

---8<-----------------

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 51bc479334a4..3e177a332b92 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -142,6 +142,14 @@ config ARCH_MVEBU
           - Armada 7K SoC Family
           - Armada 8K SoC Family
 
+config ARCH_MXC
+       bool "ARMv8 based NXP i.MX SoC family"
+       select ARM64_ERRATUM_843419
+       select ARM64_ERRATUM_845719
+       help
+         This enables support for the ARMv8 based SoCs in the
+         NXP i.MX family.
+
 config ARCH_QCOM
        bool "Qualcomm Platforms"
        select GPIOLIB
