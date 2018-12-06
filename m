From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 0/9] Improvements for i.MX7D PICO SoM and its baseboards
Date: Thu, 6 Dec 2018 09:40:01 +0800
Message-ID: <20181206013959.GV3987@dragon>
References: <20181202212520.16650-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181202212520.16650-1-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: linux-arm-kernel@lists.infradead.org, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 02, 2018 at 07:25:11PM -0200, Otavio Salvador wrote:
> This patchset rework the imx7d-pico SoM, its Pi baseboard
> and add the Hobbit baseboard support as well.
> 
> 
> Fabio Estevam (8):
>   ARM: dts: imx7d-pico: Do not harcode the memory size
>   ARM: dts: imx7d-pico: Switch to SPDX identifier
>   ARM: dts: imx7d-pico-pi: Move SoM related part to imx7d-pico.dtsi

The applying fails on this patch.  Please rebase the series on imx/dt
branch.

Shawn

>   ARM: dts: imx7d-pico: Pass the USBOTG1_PWR pinctrl
>   ARM: dts: imx7d-pico: Pass the Ethernet PHY reset GPIO
>   ARM: dts: imx7d-pico: Extend peripherals support
>   ARM: dts: imx7d-pico-pi: Extend peripherals support
>   ARM: dts: imx7d-pico: Add the imx7d-pico-hobbit variant
> 
> Otavio Salvador (1):
>   ARM: dts: imx7d-pico: Improve WiFi regulator name
> 
>  arch/arm/boot/dts/Makefile              |   1 +
>  arch/arm/boot/dts/imx7d-pico-hobbit.dts | 105 +++++++
>  arch/arm/boot/dts/imx7d-pico-pi.dts     | 180 +++---------
>  arch/arm/boot/dts/imx7d-pico.dtsi       | 355 ++++++++++++++++++++----
>  4 files changed, 457 insertions(+), 184 deletions(-)
>  create mode 100644 arch/arm/boot/dts/imx7d-pico-hobbit.dts
> 
> -- 
> 2.19.2
> 
