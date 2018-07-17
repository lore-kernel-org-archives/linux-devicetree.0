From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH v3 1/3] dt-bindings: arm: fsl: add mu binding doc
Date: Tue, 17 Jul 2018 04:51:34 +0000
Message-ID: <AM0PR04MB42115331D2201A6A07D82CEA805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20180716114209.25242-1-o.rempel@pengutronix.de>
 <20180716114209.25242-2-o.rempel@pengutronix.de>
 <20180716151654.GA21819@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180716151654.GA21819@rob-hp-laptop>
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
To: Rob Herring <robh@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Monday, July 16, 2018 11:17 PM
> To: Oleksij Rempel <o.rempel@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>; Fabio Estevam
> <fabio.estevam@nxp.com>; Mark Rutland <mark.rutland@arm.com>; A.s.
> Dong <aisheng.dong@nxp.com>; kernel@pengutronix.de; linux-arm-
> kernel@lists.infradead.org; devicetree@vger.kernel.org; dl-linux-imx <linux-
> imx@nxp.com>
> Subject: Re: [PATCH v3 1/3] dt-bindings: arm: fsl: add mu binding doc
> 
> On Mon, Jul 16, 2018 at 01:42:07PM +0200, Oleksij Rempel wrote:
> > The Messaging Unit module enables two processors within the SoC to
> > communicate and coordinate by passing messages (e.g. data, status and
> > control) through the MU interface.
> 
> v3? I already gave my R-by on v4 from Dong. Please coordinate your work on
> this.

Okay.

Oleksij, 
could you re-add the M4 support part in a separate patch based on
the already acked SCU one?
I guess you can re-send with the acked one.

Regards
Dong Aisheng

> 
> >
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> >  .../devicetree/bindings/mailbox/fsl,mu.txt    | 32 +++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/mailbox/fsl,mu.txt
