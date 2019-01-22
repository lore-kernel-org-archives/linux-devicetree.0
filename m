From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH RESEND v1 2/4] dt-bindings: fsl: scu: add imx8qm scu clock
 support
Date: Tue, 22 Jan 2019 12:58:38 +0000
Message-ID: <AM0PR04MB421124D0E6031D97E6693E9680980@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com>
 <1547207400-28307-3-git-send-email-aisheng.dong@nxp.com>
 <20190121232730.GA22676@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190121232730.GA22676@bogus>
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
To: Rob Herring <robh@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> >  Required properties:
> >  - compatible:		Should be one of:
> > -			  "fsl,imx8qxp-clock"
> > +			  "fsl,imx8qm-clock",
> > +			  "fsl,imx8qxp-clock".
> 
> No need for the punctuation here. The whole point of one per line is to have 1
> line changes. Otherwise,
> 

Got it, thanks.
I will update it later.

> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> >  			followed by "fsl,scu-clk"
> >  - #clock-cells:		Should be 1. Contains the Clock ID value.
> >  - clocks:		List of clock specifiers, must contain an entry for
> > --
> > 2.7.4
> >
