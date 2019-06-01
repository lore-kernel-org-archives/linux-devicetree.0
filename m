From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH V7 4/4] rtc: imx-sc: add rtc alarm support
Date: Sat, 1 Jun 2019 23:18:16 +0200
Message-ID: <20190601211816.GF3558@piout.net>
References: <1554785675-8090-1-git-send-email-Anson.Huang@nxp.com>
 <1554785675-8090-4-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554785675-8090-4-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "sboyd@kernel.org" <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 09/04/2019 05:00:07+0000, Anson Huang wrote:
> Add i.MX system controller RTC alarm support, the RTC alarm
> is implemented via SIP(silicon provider) runtime service call
> and ARM-Trusted-Firmware will communicate with system controller
> via MU(message unit) IPC to set RTC alarm. When RTC alarm fires,
> system controller will generate a common MU irq event and notify
> system controller RTC driver to handle the irq event.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> Changes since V6:
> 	- add comments to .read_alarm callback function to explain why it is an empty function;
> 	- improve irq notify callback function name.
> --
>  drivers/rtc/rtc-imx-sc.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
