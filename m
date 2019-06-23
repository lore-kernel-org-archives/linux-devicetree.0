From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V2 2/3] clocksource: imx-sysctr: Add of_clk skip option
Date: Sun, 23 Jun 2019 12:24:15 +0000
Message-ID: <DB3PR0402MB3916EF5948655AE1373E0AF9F5E10@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190623120434.19556-1-Anson.Huang@nxp.com>
 <20190623120434.19556-2-Anson.Huang@nxp.com>
 <alpine.DEB.2.21.1906231413110.32342@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <alpine.DEB.2.21.1906231413110.32342@nanos.tec.linutronix.de>
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
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "angus@akkea.ca" <angus@akkea.ca>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi, Thomas

> On Sun, 23 Jun 2019, Anson.Huang@nxp.com wrote:
> 
> Again the short summary could be more informative. Instead of 'Add foo'
> you could say:
> 
>     .....: Make timer work with platform driver model
> 
> That sums up the real meat of the patch. 'Add some option' is pretty
> uninformative.

Makes sense.

> 
> > On some i.MX8M platforms, clock driver uses platform driver model and
> > it is NOT ready during timer initialization phase, the clock
> > operations will fail and system counter driver will fail too. As all
> > the i.MX8M platforms' system counter clock are from OSC which is
> > always enabled, so it is no need to enable clock for system counter
> > driver, the ONLY thing is to pass clock frequence to driver.
> >
> > This patch adds an option of skipping of_clk operation for system
> > counter driver, an optional property "clock-frequency"
> > is introduced to pass the frequency value to system counter driver and
> > indicate driver to skip of_clk operations.
> 
> The comments to the changelog of patch 1 apply here as well :)
> 
> Hint: 'This patch'

Oops...did NOT notice that, I will resend the V2 patch series as they are actually
similar issues.

Thanks,
Anson

> 
> Thanks,
> 
> 	tglx
> 
