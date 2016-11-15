From: Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH 2/3] devicetree: bindings: nvmem: Add compatible string
 for imx6ul
Date: Tue, 15 Nov 2016 07:25:01 +0000
Message-ID: <AM3PR04MB53067E1D93D062C8357920587BF0@AM3PR04MB530.eurprd04.prod.outlook.com>
References: <1478497281-5477-1-git-send-email-ping.bai@nxp.com>
 <1478497281-5477-2-git-send-email-ping.bai@nxp.com>
 <20161114161423.fs7dlt5firmj4q3s@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161114161423.fs7dlt5firmj4q3s@rob-hp-laptop>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> > Add new compatible string for i.MX6UL SOC.
> >
> > Signed-off-by: Bai Ping <ping.bai@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/nvmem/imx-ocotp.txt | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> > b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> > index 383d588..a7ff65d 100644
> > --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> > +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> > @@ -1,13 +1,14 @@
> >  Freescale i.MX6 On-Chip OTP Controller (OCOTP) device tree bindings
> >
> >  This binding represents the on-chip eFuse OTP controller found on
> > -i.MX6Q/D, i.MX6DL/S, i.MX6SL, and i.MX6SX SoCs.
> > +i.MX6Q/D, i.MX6DL/S, i.MX6SL, i.MX6SX and i.MX6UL SoCs.
> >
> >  Required properties:
> >  - compatible: should be one of
> >  	"fsl,imx6q-ocotp" (i.MX6Q/D/DL/S),
> > -	"fsl,imx6sl-ocotp" (i.MX6SL), or
> > -	"fsl,imx6sx-ocotp" (i.MX6SX), followed by "syscon".
> > +	"fsl,imx6sl-ocotp" (i.MX6SL),
> > +	"fsl,imx6sx-ocotp" (i.MX6SX), or
> > +	"fsl,imx6ul-ocotp" (i.MX6UL), followed by "syscon".
> 
> This should be reformatted such that it's not a 5 line change to add a
> compatible. "one of" defines this is an OR relationship, so drop that.
> Move 'followed by "syscon"' to below the list of compatibles.
> 

Thanks for review, I will adopt in V2.

Jacky Bai
> >  - reg: Should contain the register base and length.
> >  - clocks: Should contain a phandle pointing to the gated peripheral clock.
> >
> > --
> > 2.8.2
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
