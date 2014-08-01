Return-Path: <sudeep.holla@arm.com>
Message-ID: <53DB6035.8080002@arm.com>
Date: Fri, 01 Aug 2014 10:39:01 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
MIME-Version: 1.0
Subject: Re: [PATCHv9 2/4] mailbox: Introduce framework for mailbox
References: <1406055250-29159-1-git-send-email-jaswinder.singh@linaro.org>	<1406055374-29275-1-git-send-email-jaswinder.singh@linaro.org>	<53DA7DBD.10704@arm.com> <CAJe_ZheReu3whEmuQ6T1AO4VPbaFa=e9kQgFWB0-uJQhFBs_fA@mail.gmail.com>
In-Reply-To: <CAJe_ZheReu3whEmuQ6T1AO4VPbaFa=e9kQgFWB0-uJQhFBs_fA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ks.giri@samsung.com" <ks.giri@samsung.com>, "arnd@arndb.de" <arnd@arndb.de>, "ijc@hellion.org.uk" <ijc@hellion.org.uk>, Mark Rutland <Mark.Rutland@arm.com>, "robh@kernel.org" <robh@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "courtney.cavin@sonymobile.com" <courtney.cavin@sonymobile.com>, "mporter@linaro.org" <mporter@linaro.org>, "slapdau@yahoo.com.au" <slapdau@yahoo.com.au>, "lftan.linux@gmail.com" <lftan.linux@gmail.com>, "loic.pallardy@st.com" <loic.pallardy@st.com>, "s-anna@ti.com" <s-anna@ti.com>, "ashwin.chaugule@linaro.org" <ashwin.chaugule@linaro.org>, "bjorn@kryo.se" <bjorn@kryo.se>, "patches@linaro.org" <patches@linaro.org>, "t.takinishi@jp.fujitsu.com" <t.takinishi@jp.fujitsu.com>, "broonie@linaro.org" <broonie@linaro.org>, "khilman@linaro.org" <khilman@linaro.org>, "mollie.wu@linaro.org" <mollie.wu@linaro.org>, "andy.green@linaro.org" <andy.green@linaro.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>
List-ID: <devicetree@vger.kernel.org>



