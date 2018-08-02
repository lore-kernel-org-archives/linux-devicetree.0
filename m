From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v8 2/4] dt-bindings: mailbox: imx-mu: add generic MU
 channel support
Date: Thu, 2 Aug 2018 08:09:26 -0600
Message-ID: <CAL_Jsq+S0c9TNSfaHahQGZ05OcRMZnpbbwBRps_dOEm+WofyLQ@mail.gmail.com>
References: <20180731141146.10788-1-o.rempel@pengutronix.de>
 <20180731141146.10788-3-o.rempel@pengutronix.de>
 <CABb+yY1ZusgN4UVxmUgXZS9ObGdLwFAL4XkW7F1yVb6Gq=9XPA@mail.gmail.com>
 <20180801050530.nzmomvvyo5pfwclz@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180801050530.nzmomvvyo5pfwclz@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 31, 2018 at 11:05 PM Oleksij Rempel <o.rempel@pengutronix.de> wrote:
>
> On Tue, Jul 31, 2018 at 09:28:09PM +0530, Jassi Brar wrote:
> > On Tue, Jul 31, 2018 at 7:41 PM, Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> > > Each MU has four pairs of rx/tx data register with four rx/tx interrupts
> > > which can also be used as a separate channel.
> > >
> > > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > > ---
> > >  .../devicetree/bindings/mailbox/fsl,mu.txt    | 28 +++++++++++++++++--
> > >  1 file changed, 25 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mailbox/fsl,mu.txt b/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
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
> For some weeks I already asked to squash this patches.. it was not
> ACKed. We can try again... @Rob, @Aisheng, should I merge this two
> patches?

Whatever you like. I don't really care.

Rob
