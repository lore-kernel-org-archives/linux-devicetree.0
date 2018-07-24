From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH v6 5/5] mailbox: Add support for i.MX7D messaging unit
Date: Tue, 24 Jul 2018 02:09:40 +0000
Message-ID: <AM0PR04MB42118449D7120FE8578824A880550@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20180722063923.30222-1-o.rempel@pengutronix.de>
 <20180722063923.30222-6-o.rempel@pengutronix.de>
 <1532366380.3163.109.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1532366380.3163.109.camel@pengutronix.de>
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
To: Lucas Stach <l.stach@pengutronix.de>, Oleksij Rempel <o.rempel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Lucas Stach [mailto:l.stach@pengutronix.de]
> Sent: Tuesday, July 24, 2018 1:20 AM
> To: Oleksij Rempel <o.rempel@pengutronix.de>; Shawn Guo
> <shawnguo@kernel.org>; Fabio Estevam <fabio.estevam@nxp.com>; Rob
> Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>; A.s.
> Dong <aisheng.dong@nxp.com>; Vladimir Zapolskiy
> <vladimir_zapolskiy@mentor.com>
> Cc: dl-linux-imx <linux-imx@nxp.com>; linux-arm-kernel@lists.infradead.org;
> kernel@pengutronix.de; devicetree@vger.kernel.org
> Subject: Re: [PATCH v6 5/5] mailbox: Add support for i.MX7D messaging unit
> 

[...]

> > +}
> > +
> > +static int imx_mu_send_data(struct mbox_chan *chan, void *data) {
> > > +	struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
> > > +	struct imx_mu_con_priv *cp = chan->con_priv;
> > > +	u32 *arg = data;
> > +
> > > +	if (!imx_mu_last_tx_done(chan))
> > > +		return -EBUSY;
> > +
> > > +	imx_mu_write(priv, *arg, IMX_MU_xTRn(cp->idx));
> > +	imx_mu_rmw(priv, IMX_MU_xCR, IMX_MU_xSR_TEn(cp->idx), 0);
> 
> In multi-channel mode this RMW cycle needs some kind of locking. As this
> register is also changed from the irq handler, this probably needs to be a
> irqsave spinlock.
> 

Good catch!
They do need to be protected.

Regards
Dong Aisheng
