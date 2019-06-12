From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: imx: Add pinctrl binding doc for i.MX8MN
Date: Wed, 12 Jun 2019 14:05:29 +0800
Message-ID: <20190612060522.GB11086@dragon>
References: <20190530030546.9224-1-Anson.Huang@nxp.com>
 <CACRpkdY-35o378Ka+4bgeSPjmq6P8DM872sgTxq2X3dDP9XZHQ@mail.gmail.com>
 <AM0PR04MB421171336B9206D02FF6514080ED0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <AM0PR04MB421171336B9206D02FF6514080ED0@AM0PR04MB4211.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Aisheng Dong <aisheng.dong@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>, Stefan Agner <stefan@agner.ch>, Bjorn Andersson <bjorn.andersson@linaro.org>, Leonard Crestez <leonard.crestez@nxp.com>, Fabio Estevam <festevam@gmail.com>, Anson Huang <anson.huang@nxp.com>, Olof Johansson <olof@lixom.net>, Jagan Teki <jagan@amarulasolutions.com>, dl-linux-imx <linux-imx@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinh
List-Id: devicetree@vger.kernel.org

On Tue, Jun 11, 2019 at 10:00:36AM +0000, Aisheng Dong wrote:
> > From: Linus Walleij [mailto:linus.walleij@linaro.org]
> > Sent: Saturday, June 8, 2019 5:04 AM
> > 
> > On Thu, May 30, 2019 at 5:04 AM <Anson.Huang@nxp.com> wrote:
> > 
> > > From: Anson Huang <Anson.Huang@nxp.com>
> > >
> > > Add binding doc for i.MX8MN pinctrl driver.
> > >
> > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > 
> > Looks mostly OK to me, but I'd like the maintainers to review, so Dong et al
> > please look at this!
> > 
> > > +Required properties:
> > > +- compatible: "fsl,imx8mn-iomuxc"
> > 
> > So should this not be "nxp,imx8mn-iomuxc"
> > or "nxp,freescale-imx8mn-iomuxc" or something these days? The vendor name
> > is nxp is it not.
> > 
> > I was complaining to the DT maintainers at one point that these companies
> > seem to buy each other left and right so this vendor nomenclature is dubious,
> > but I guess at least it should reflect the vendor that produced the chip or
> > something.
> > 
> > If everyone is happy with "fsl,*" I will not complain though.
> > (i.e. if the maintainers ACK it.)
> 
> We preferred to keep "fsl,*" for Freescale i.MX product line according to last discussion.
> And we already did this way for most i.MX devices.

+1

We do not see serious problem with 'fsl' prefix, so would rather stay
with it.

Shawn
