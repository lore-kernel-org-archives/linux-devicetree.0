From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH v8 2/4] dt-bindings: mailbox: imx-mu: add generic MU
 channel support
Date: Thu, 2 Aug 2018 10:07:51 +0000
Message-ID: <AM0PR04MB42117DA905926F3B3DAC014E802C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20180731141146.10788-1-o.rempel@pengutronix.de>
 <20180731141146.10788-3-o.rempel@pengutronix.de>
 <CABb+yY1ZusgN4UVxmUgXZS9ObGdLwFAL4XkW7F1yVb6Gq=9XPA@mail.gmail.com>
 <20180801050530.nzmomvvyo5pfwclz@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180801050530.nzmomvvyo5pfwclz@pengutronix.de>
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
To: Oleksij Rempel <o.rempel@pengutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, ", linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 srv_heupstream" <linux-arm-kernel@lists.infradead.org>, ",
 Sascha Hauer" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Oleksij Rempel [mailto:o.rempel@pengutronix.de]

[...]

> > > diff --git a/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
> > > b/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
> > > index 90e4905dfc69..9efd3a9ade44 100644
> > > --- a/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
> > > +++ b/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
> > > @@ -18,11 +18,33 @@ Messaging Unit Device Node:
> > >  Required properties:
> > >  -------------------
> > >  - compatible : should be "fsl,<chip>-mu", the supported chips include
> > > -               imx8qxp, imx8qm.
> > > +               imx6sx, imx7s, imx8qxp, imx8qm.
> > > +               The "fsl,imx6sx-mu" compatible is seen as generic and should
> > > +               be included together with SoC specific compatible.
> > >  - reg :                Should contain the registers location and length
> > >  - interrupts : Interrupt number. The interrupt specifier format depends
> > >                 on the interrupt controller parent.
> > > -- #mbox-cells:  Must be 0. Number of cells in a mailbox
> > > +- #mbox-cells:  Must be 2.
> > >
> > This seems like modifying the bindings. But since nothing exists yet,
> > maybe we should merge patch 1 and 2 ?
> 
> For some weeks I already asked to squash this patches.. it was not ACKed.
> We can try again... @Rob, @Aisheng, should I merge this two patches?
> 

I guess It may depend on whether we use single channel mode for SCU.

I'm not sure we've already got the conclusion that multi channel mode
is suitable for SCU. I'm trying to implement it but meet some problems.
I've just explained in another reply. Hope Jassie can shine some light.

Regards
Dong Aisheng

> >
> > > +                         <&phandle type channel>
> > > +                           phandle   : Label name of controller
> > > +                           type      : Channel type
> > > +                           channel   : Channel number
> > > +
> > > +               This MU support 4 type of unidirectional channels, each type
> > > +               has 4 channels. A total of 16 channels. Following types are
> > > +               supported:
> > > +               0 - TX channel with 32bit transmit register and IRQ transmit
> > > +               acknowledgment support.
> > > +               1 - RX channel with 32bit receive register and IRQ support
> > > +               2 - TX doorbell channel. Without own register and no ACK
> support.
> > > +               3 - RX doorbell channel.
> > >
> > Thanks. This is great.
> >
> > > +               The doorbell channels should be used with shared memory and
> protocol
> > > +               level acknowledgment if needed.
> > > +
> > I would avoid this. People might get notions that they have to use
> > shmem with doorbell -- a trivial protocol might mean doing some fixed
> > action (like reset) whenever the doorbell rings.
> 
> Ok.
> 
> >
> > > +Optional properties:
> > > +-------------------
> > > +- clocks :     phandle to the input clock.
> > > +- fsl,mu-side-b : Should be set for side B MU.
> > >
> > Nit: can we call this 'fsl,no-init' ?
> 
> No. It is HW description and not functionality which is present in current Linux
> driver.
> 
> --
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
