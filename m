From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V7 3/4] arm64: dts: freescale: imx8qxp: enable scu
 general irq channel
Date: Thu, 11 Apr 2019 15:34:21 +0800
Message-ID: <20190411073420.GD3050@dragon>
References: <1554785675-8090-1-git-send-email-Anson.Huang@nxp.com>
 <1554785675-8090-3-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554785675-8090-3-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "sboyd@kernel.org" <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>"linux-rtc@vger.kernel.org" <linux>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 09, 2019 at 05:00:01AM +0000, Anson Huang wrote:
> On i.MX8QXP, SCU uses MU1 general interrupt channel #3 to notify
> user for IRQs of RTC alarm, thermal alarm and WDOG etc., mailbox
> RX doorbell mode is used for this function, this patch adds
> support for it.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>

Prefix 'arm64: dts: imx8qxp:' would be good enough, and no need for
'freescale' in there.

I fixed it up and applied the patch.

Shawn
