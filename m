From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 1/3] clocksource/drivers/sysctr: Add an optional property
Date: Sun, 23 Jun 2019 11:31:12 +0000
Message-ID: <DB3PR0402MB3916B3B871FDEA9BFC960C67F5E10@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190621082838.12630-1-Anson.Huang@nxp.com>
 <alpine.DEB.2.21.1906231232520.32342@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <alpine.DEB.2.21.1906231232520.32342@nanos.tec.linutronix.de>
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
	Thanks for the useful comment, I will resend the patch with improvement.

Anson.

> -----Original Message-----
> From: Thomas Gleixner <tglx@linutronix.de>
> Sent: Sunday, June 23, 2019 6:47 PM
> To: Anson Huang <anson.huang@nxp.com>
> Cc: daniel.lezcano@linaro.org; robh+dt@kernel.org; mark.rutland@arm.com;
> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; l.stach@pengutronix.de; Abel Vesa
> <abel.vesa@nxp.com>; ccaione@baylibre.com; angus@akkea.ca;
> andrew.smirnov@gmail.com; agx@sigxcpu.org; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: Re: [PATCH 1/3] clocksource/drivers/sysctr: Add an optional
> property
> 
> Anson,
> 
> On Fri, 21 Jun 2019, Anson.Huang@nxp.com wrote:
> 
> > Subject : [PATCH 1/3] clocksource/drivers/sysctr: Add an optional
> > property
> 
> That subject line is not really informative. From Documentation:
> 
>      The ``summary phrase`` in the email's Subject should concisely
>      describe the patch which that email contains.
> 
> That means that it should tell which property it adds so it's immediately clear
> what this is about. Something like:
> 
>  Subject: clocksource/drivers/sysctr: Add optional clock-frequency property
> 
> Hmm?
> 
> > From: Anson Huang <Anson.Huang@nxp.com>
> >
> > This patch adds an optional property "clock-frequency" to pass
> 
> Please read Documentation/process/submitting-patches.rst and search for
> 'This patch'
> 
> > the system counter frequency value to kernel system counter driver and
> > indicate the driver to skip of_clk operations, this is to support
> > those platforms using platform driver model for clock driver.
> 
> That sentence does not parse. Please structure your changelog in the
> following order:
> 
>    1) Context or problem
> 
>    2) Detailed analysis (if applicable and necessary)
> 
>    3) Short description of the solution (the rest is obvious from the patch
>       itself).
> 
> So something like this (assumed I decoded the above correctly):
> 
>    Systems which use the system counter with the platform driver model
>    require the clock frequency to be supplied via device tree.
> 
>    This is necessary as in the platform driver model the of_clk operations
>    do not work correctly because LENGHTY EXPLANATION WHY ...
> 
>    Add the optinal clock-frequency to the device tree bindings of the NXP
>    system counter so the frequency can be handed in and the of_clk
>    operations can be skipped.
> 
> The important part is the missing LENGTHY EXPLANATION WHY. I can't fill
> that in because you did not provide that information.
> 
> Thanks,
> 
> 	tglx
