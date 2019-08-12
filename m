From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 1/4] dt-bindings: watchdog: Add i.MX7ULP bindings
Date: Mon, 12 Aug 2019 02:03:03 +0000
Message-ID: <DB3PR0402MB39161E58AFF5681757DE1C06F5D30@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1565334842-28161-1-git-send-email-Anson.Huang@nxp.com>
 <20190809164245.GA17136@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190809164245.GA17136@roeck-us.net>
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
To: Guenter Roeck <linux@roeck-us.net>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>, "schnitzeltony@gmail.com" <schnitzeltony@gmail.com>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "otavio@ossystems.com.br" <otavio@ossystems.com.br>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "jan.tuerk@emtrion.com" <jan.tuerk@emtrion.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, linux-arm-ker
List-Id: devicetree@vger.kernel.org

Hi, Guenter

> On Fri, Aug 09, 2019 at 03:13:59PM +0800, Anson Huang wrote:
> > Add the watchdog bindings for Freescale i.MX7ULP.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> >  .../bindings/watchdog/fsl-imx7ulp-wdt.txt          | 22
> ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt
> >
> > diff --git
> > a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt
> > b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt
> > new file mode 100644
> > index 0000000..d83fc5c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt
> > @@ -0,0 +1,22 @@
> > +* Freescale i.MX7ULP Watchdog Timer (WDT) Controller
> > +
> > +Required properties:
> > +- compatible : Should be "fsl,imx7ulp-wdt"
> > +- reg : Should contain WDT registers location and length
> > +- interrupts : Should contain WDT interrupt
> > +- clocks: Should contain a phandle pointing to the gated peripheral clock.
> 
> The driver as submitted does not include clock or interrupt handling.
> Why are those properties listed as mandatory if they are not really needed
> (nor used) ?

I missed the clk part in driver, it is working ONLY because the wdog clock is enabled
unexpected, I will add it in V2, thanks for pointing out such big mistake!

Anson

> 
> > +
> > +Optional properties:
> > +- timeout-sec : Contains the watchdog timeout in seconds
> > +
> > +Examples:
> > +
> > +wdog1: wdog@403d0000 {
> > +	compatible = "fsl,imx7ulp-wdt";
> > +	reg = <0x403d0000 0x10000>;
> > +	interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> > +	clocks = <&pcc2 IMX7ULP_CLK_WDG1>;
> > +	assigned-clocks = <&pcc2 IMX7ULP_CLK_WDG1>;
> > +	assigned-clocks-parents = <&scg1 IMX7ULP_CLK_FIRC_BUS_CLK>;
> > +	timeout-sec = <40>;
> > +};
> > --
> > 2.7.4
> >
