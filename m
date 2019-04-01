From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH V5 4/4] rtc: imx-sc: add rtc alarm support
Date: Mon, 1 Apr 2019 17:26:22 +0200
Message-ID: <20190401152622.GL3430@piout.net>
References: <1552878291-22866-1-git-send-email-Anson.Huang@nxp.com>
 <1552878291-22866-4-git-send-email-Anson.Huang@nxp.com>
 <20190401131130.GE3430@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190401131130.GE3430@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On 01/04/2019 15:11:30+0200, Alexandre Belloni wrote:
> On 18/03/2019 03:10:06+0000, Anson Huang wrote:
> > Add i.MX system controller RTC alarm support, the RTC alarm
> > is implemented via SIP(silicon provider) runtime service call
> > and ARM-Trusted-Firmware will communicate with system controller
> > via MU(message unit) IPC to set RTC alarm. When RTC alarm fires,
> > system controller will generate a common MU irq event and notify
> > system controller RTC driver to handle the irq event.
> > 
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> > No function changes, just update imx_scu_irq_register_notifier() function name
> > according to SCU IRQ function name change.
> > ---
> >  drivers/rtc/rtc-imx-sc.c | 112 +++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 112 insertions(+)
> > 
> Applied, thanks.
> 

Actually, that is not the one I applied.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
