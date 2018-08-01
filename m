From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v8 4/4] mailbox: Add support for i.MX7D messaging unit
Date: Wed, 1 Aug 2018 12:32:20 +0530
Message-ID: <CABb+yY3m-GZx3zTE5p3T+7FO1QfwY3+RiSA0K-QM0SG82KgpMQ@mail.gmail.com>
References: <20180731141146.10788-1-o.rempel@pengutronix.de>
 <20180731141146.10788-5-o.rempel@pengutronix.de>
 <CABb+yY2PN=LN3bgTTzL9SpA43atughAbS1OjNsg0XZg42JxD3w@mail.gmail.com>
 <20180801053125.gmdgojgejyremaul@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180801053125.gmdgojgejyremaul@pengutronix.de>
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

On Wed, Aug 1, 2018 at 11:01 AM, Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> On Tue, Jul 31, 2018 at 09:51:37PM +0530, Jassi Brar wrote:

>> > The Mailbox controller is able to send messages (up to 4 32 bit words)
>> > between the endpoints.
>> >
>> > This driver was tested using the mailbox-test driver sending messages
>> > between the Cortex-A7 and the Cortex-M4.
>> >
>> Do we need something MU specific here?
>> I mean MU doesn't really care if the endpoints are CA, CR or CM. So,
>> maybe just the two-line ritual intro to MU?
>
> Till now, every additional word about MU added more disagreement in this
> topic. I prefer the reduced variant.
>
OK, but we don't usually specify "tested on ..." but leave details of
the controller, in the new driver commit.


>> > +
>> > +static void imx_mu_txdb_work(struct work_struct *work)
>> > +{
>> > +       struct imx_mu_con_priv *cp =
>> > +                       container_of(work, struct imx_mu_con_priv, work);
>> > +       mbox_chan_txdone(cp->chan, 0);
>> > +}
>> >
>> The api assumes a controller have same type of channels. So we are
>> having to do this here.
>> I am not sure, but would declaring two mailbox controllers (one with
>> doorbells and the other data channels) work?
>
> I was thinking about it and decided that this pain was not worth it.
>
OK.

But just fyi, a common use of doorbell is to hint the master to take
actions like reset, suspend or expect some periodic broadcast or some
hotpath where we wouldn't want to sleep.
Another usecase is data transfer (where speed matters) via
doorbell+shmem, having to sleep after each packet is going to kill
performance.


>> If not, at least we could use a tasklet instead of a work queue?
>
> ok. probably it is better to fix the mailbox framework.... may be not right
> now.
>
No, the framework is fine. MU is the only controller that has two
types of channels.


>> > +
>> > +static int imx_mu_startup(struct mbox_chan *chan)
>> > +{
>> > +       struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
>> > +       struct imx_mu_con_priv *cp = chan->con_priv;
>> > +       int ret;
>> > +
>> > +       if (cp->type == IMX_MU_TYPE_TXDB) {
>> > +               /* Tx doorbell don't have ACK support */
>> > +               INIT_WORK(&cp->work, imx_mu_txdb_work);
>> > +               return 0;
>> > +       }
>> > +
>> > +       cp->irq_desc = kasprintf(GFP_KERNEL, "imx_mu_chan[%i-%i]", cp->type,
>> > +                                cp->idx);
>> > +       if (!cp->irq_desc)
>> > +               return -ENOMEM;
>> >
>> Probably you won't do but still .... name of irq is but one channel
>> property. So you could set it in probe() and avoid creating another
>> situation when startup could fail.
>
> You mean, fail on probe with no mem is better then fail on startup? Why?
>
Fail early :)
But if you just have irq_name[8] in the channel struct, it won't even
fail in probe. And is more consistent with other channel
initialisations..... you see name of irq doesn't change across channel
requests.

But OK, I am running out of energy and interest.


>> > +
>> > +static void imx_mu_shutdown(struct mbox_chan *chan)
>> > +{
>> > +       struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
>> > +       struct imx_mu_con_priv *cp = chan->con_priv;
>> > +
>> > +       if (IMX_MU_TYPE_TXDB == cp->type)
>> >
>> nit: usually we do (cp->type == IMX_MU_TYPE_TXDB)
>
> why? I do it with simple reason:
> this error will be detected by compiler
> if (IMX_MU_TYPE_TXDB = cp->type)
>
> this error will silently fail
> if (cp->type = IMX_MU_TYPE_TXDB)
>
Because it reads like
     if (2 is equal to the variable)
instead of
    if (the variable is equal to 2)

Most developers prefer latter. In fact you too, in startup()
So please atleast make it consistent either way.

Cheers!