On 31/07/14 18:58, Jassi Brar wrote:
> On 31 July 2014 23:02, Sudeep Holla <sudeep.holla@arm.com> wrote:
>>
>>
>> On 22/07/14 19:56, Jassi Brar wrote:
>>>
>>> Introduce common framework for client/protocol drivers and
>>> controller drivers of Inter-Processor-Communication (IPC).
>>>
>>> Client driver developers should have a look at
>>>    include/linux/mailbox_client.h to understand the part of
>>> the API exposed to client drivers.
>>> Similarly controller driver developers should have a look
>>> at include/linux/mailbox_controller.h
>>>
>>> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
>>> ---
>>>    MAINTAINERS                        |   8 +
>>>    drivers/mailbox/Makefile           |   4 +
>>>    drivers/mailbox/mailbox.c          | 467
>>> +++++++++++++++++++++++++++++++++++++
>>>    include/linux/mailbox_client.h     |  45 ++++
>>>    include/linux/mailbox_controller.h | 131 +++++++++++
>>>    5 files changed, 655 insertions(+)
>>>    create mode 100644 drivers/mailbox/mailbox.c
>>>    create mode 100644 include/linux/mailbox_client.h
>>>    create mode 100644 include/linux/mailbox_controller.h
>>>
>>
>> [...]
>>
>>
>>> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
>>> new file mode 100644
>>> index 0000000..99c0d23
>>> --- /dev/null
>>> +++ b/drivers/mailbox/mailbox.c
>>> @@ -0,0 +1,467 @@
>>> +/*
>>> + * Mailbox: Common code for Mailbox controllers and users
>>> + *
>>> + * Copyright (C) 2013-2014 Linaro Ltd.
>>> + * Author: Jassi Brar <jassisinghbrar@gmail.com>
>>> + *
>>> + * This program is free software; you can redistribute it and/or modif=
y
>>> + * it under the terms of the GNU General Public License version 2 as
>>> + * published by the Free Software Foundation.
>>> + */
>>> +
>>> +#include <linux/interrupt.h>
>>> +#include <linux/spinlock.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/err.h>
>>> +#include <linux/module.h>
>>> +#include <linux/device.h>
>>> +#include <linux/mailbox_client.h>
>>> +#include <linux/mailbox_controller.h>
>>> +
>>> +#define TXDONE_BY_IRQ  (1 << 0) /* controller has remote RTR irq */
>>> +#define TXDONE_BY_POLL (1 << 1) /* controller can read status of last =
TX
>>> */
>>> +#define TXDONE_BY_ACK  (1 << 2) /* S/W ACK recevied by Client ticks th=
e
>>> TX */
>>> +
>>> +static LIST_HEAD(mbox_cons);
>>> +static DEFINE_MUTEX(con_mutex);
>>> +
>>> +static int add_to_rbuf(struct mbox_chan *chan, void *mssg)
>>> +{
>>> +       int idx;
>>> +       unsigned long flags;
>>> +
>>> +       spin_lock_irqsave(&chan->lock, flags);
>>> +
>>> +       /* See if there is any space left */
>>> +       if (chan->msg_count =3D=3D MBOX_TX_QUEUE_LEN) {
>>> +               spin_unlock_irqrestore(&chan->lock, flags);
>>> +               return -ENOMEM;
>>> +       }
>>> +
>>> +       idx =3D chan->msg_free;
>>> +       chan->msg_data[idx] =3D mssg;
>>> +       chan->msg_count++;
>>> +
>>> +       if (idx =3D=3D MBOX_TX_QUEUE_LEN - 1)
>>> +               chan->msg_free =3D 0;
>>> +       else
>>> +               chan->msg_free++;
>>> +
>>> +       spin_unlock_irqrestore(&chan->lock, flags);
>>> +
>>> +       return idx;
>>> +}
>>> +
>>> +static void msg_submit(struct mbox_chan *chan)
>>> +{
>>> +       unsigned count, idx;
>>> +       unsigned long flags;
>>> +       void *data;
>>> +       int err;
>>> +
>>> +       spin_lock_irqsave(&chan->lock, flags);
>>> +
>>> +       if (!chan->msg_count || chan->active_req) {
>>> +               spin_unlock_irqrestore(&chan->lock, flags);
>>> +               return;
>>> +       }
>>> +
>>> +       count =3D chan->msg_count;
>>> +       idx =3D chan->msg_free;
>>> +       if (idx >=3D count)
>>> +               idx -=3D count;
>>> +       else
>>> +               idx +=3D MBOX_TX_QUEUE_LEN - count;
>>> +
>>> +       data =3D chan->msg_data[idx];
>>> +
>>> +       /* Try to submit a message to the MBOX controller */
>>> +       err =3D chan->mbox->ops->send_data(chan, data);
>>
>>
>> Probably this is discussed already, but again I missed to find it
>> in archives, so asking here. If the protocol has some payload associated
>> with the message and controller expects it to be in place before calling
>> send_data, we essentially end up not using this queue at all by waiting
>> in the protocol layer(may be in it's own queue)
>>
> Why essentially?
>    The 'data' is a void *  i.o.w the packet format is a completely
> internal understanding between a controller and a client. The 'data'
> can point to a copy of payload that the controller driver sets up in
> the shared payload region as the first thing in send_data() callback.
> OR, like my 'server' type platform, where the access is serialized to
> the shared payload region.
>

Yes that's exactly what I have now. But based on your driver I thought
that the shared memory should not be associated with the mailbox controller
and should be completely handled in the protocol/client.

Also to handle async packet from remote, controller has to pass shared
memory pointer always to the client to read the data as the buffer won't
to ready in such case. So I thought it's good idea to handle shared memory
completely in client/protocol.

Let me know your thoughts.

>>
>>> +       if (!err) {
>>> +               chan->active_req =3D data;
>>> +               chan->msg_count--;
>>> +       }
>>> +
>>> +       spin_unlock_irqrestore(&chan->lock, flags);
>>> +}
>>> +
>>> +static void tx_tick(struct mbox_chan *chan, int r)
>>> +{
>>> +       unsigned long flags;
>>> +       void *mssg;
>>> +
>>> +       spin_lock_irqsave(&chan->lock, flags);
>>> +       mssg =3D chan->active_req;
>>> +       chan->active_req =3D NULL;
>>> +       spin_unlock_irqrestore(&chan->lock, flags);
>>> +
>>> +       /* Submit next message */
>>> +       msg_submit(chan);
>>> +
>>> +       /* Notify the client */
>>> +       if (mssg && chan->cl->tx_done)
>>> +               chan->cl->tx_done(chan->cl, mssg, r);
>>> +
>>> +       if (chan->cl->tx_block)
>>> +               complete(&chan->tx_complete);
>>> +}
>>> +
>>> +static void poll_txdone(unsigned long data)
>>> +{
>>> +       struct mbox_controller *mbox =3D (struct mbox_controller *)data=
;
>>> +       bool txdone, resched =3D false;
>>> +       int i;
>>> +
>>> +       for (i =3D 0; i < mbox->num_chans; i++) {
>>> +               struct mbox_chan *chan =3D &mbox->chans[i];
>>> +
>>> +               if (chan->active_req && chan->cl) {
>>> +                       resched =3D true;
>>> +                       txdone =3D chan->mbox->ops->last_tx_done(chan);
>>> +                       if (txdone)
>>> +                               tx_tick(chan, 0);
>>
>>
>> What if all the active channels finished Tx(i.e. txdone =3D 1), we still=
 have
>> resched =3D true and add a timer, not really harmful though. But IMO you=
 can
>> move it to else part instead ?
>>
> Doing that will be wrong. For txdone, another message may be submitted
> on the channel and we definitely need to poll again.

Ah OK, thanks for clarification.

Regards,
Sudeep
