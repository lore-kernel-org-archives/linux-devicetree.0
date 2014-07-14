From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv8 2/2] mailbox: Introduce framework for mailbox
Date: Mon, 14 Jul 2014 11:10:55 +0530
Message-ID: <CAJe_Zhc8UMNO6t0pwuPQ5=fM4UARoru+AV2Jb6+7MAaDBoO9=A@mail.gmail.com>
References: <1405071167-14503-1-git-send-email-jaswinder.singh@linaro.org>
	<1405071325-14683-1-git-send-email-jaswinder.singh@linaro.org>
	<201407111926.13939.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201407111926.13939.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, LeyFoon Tan <lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Loic Pallardy <loic.pallardy-qxv4g6HH51o@public.gmane.org>, "Anna, Suman" <s-anna-l0cyMroinI0@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Mollie.Wu" <Mollie.Wu-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Tetsuya Takinishi <t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11 July 2014 22:56, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 11 July 2014, Jassi Brar wrote:
>> +
>> + This document aims to help developers write client and controller
>> +drivers for the API. But before we start, let us note that the
>> +client (especially) and controller drivers are likely going to be
>> +very platform specific because the remote firmware is likely to be
>> +proprietary and implement non-standard protocol. So even if two
>> +platforms employ, say, PL320 controller, the client drivers can't
>> +be shared across them. Even the PL320 driver might need to accomodate
>> +some platform specific quirks. So the API is meant mainly to avoid
>> +similar copies of code written for each platform.
>> + Some of the choices made during implementation are the result of this
>> +peculiarity of this "common" framework.
>
> Note that there might be the case where you have a Linux instance
> on both sides communicating over a standard protocol, so while it's
> certainly true that a lot of the users (in particular the existing
> ones) are talking to a proprietary firmware, it's not necessarily so.
>
> An example I can think of is using the mailbox API as a low-level
> implementation detail of a PCI-PCI link connecting two identical
> hosts using a standard protocol like virtio or ntb-net on top.
>
Yes, and I have been careful to use the word 'likely', and not 'always' :)
I will add your example as a note in this documentation though.


>> +     Part 2 - Client Driver (See include/linux/mailbox_client.h)
>> +
>> + The client might want to operate in blocking mode (synchronously
>> +send a message through before returning) or non-blocking/async mode (submit
>> +a message and a callback function to the API and return immediately).
>> +
>> +
>> +static struct mbox_chan *ch_async, *ch_blk;
>> +static struct mbox_client cl_async, cl_blk;
>> +static struct completion c_aysnc;
>
> Using static variables for these is probably not good as an
> example: we try to write all drivers in a way that lets them
> handle multiple instances of the same hardware, so a better
> example may be to put the same things into a data structure
> that is dynamically allocatied by the client, even if that is
> a little more verbose than your current examaple.
>
Yeah, that implies for any code.
Here is only an example of how to use the api. One will have to put in
extra effort to screw it up if the client drivers are already well
written :)


>> +/*
>> + * This is the handler for data received from remote. The behaviour is purely
>> + * dependent upon the protocol. This is just an example.
>> + */
>> +static void message_from_remote(struct mbox_client *cl, void *mssg)
>> +{
>> +     if (cl == &cl_async) {
>> +             if (is_an_ack(mssg)) {
>> +                     /* An ACK to our last sample sent */
>> +                     return; /* Or do something else here */
>> +             } else { /* A new message from remote */
>> +                     queue_req(mssg);
>> +             }
>> +     } else {
>> +             /* Remote f/w sends only ACK packets on this channel */
>> +             return;
>> +     }
>> +}
>> +
>> +static void sample_sent(struct mbox_client *cl, void *mssg, int r)
>> +{
>> +     complete(&c_aysnc);
>> +}
>
> Each of these would consequently do something like
>
>         struct my_mailbox *m = container_of(mbox_client, struct my_mailbox, client);
>         complete(&m->completion);
>
Yup. I will change the example in documentation.

>
>> +static struct mbox_chan *
>> +of_mbox_index_xlate(struct mbox_controller *mbox,
>> +                 const struct of_phandle_args *sp)
>> +{
>> +     int ind = sp->args[0];
>> +
>> +     if (ind >= mbox->num_chans)
>> +             return NULL;
>> +
>> +     return &mbox->chans[ind];
>> +}
>
> Should this perhaps check that #mbox-cells is '1'?
> For other values, this function can't really work.
>
Even for #mbox-cell==1 it won't work if the argument mean something
other than what it expects (a direct index). I think it should be the
responsibility of the developer to ensure he doesn't use the stock
xlate() if it doesn't support his platform. So I usually skip such
checks. If you think otherwise, I can add it though.


>> +/**
>> + * struct mbox_client - User of a mailbox
>> + * @dev:             The client device
>> + * @chan_name:               The string token to identify a channel out of more
>> + *                   than one specified for the client via DT
>> + * @tx_block:                If the mbox_send_message should block until data is
>> + *                   transmitted.
>> + * @tx_tout:         Max block period in ms before TX is assumed failure
>> + * @knows_txdone:    if the client could run the TX state machine. Usually
>> + *                   if the client receives some ACK packet for transmission.
>> + *                   Unused if the controller already has TX_Done/RTR IRQ.
>> + * @rx_callback:     Atomic callback to provide client the data received
>> + * @tx_done:         Atomic callback to tell client of data transmission
>> + */
>
> It may be worthwhile listing here which callbacks are being called under a
> spinlock and which are allowed to sleep. Same for the other structures with
> function pointers.
>
OK, will do.

> None of these comments are show-stoppers, overall I'm very happy with the
> current state of the mailbox API and I think we should merge it  in the next
> merge window.
>
Thanks a lot! I will respin another patchset, waiting another day or
two for feedback, with the hope to finally get some ACK or Reviewed by
:)

Cheers,
Jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
