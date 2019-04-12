From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [EXT] Re: [PATCH V7 2/4] firmware: imx: enable imx scu general
 irq function
Date: Fri, 12 Apr 2019 02:25:42 +0000
Message-ID: <AM0PR04MB4211816EDBEF23F7B330CCCB80280@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1554785675-8090-1-git-send-email-Anson.Huang@nxp.com>
 <1554785675-8090-2-git-send-email-Anson.Huang@nxp.com>
 <20190411073252.GC3050@dragon>
 <DB3PR0402MB3916B67E6DA995AB70C29799F5280@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <DB3PR0402MB3916B67E6DA995AB70C29799F5280@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson Huang <anson.huang@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> From: Anson Huang
> Sent: Friday, April 12, 2019 9:06 AM
> 
> Hello, Alexandre
> 	As i.MX SCU general irq function is picked up by Shawn, could you please
> also pick up below i.MX SC RTC alarm support patch ?
> 	https://patchwork.kernel.org/patch/10890525/
> 

No, it can't go through Alexandre's tree due to dependency issue.

Shawn,
Do you think you can pick it up? Alexandre already gave the Ack.

AFAIK there's no other SCU RTC patches since v5.1-rc1 in Alexandre's tree.

Regards
Dong Aisheng

> > On Tue, Apr 09, 2019 at 04:59:55AM +0000, Anson Huang wrote:
> > > The System Controller Firmware (SCFW) controls RTC, thermal and WDOG
> > > etc., these resources' interrupt function are managed by SCU. When
> > > any IRQ pending, SCU will notify Linux via MU general interrupt
> > > channel #3, and Linux kernel needs to call SCU APIs to get IRQ
> > > status and notify each module to handle the interrupt.
> > >
> > > Since there is no data transmission for SCU IRQ notification, so
> > > doorbell mode is used for this MU channel, and SCU driver will use
> > > notifier mechanism to broadcast to every module which registers the
> > > SCU block notifier.
> > >
> > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > > Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> >
> > Applied, thanks.
