From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] arm64: add basic DTS for i.MX8MQ
Date: Mon, 5 Feb 2018 00:09:19 -0600
Message-ID: <20180205060919.g7slfswr25od3pja@rob-hp-laptop>
References: <20180201183126.32384-1-l.stach@pengutronix.de>
 <20180201183126.32384-2-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180201183126.32384-2-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, "A . s . Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 01, 2018 at 07:31:24PM +0100, Lucas Stach wrote:
> This adds the basic DTS for the i.MX8MQ.
> For now only the following peripherals are supported:
> - IOMUXC (pin controller)
> - CCM (clock controller)
> - GPIO
> - UART
> - uSDHC (SD/eMMC controller)
> - FEC (ethernet controller)
> - i2c
> 
> This is enough to get a very basic board support up and running.
> 
> One known limitation is that the driver for the GPC interrupt
> controller is still missing, rendering the CPU sleep states unusable
> as there is nothing waking them up anymore. This will be fixed in
> due course.
> 
> Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
> v2:
>  - move to freescale folder
>  - change compatibles to "fsl" vendor prefix
>  - remove unnecessary newlines
>  - move status property to be the last in all node
>  - remove imx21 compatibles from UART nodes
>  - document compatible
> ---
>  Documentation/devicetree/bindings/arm/fsl.txt  |   4 +
>  arch/arm64/boot/dts/freescale/imx8mq-pinfunc.h | 623 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi      | 411 ++++++++++++++++
>  3 files changed, 1038 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mq.dtsi

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
