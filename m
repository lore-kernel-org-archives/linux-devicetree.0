From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH v8 4/4] mailbox: Add support for i.MX7D messaging unit
Date: Wed, 1 Aug 2018 07:44:43 +0000
Message-ID: <AM0PR04MB42118C26A7C5F80FD46FBB9B802D0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20180731141146.10788-1-o.rempel@pengutronix.de>
 <20180731141146.10788-5-o.rempel@pengutronix.de>
 <CABb+yY2PN=LN3bgTTzL9SpA43atughAbS1OjNsg0XZg42JxD3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABb+yY2PN=LN3bgTTzL9SpA43atughAbS1OjNsg0XZg42JxD3w@mail.gmail.com>
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
To: Jassi Brar <jassisinghbrar@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, ", linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 srv_heupstream" <linux-arm-kernel@lists.infradead.org>, ",
 Sascha Hauer" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Jassi Brar [mailto:jassisinghbrar@gmail.com]

[...]

> > +
> > +static void imx_mu_txdb_work(struct work_struct *work) {
> > +       struct imx_mu_con_priv *cp =
> > +                       container_of(work, struct imx_mu_con_priv, work);
> > +       mbox_chan_txdone(cp->chan, 0); }
> >
> The api assumes a controller have same type of channels. So we are having
> to do this here.
> I am not sure, but would declaring two mailbox controllers (one with
> doorbells and the other data channels) work?
> If not, at least we could use a tasklet instead of a work queue?
> 

I'm also a bit curious what the meaning of calling mbox_chan_txdone
for a doorbell mailbox?

Is there any recommended way to use it?

Regards
Dong Aisheng
