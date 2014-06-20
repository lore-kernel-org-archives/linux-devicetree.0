Return-Path: <sudeep.holla@arm.com>
Message-ID: <53A45C54.2010103@arm.com>
Date: Fri, 20 Jun 2014 17:07:48 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
MIME-Version: 1.0
Subject: Re: [PATCHv7 2/5] mailbox: Introduce framework for mailbox
References: <1402592317-7043-1-git-send-email-jaswinder.singh@linaro.org>	<1402592479-7244-1-git-send-email-jaswinder.singh@linaro.org>	<53A32927.4060004@arm.com> <CAJe_ZhdRr-9D2uvC9U9_7+N1nKeHPSS7OKocFt6Kq-Gjquokag@mail.gmail.com>
In-Reply-To: <CAJe_ZhdRr-9D2uvC9U9_7+N1nKeHPSS7OKocFt6Kq-Gjquokag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mporter@linaro.org" <mporter@linaro.org>, "patches@linaro.org" <patches@linaro.org>, "bjorn@kryo.se" <bjorn@kryo.se>, "ashwin.chaugule@linaro.org" <ashwin.chaugule@linaro.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "s-anna@ti.com" <s-anna@ti.com>, "loic.pallardy@st.com" <loic.pallardy@st.com>, "lftan.linux@gmail.com" <lftan.linux@gmail.com>, "slapdau@yahoo.com.au" <slapdau@yahoo.com.au>, "courtney.cavin@sonymobile.com" <courtney.cavin@sonymobile.com>, Pawel Moll <Pawel.Moll@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "arnd@arndb.de" <arnd@arndb.de>, "joshc@codeaurora.org" <joshc@codeaurora.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "galak@codeaurora.org" <galak@codeaurora.org>, "ks.giri@samsung.com" <ks.giri@samsung.com>
List-ID: <devicetree@vger.kernel.org>



On 19/06/14 21:21, Jassi Brar wrote:
> Hi Sudeep,
>
> On 19 June 2014 23:47, Sudeep Holla <sudeep.holla@arm.com> wrote:
>> Hi Jassi,
>>
>>> +
>>> +static int _add_to_rbuf(struct mbox_chan *chan, void *mssg)
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
>>
>>
>> Any particular reason why the standard list implementation can't be used
>> instead of this. It eliminates limitation of MBOX_TX_QUEUE_LEN and would
>> remove msg_free/count
>>
> Just to keep the code simple. Using list is indeed theoretically more
> robust, but I think for mailbox usage, simply increasing the
> MBOX_TX_QUEUE_LEN is more practical.
>
>>
>>> + * After startup and before shutdown any data received on the chan
>>> + * is passed on to the API via atomic mbox_chan_received_data().
>>> + * The controller should ACK the RX only after this call returns.
>>
>>
>> Does this mean we can't support asynchronous messages from the remote.
>>
> "Yes, We Can".  Please note, the ACK here is at h/w level, and not
> procotol level. The api doesn't discern a remote's reply from an async
> request. After you request a mailbox, any data received will be handed
> over to you. And only after you (client) consumes the data, would the
> controller 'ACK' the RX.
>

As I mentioned in the other mail, suppose there's one channel and multiple =
users
of it. Each have to acquire the channel, and from then any data received wi=
ll
be sent to the client. But what is the async data from remote is not for th=
e
client currently holding the channel. I also gave the example.

If the remote is the process that controls power managements and allows you=
 to
set the thermal bounds. If those limits are crossed, it sends any interrupt=
 to
notify that, while the controller can be busy handling some other request(s=
ay
DVFS).

>>> +/**
>>> + * mbox_client_peek_data - A way for client driver to pull data
>>> + *                     received from remote by the controller.
>>> + * @chan: Mailbox channel assigned to this client.
>>> + *
>>> + * A poke to controller driver for any received data.
>>> + * The data is actually passed onto client via the
>>> + * mbox_chan_received_data()
>>> + * The call can be made from atomic context, so the controller's
>>> + * implementation of peek_data() must not sleep.
>>> + *
>>> + * Return: True, if controller has, and is going to push after this,
>>> + *          some data.
>>> + *         False, if controller doesn't have any data to be read.
>>> + */
>>> +bool mbox_client_peek_data(struct mbox_chan *chan)
>>> +{
>>> +       if (chan->mbox->ops->peek_data)
>>> +               return chan->mbox->ops->peek_data(chan);
>>> +
>>> +       return false;
>>> +}
>>> +EXPORT_SYMBOL_GPL(mbox_client_peek_data);
>>
>>
>> I am unable to understand how this API will be used. IIUC when the
>> controller
>> receives any data from remote, it calls mbox_chan_received_data to push =
data
>> to
>> client.
>>
> Yup, but depending upon the application (NAPI like), the controller
> may choose to buffer RX upto a threshold and then dispatch in bulk.
> The client, before going to sleep, may then poke the controller to
> flush the buffers.
>

OK understood.

Regards,
Sudeep
