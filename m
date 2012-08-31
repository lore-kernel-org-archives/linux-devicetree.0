From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v4 2/7] ARM: imx6q: add iomuxc gpr support into syscon
Date: Fri, 31 Aug 2012 10:02:48 +0800
Message-ID: <20120831020247.GC7726@r65073-Latitude-D630>
References: <1346237818-9498-1-git-send-email-b29396@freescale.com>
 <1346237818-9498-3-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1346237818-9498-3-git-send-email-b29396@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <b29396@freescale.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@stericsson.com, s.hauer@pengutronix.de, kernel@pengutronix.de, grant.likely@secretlab.ca, rob.herring@calxeda.com, sameo@linux.intel.com, lrg@ti.com, broonie@opensource.wolfsonmicro.com, richard.zhao@freescale.com, devicetree-discuss@lists.ozlabs.org, swarren@wwwdotorg.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 29, 2012 at 06:56:53PM +0800, Dong Aisheng wrote:
> From: Dong Aisheng <dong.aisheng@linaro.org>
> 
> Include headfile for easy using.
> 
> Acked-by: Stephen Warren <swarren@wwwdotorg.org>
> Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
> ---
>  arch/arm/boot/dts/imx6q.dtsi         |    5 +
>  include/linux/fsl/imx6q-iomuxc-gpr.h |  319 ++++++++++++++++++++++++++++++++++

I assume that all the users of this header file are imx6q syscon
clients.  In that case, this header belongs to mfd/syscon subsystem.

I have been told by people that it was a mistake to create
include/linux/fsl.  Each header in include/linux should go to
respective subsystem sub-directory.  For this particular case,
it should be include/linux/mfd or include/linux/mfd/syscon even
better, IMO.

<snip>

> +#define IMX6Q_GPR13_SATA_PHY_1_MED		(0x1 << 0)
> +#define IMX6Q_GPR13_SATA_PHY_1_SLOW		(0x2 << 0)
> +
> +#endif /* !__LINUX_IMX6Q_IOMUXC_GPR_H */

Nit: why do we have a "!" there?

-- 
Regards,
Shawn
