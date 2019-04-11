From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V7 2/4] firmware: imx: enable imx scu general irq function
Date: Thu, 11 Apr 2019 15:32:53 +0800
Message-ID: <20190411073252.GC3050@dragon>
References: <1554785675-8090-1-git-send-email-Anson.Huang@nxp.com>
 <1554785675-8090-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554785675-8090-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "sboyd@kernel.org" <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>"linux-rtc@vger.kernel.org" <linux>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 09, 2019 at 04:59:55AM +0000, Anson Huang wrote:
> The System Controller Firmware (SCFW) controls RTC, thermal
> and WDOG etc., these resources' interrupt function are managed
> by SCU. When any IRQ pending, SCU will notify Linux via MU general
> interrupt channel #3, and Linux kernel needs to call SCU APIs
> to get IRQ status and notify each module to handle the interrupt.
> 
> Since there is no data transmission for SCU IRQ notification, so
> doorbell mode is used for this MU channel, and SCU driver will
> use notifier mechanism to broadcast to every module which registers
> the SCU block notifier.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>

Applied, thanks.
