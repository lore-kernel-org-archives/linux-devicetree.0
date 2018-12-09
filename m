From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 0/9] Improvements for i.MX7D PICO SoM and its
 baseboards
Date: Sun, 9 Dec 2018 21:09:25 +0800
Message-ID: <20181209130923.GF22960@dragon>
References: <20181206100905.15053-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181206100905.15053-1-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: linux-arm-kernel@lists.infradead.org, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 06, 2018 at 08:08:56AM -0200, Otavio Salvador wrote:
> This patchset rework the imx7d-pico SoM, its Pi baseboard
> and add the Hobbit baseboard support as well.
> 
> Changes in v2:
> - replace fsl,uart-has-rtscts with uart-has-rtscts
> 
> Fabio Estevam (8):
>   ARM: dts: imx7d-pico: Do not harcode the memory size
>   ARM: dts: imx7d-pico: Switch to SPDX identifier
>   ARM: dts: imx7d-pico-pi: Move SoM related part to imx7d-pico.dtsi
>   ARM: dts: imx7d-pico: Pass the USBOTG1_PWR pinctrl
>   ARM: dts: imx7d-pico: Pass the Ethernet PHY reset GPIO
>   ARM: dts: imx7d-pico: Extend peripherals support
>   ARM: dts: imx7d-pico-pi: Extend peripherals support
>   ARM: dts: imx7d-pico: Add the imx7d-pico-hobbit variant
> 
> Otavio Salvador (1):
>   ARM: dts: imx7d-pico: Improve WiFi regulator name

Applied all, thanks.
