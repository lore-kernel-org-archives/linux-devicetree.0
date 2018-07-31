From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v8 4/4] mailbox: Add support for i.MX7D messaging unit
Date: Tue, 31 Jul 2018 21:51:37 +0530
Message-ID: <CABb+yY2PN=LN3bgTTzL9SpA43atughAbS1OjNsg0XZg42JxD3w@mail.gmail.com>
References: <20180731141146.10788-1-o.rempel@pengutronix.de>
 <20180731141146.10788-5-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180731141146.10788-5-o.rempel@pengutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, ", linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream" <linux-arm-kernel@lists.infradead.org>, ",
 Sascha Hauer" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Oleksij,

 A fast and fine turnaround! Mostly nits and a suggestion follows ...

On Tue, Jul 31, 2018 at 7:41 PM, Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> The Mailbox controller is able to send messages (up to 4 32 bit words)
> between the endpoints.
>
> This driver was tested using the mailbox-test driver sending messages
> between the Cortex-A7 and the Cortex-M4.
>
Do we need something MU specific here?
I mean MU doesn't really care if the endpoints are CA, CR or CM. So,
maybe just the two-line ritual intro to MU?


> +enum imx_mu_chan_type {
> +       IMX_MU_TYPE_TX,         /* Tx with FIFO */
> +       IMX_MU_TYPE_RX,         /* Rx with FIFO */
>
nit: its a register, not fifo


> +
> +static void imx_mu_txdb_work(struct work_struct *work)
> +{
> +       struct imx_mu_con_priv *cp =
> +                       container_of(work, struct imx_mu_con_priv, work);
> +       mbox_chan_txdone(cp->chan, 0);
> +}
>
The api assumes a controller have same type of channels. So we are
having to do this here.
I am not sure, but would declaring two mailbox controllers (one with
doorbells and the other data channels) work?
If not, at least we could use a tasklet instead of a work queue?


> +static bool imx_mu_last_tx_done(struct mbox_chan *chan)
> +{
> +       struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
> +       struct imx_mu_con_priv *cp = chan->con_priv;
> +
> +       /* test if transmit register is empty */
> +       return imx_mu_read(priv, IMX_MU_xSR) & IMX_MU_xSR_TEn(cp->idx);
> +}
> +
> +static int imx_mu_send_data(struct mbox_chan *chan, void *data)
> +{
> +       struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
> +       struct imx_mu_con_priv *cp = chan->con_priv;
> +       u32 *arg = data;
> +
> +       switch (cp->type) {
> +       case IMX_MU_TYPE_TX:
> +               if (!imx_mu_last_tx_done(chan))
> +                       return -EBUSY;
>
This test should be moved to imx_mu_startup().
The api won't ever call if last tx was not done, and so it doesn't
know how to recover from send_data() failure.


> +
> +static int imx_mu_startup(struct mbox_chan *chan)
> +{
> +       struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
> +       struct imx_mu_con_priv *cp = chan->con_priv;
> +       int ret;
> +
> +       if (cp->type == IMX_MU_TYPE_TXDB) {
> +               /* Tx doorbell don't have ACK support */
> +               INIT_WORK(&cp->work, imx_mu_txdb_work);
> +               return 0;
> +       }
> +
> +       cp->irq_desc = kasprintf(GFP_KERNEL, "imx_mu_chan[%i-%i]", cp->type,
> +                                cp->idx);
> +       if (!cp->irq_desc)
> +               return -ENOMEM;
>
Probably you won't do but still .... name of irq is but one channel
property. So you could set it in probe() and avoid creating another
situation when startup could fail.


> +       ret = request_irq(priv->irq, imx_mu_isr, IRQF_SHARED, cp->irq_desc,
> +                         chan);
> +       if (ret) {
> +               dev_err(priv->dev,
> +                       "Unable to acquire IRQ %d\n", priv->irq);
> +               return ret;
> +       }
> +
> +       switch (cp->type) {
> +               break;
>
Is this intentional?


> +
> +static void imx_mu_shutdown(struct mbox_chan *chan)
> +{
> +       struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
> +       struct imx_mu_con_priv *cp = chan->con_priv;
> +
> +       if (IMX_MU_TYPE_TXDB == cp->type)
>
nit: usually we do (cp->type == IMX_MU_TYPE_TXDB)


Thanks
