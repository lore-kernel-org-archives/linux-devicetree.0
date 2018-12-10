From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/6] arm64: add basic DTS for i.MX8MQ
Date: Mon, 10 Dec 2018 16:18:26 -0600
Message-ID: <20181210221826.GA21311@bogus>
References: <1544365552-30270-1-git-send-email-abel.vesa@nxp.com>
 <1544365552-30270-3-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544365552-30270-3-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Lucas Stach <l.stach@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Abel Vesa <abelvesa@linux.com>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

On Sun, 9 Dec 2018 14:26:07 +0000, Abel Vesa wrote:
> From: Lucas Stach <l.stach@pengutronix.de>
> 
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
> as there is nothing waking them up anymore.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Dong Aisheng <Aisheng.dong@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.txt  |   4 +
>  arch/arm64/boot/dts/freescale/imx8mq-pinfunc.h | 623 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi      | 392 ++++++++++++++++
>  3 files changed, 1019 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mq.dtsi
> 

Reviewed-by: Rob Herring <robh@kernel.org>
