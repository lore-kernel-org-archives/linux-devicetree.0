From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH V5 2/4] rtc: add i.MX system controller RTC support
Date: Fri, 21 Dec 2018 10:24:47 +0100
Message-ID: <20181221092447.GM2188@piout.net>
References: <1545295872-20169-1-git-send-email-Anson.Huang@nxp.com>
 <1545295872-20169-3-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1545295872-20169-3-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, Aisheng Dong <aisheng.dong@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, Andy Gross <andy.gross@linaro.org>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "arnd@arndb.de" <arnd@arndb.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "ezequiel@collabora.com" <ezequiel@collabora.com>, olof@l
List-Id: devicetree@vger.kernel.org

On 20/12/2018 08:56:16+0000, Anson Huang wrote:
> i.MX8QXP is an ARMv8 SoC which has a Cortex-M4 system controller
> inside, the system controller is in charge of controlling power,
> clock and secure rtc etc..
> 
> This patch adds i.MX system controller RTC driver support,
> Linux kernel has to communicate with system controller via MU
> (message unit) IPC to set/get RTC time and other alarm functions,
> since the RTC set time needs to be done in secure EL3 mode (required
> by system controller firmware) and alarm functions needs to be done
> with general MU IRQ handle, these depend on other components which
> are NOT ready, so this patch ONLY enables the RTC time read.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> ChangeLog since V4:
>     - Add dependency on IMX_SCU to avoid compile error when IMX_SCU is NOT enabled;
>     - Use dev_err instead of pr_err;
>     - Remove unneccssary different errors check in imx_scu_get_handle which is already done in API.
> ---
>  drivers/rtc/Kconfig      |  7 ++++
>  drivers/rtc/Makefile     |  1 +
>  drivers/rtc/rtc-imx-sc.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 99 insertions(+)
>  create mode 100644 drivers/rtc/rtc-imx-sc.c
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
