Return-Path: <SRS0=Bvjn=QZ=gmail.com=groeck7@kernel.org>
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH V2 0/4] Add i.MX8QXP system controller watchdog support
References: <1550454997-4398-1-git-send-email-Anson.Huang@nxp.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <02ea476f-d055-ac12-d1b6-c6caffb14614@roeck-us.net>
Date: Sun, 17 Feb 2019 21:16:22 -0800
MIME-Version: 1.0
In-Reply-To: <1550454997-4398-1-git-send-email-Anson.Huang@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Andy Gross <andy.gross@linaro.org>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "arnd@arndb.de" <arnd@arndb.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "olof@lixom.net" <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On 2/17/19 6:01 PM, Anson Huang wrote:
> i.MX8QXP is an ARMv8 Cortex-A35 SoC with a Cortex-M4 system controller inside,
> the system controller manages overall power, clock, secure RTC and watchdog
> etc., so Linux kernel running on A35 needs to communicate with system
> controller for watchdog operation, this system controller watchdog will
> call SMC to trap to EL3 secure world ARM-Trusted-Firmware and then it will
> request system controller to do the watchdog operation via IPC.
> 
> 
And you expect I'll spend the time comparing this version of the patch
series against version 1 and figure out myself what exactly changed ?

Guenter

Below are the patch dependency:
> 
> The dt-binding and imx8qxp.dtsi patch are based on my thermal patch series as below:
> https://patchwork.kernel.org/patch/10800699/
> 
> Anson Huang (4):
>    dt-bindings: fsl: scu: add watchdog binding
>    watchdog: imx_sc: Add i.MX system controller watchdog support
>    arm64: defconfig: add support for i.MX system controller watchdog
>    arm64: dts: freescale: imx8qxp: add watchdog support
> 
>   .../devicetree/bindings/arm/freescale/fsl,scu.txt  |  10 +
>   arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   4 +
>   arch/arm64/configs/defconfig                       |   1 +
>   drivers/watchdog/Kconfig                           |  13 ++
>   drivers/watchdog/Makefile                          |   1 +
>   drivers/watchdog/imx_sc_wdt.c                      | 210 +++++++++++++++++++++
>   6 files changed, 239 insertions(+)
>   create mode 100644 drivers/watchdog/imx_sc_wdt.c
> 
