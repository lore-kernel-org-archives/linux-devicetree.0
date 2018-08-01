From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v8 4/4] mailbox: Add support for i.MX7D messaging unit
Date: Wed, 1 Aug 2018 15:15:08 +0530
Message-ID: <CABb+yY1pWAUDa33AvHy9LiPjp+r__F3v8w_z0uPJ-4eJ4nzuFA@mail.gmail.com>
References: <20180731141146.10788-1-o.rempel@pengutronix.de>
 <20180731141146.10788-5-o.rempel@pengutronix.de>
 <CABb+yY2PN=LN3bgTTzL9SpA43atughAbS1OjNsg0XZg42JxD3w@mail.gmail.com>
 <AM0PR04MB42118C26A7C5F80FD46FBB9B802D0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB42118C26A7C5F80FD46FBB9B802D0@AM0PR04MB4211.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "A.s. Dong" <aisheng.dong@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, ",
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream" <linux-arm-kernel@lists.infradead.org>, ",
 Sascha Hauer" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 1, 2018 at 1:14 PM, A.s. Dong <aisheng.dong@nxp.com> wrote:
>> -----Original Message-----
>> From: Jassi Brar [mailto:jassisinghbrar@gmail.com]
>
> [...]
>
>> > +
>> > +static void imx_mu_txdb_work(struct work_struct *work) {
>> > +       struct imx_mu_con_priv *cp =
>> > +                       container_of(work, struct imx_mu_con_priv, work);
>> > +       mbox_chan_txdone(cp->chan, 0); }
>> >
>> The api assumes a controller have same type of channels. So we are having
>> to do this here.
>> I am not sure, but would declaring two mailbox controllers (one with
>> doorbells and the other data channels) work?
>> If not, at least we could use a tasklet instead of a work queue?
>>
>
> I'm also a bit curious what the meaning of calling mbox_chan_txdone
> for a doorbell mailbox?
>
> Is there any recommended way to use it?
>
The framework submits a message (a signal with or without data) for
controller to transmit. Obviously, it has to know when the transfer
completes (so that it can submit the next message).

Depending on the controller h/w design, there can be three ways.

a) Controller has some irq that fires when the signal is consumed by
the other end. Like MU does. So upon TX-IRQ, the controller driver
calls mbox_chan_txdone() to tell the framework that the last submitted
transfer has completed. This is indicated by setting only  txdone_irq
= true

b) Controller does not have any tx-irq, but it can read some register
to know the status. That is it has to be polled. The framework calls
last_tx_done() periodically to check the status. This is indicated by
setting only  txdone_poll = true.

c) Controller has neither irq, nor any status register. This is
indicated by setting only  txdone_irq = false and  txdone_poll =
false.   In this case, the protocol/client has to tell the framework
(using some protocol level indicator like some ack packet reception)
when the last submitted message was transferred, by calling
mbox_client_txdone()

A 'doorbell' is  (c) type channel -- just an irq raised at other end
without any ack irq or status bit to check. So, the client would
simply do
                mbox_send_message(chan, msg);
                mbox_client_txdone(chan, 0);
