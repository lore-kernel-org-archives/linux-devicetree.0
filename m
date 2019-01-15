From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH shawn/for-next v4 2/2] ARM: dts: imx: Add Y Soft IOTA
 Draco,  Hydra and Ursa boards
Date: Tue, 15 Jan 2019 14:12:15 -0600
Message-ID: <20190115201215.GA32682@bogus>
References: <1547562139-64730-1-git-send-email-michal.vokac@ysoft.com>
 <1547562139-64730-2-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547562139-64730-2-git-send-email-michal.vokac@ysoft.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, =?utf-8?B?Vm9rw6HEjQ==?= Michal <Michal.Vokac@ysoft.com>
List-Id: devicetree@vger.kernel.org

On Tue, 15 Jan 2019 14:22:45 +0000, =?utf-8?B?Vm9rw6HEjSBNaWNoYWw=?= wrote:
> These are i.MX6S/DL based SBCs embedded in various Y Soft products.
> All share the same board design but have slightly different HW
> configuration.
> 
> Ursa
> - i.MX6S SoC, 512MB RAM DDR3, 4GB eMMC, microSD
> - parallel WVGA 7" LCD with touch panel
> - 1x Eth (QCA8334 switch)
> - USB OTG
> - USB host (micro-B)
> 
> Draco
> - i.MX6S SoC, 512MB RAM DDR3, 4GB eMMC, microSD
> - parallel WVGA 7" LCD with touch panel
> - 2x Eth (QCA8334 switch)
> - USB OTG
> - USB host (micro-B)
> - RGB LED (I2C LP5562)
> - 3.5mm audio jack + codec (LM49350)
> 
> Hydra
> - i.MX6DL SoC, 2GB RAM DDR3, 4GB eMMC, microSD
> - I2C OLED display, capacitive matrix keys
> - 2x Eth (QCA8334 switch)
> - USB OTG
> - RGB LED (I2C LP5562)
> - 3.5mm audio jack + codec (LM49350)
> - HDMI
> - miniPCIe slot
> 
> Cc: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> ---
> Changes since v3:
>  - Do not abbreviate regulator word in node names. (Shawn)
>  - Sort fixed regulator nodes alphabetically.
>  - Sort pmic regulator childe nodes alphabetically.
>  - Use newline between properties and child node in switch node. (Shawn)
>  - Sort i2c bus child nodes in order of unit-address. (Shawn)
>  - Rename PWM pinctl label to be consistent with node name. (Shawn)
> 
> Changes since v2:
>  - Remove cpus {/delete-node/ cpu@1;}; node from i.MX6Solo based board. (Fabio)
>  - Use "device_type = "memory";" in memory nodes. (Fabio)
>  - Use GPIO_ACTIVE_LOW for fec phy-reset-gpios. (Fabio)
>  - Use "-" in node names. (Rob)
>  - Remove label from led-controller node. (Rob)
>  
> Changes since v1:
>  - Enable HDMI on Hydra board.
>  - Move regulators to the root node and remove simple-bus property. (Rob)
>  - Remove reg and unit-address property from regulators. (Rob)
>  - Use correct names for led-controller and pmic node. (Rob)
>  - Use wakeup-source instead of deprecated enable-sdio-wakeup. (Shawn)
> 
>  arch/arm/boot/dts/Makefile                 |   3 +
>  arch/arm/boot/dts/imx6dl-yapp4-common.dtsi | 595 +++++++++++++++++++++++++++++
>  arch/arm/boot/dts/imx6dl-yapp4-draco.dts   |  58 +++
>  arch/arm/boot/dts/imx6dl-yapp4-hydra.dts   |  50 +++
>  arch/arm/boot/dts/imx6dl-yapp4-ursa.dts    |  54 +++
>  5 files changed, 760 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
>  create mode 100644 arch/arm/boot/dts/imx6dl-yapp4-draco.dts
>  create mode 100644 arch/arm/boot/dts/imx6dl-yapp4-hydra.dts
>  create mode 100644 arch/arm/boot/dts/imx6dl-yapp4-ursa.dts
> 

Reviewed-by: Rob Herring <robh@kernel.org>
