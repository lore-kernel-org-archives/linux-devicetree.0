From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 1/7] ARM: imx: add timer stop flag to ARM power off state
Date: Tue, 09 Jan 2018 11:13:23 +0100
Message-ID: <1515492803.12538.29.camel@pengutronix.de>
References: <20180102164223.15230-1-stefan@agner.ch>
         <20180109092232.GA26312@b29396-OptiPlex-7040>
         <AM3PR04MB13155287E5AAAF5407AF68A6F5100@AM3PR04MB1315.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM3PR04MB13155287E5AAAF5407AF68A6F5100@AM3PR04MB1315.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, Dong Aisheng <dongas86@gmail.com>, Stefan Agner <stefan@agner.ch>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, den 09.01.2018, 09:25 +0000 schrieb Anson Huang:
> 
> Best Regards!
> Anson Huang
> 
> 
> > -----Original Message-----
> > From: Dong Aisheng [mailto:dongas86@gmail.com]
> > Sent: 2018-01-09 5:23 PM
> > To: Stefan Agner <stefan@agner.ch>
> > Cc: shawnguo@kernel.org; kernel@pengutronix.de; Fabio Estevam
> > <fabio.estevam@nxp.com>; robh+dt@kernel.org; mark.rutland@arm.com;
> > linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > linux-
> > kernel@vger.kernel.org; Anson Huang <anson.huang@nxp.com>; dl-
> > linux-imx
> > <linux-imx@nxp.com>
> > Subject: Re: [PATCH 1/7] ARM: imx: add timer stop flag to ARM power
> > off state
> > 
> > On Tue, Jan 02, 2018 at 05:42:17PM +0100, Stefan Agner wrote:
> > > When the CPU is in ARM power off state the ARM architected timers
> > > are
> > > stopped. The flag is already present in the higher power WAIT
> > > mode.
> > > 
> > > This allows to use the ARM generic timer on i.MX 6UL/6ULL SoC.
> > > Without the flag the kernel freezes when the timer enters the
> > > first
> > > time ARM power off mode.
> > > 
> > > Cc: Anson Huang <anson.huang@nxp.com>
> > > Signed-off-by: Stefan Agner <stefan@agner.ch>
> > 
> > It seems ok at my side.
> > Did you meet the real issue? If yes, how to reproduce?
> > 
> > Both mx6sx and mx6ul are using GPT which do not need that flag,
> > suppose we
> > should remove it, right?
> > Anson can help confirm it.
> 
> For UP system like i.MX6SX, we do NOT enable "cortex-a9-twd-timer",
> so local
> timer is NOT used, GPT is used instead, GPT's clock is NOT disabled
> when cpuidle,
> so I think we should remove all these Timer stop flag for 6SX
> CPUIDLE.

It's correct to set the flag even on UP systems, as the flag means the
CPU _local_ timer is stopped in this sleep mode. Also there are systems
out there which are using the TWD on UP, as it operates at a higher
frequency leading to better wakeup granularity.

Regards,
Lucas
