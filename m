From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCHv10 2/4] mailbox: Introduce framework for mailbox
Date: Mon, 22 Sep 2014 19:33:32 +0100
Message-ID: <54206B7C.60501@arm.com>
References: <1406896194-4667-1-git-send-email-jaswinder.singh@linaro.org>	<1406896296-4863-1-git-send-email-jaswinder.singh@linaro.org> <CAJ5Y-eZ5gNMQ2YRN4iS5QTU7qUrgxGdTHXhQZ_2ut4iBsEZHGg@mail.gmail.com> <5420675C.6040805@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5420675C.6040805-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, LeyFoon Tan <lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Loic Pallardy <loic.pallardy-qxv4g6HH51o@public.gmane.org>, "Anna, Suman" <s-anna-l0cyMroinI0@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "mollie.wu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mollie.wu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tetsuya Takinishi <t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, "broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <lee.jones@linaro>
List-Id: devicetree@vger.kernel.org



On 22/09/14 19:15, Sudeep Holla wrote:
>
>
> On 22/09/14 19:01, Ashwin Chaugule wrote:
>> Hi Jassi,
>>
>> On 1 August 2014 08:31, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>> Introduce common framework for client/protocol drivers and
>>> controller drivers of Inter-Processor-Communication (IPC).
>>>
>>> Client driver developers should have a look at
>>>    include/linux/mailbox_client.h to understand the part of
>>> the API exposed to client drivers.
>>> Similarly controller driver developers should have a look
>>> at include/linux/mailbox_controller.h
>>>
>>> Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> ---
>>>    MAINTAINERS                        |   8 +
>>>    drivers/mailbox/Makefile           |   4 +
>>>    drivers/mailbox/mailbox.c          | 466 +++++++++++++++++++++++++++++++++++++
>>>    include/linux/mailbox_client.h     |  46 ++++
>>>    include/linux/mailbox_controller.h | 135 +++++++++++
>>>    5 files changed, 659 insertions(+)
>>>    create mode 100644 drivers/mailbox/mailbox.c
>>>    create mode 100644 include/linux/mailbox_client.h
>>>    create mode 100644 include/linux/mailbox_controller.h
>>>
>>
>> [..]
>>
>>> +
>>> +static void poll_txdone(unsigned long data)
>>> +{
>>> +       struct mbox_controller *mbox = (struct mbox_controller *)data;
>>> +       bool txdone, resched = false;
>>> +       int i;
>>> +
>>> +       for (i = 0; i < mbox->num_chans; i++) {
>>> +               struct mbox_chan *chan = &mbox->chans[i];
>>> +
>>> +               if (chan->active_req && chan->cl) {
>>> +                       resched = true;
>>> +                       txdone = chan->mbox->ops->last_tx_done(chan);
>>> +                       if (txdone)
>>> +                               tx_tick(chan, 0);
>>> +               }
>>> +       }
>>> +
>>> +       if (resched)
>>> +               mod_timer(&mbox->poll, jiffies +
>>> +                               msecs_to_jiffies(mbox->period));
>>
>> While preparing a different patch which uses the Mbox framework, I
>> noticed that mbox->period might not be initialized anywhere. Also, how
>> is mbox->txpoll_period to be used? It appears from the description of
>> txpoll_period in mbox_controller.h that you'd want to use that value
>> in the mod_timer above, or equate the two somewhere in the controller
>> registration or eliminate one of the two. FWIW I also looked at your
>> code in [1].
>>
>
> IIUC the controller needs to set the txpoll_period if it sets
> txdone_poll, may be a sanity check for !0 would be good.
>

Ah, sorry I confused mbox->period to txpoll_period.
You are right mbox->period is not set, the header claims it to be
private, and hence I assume it needs to be handled only in core mailbox
library. Not sure if we need both mbox->period and txpoll_period though.

Regards,
Sudeep

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
