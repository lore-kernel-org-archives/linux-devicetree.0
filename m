From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv7 0/5] Common Mailbox Framework
Date: Mon, 30 Jun 2014 21:52:27 +0530
Message-ID: <CAJe_Zhdg8J_GhxJJvJTyGDK-bAmXwEXmWh6d0biisM4M8o3a4g@mail.gmail.com>
References: <1402592317-7043-1-git-send-email-jaswinder.singh@linaro.org>
	<1404144980.6148.6.camel@hobbes>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404144980.6148.6.camel@hobbes>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "Anna, Suman" <s-anna-l0cyMroinI0@public.gmane.org>, Loic Pallardy <loic.pallardy-qxv4g6HH51o@public.gmane.org>, LeyFoon Tan <lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, pa-kxMDh+IBDuj1P9xLtpHBDw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 30 June 2014 21:46, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org> wrote:
> Hi Jassi,
>
> On Thu, 2014-06-12 at 22:28 +0530, Jassi Brar wrote:
>> Hello,
>>   Here is the next revision of Mailbox framwork.
>
> I'm wondering whether you keep a Git tree with the framework we could
> keep the Raspberry Pi mailbox driver based on (bcm2835-mbox)?
>
> Also, from look at the API it does not seem to me that it's possible to
> synchronously (that is without a tx_done callback) collect a response
> when a message is sent with tx_block enabled. Equivalent to this: [1]
>
Thanks, good catch.

Could you please give this a try...

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index afa63cd..4059602 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -101,10 +101,11 @@ static void tx_tick(struct mbox_chan *chan, int r)
        _msg_submit(chan);

        /* Notify the client */
+       if (mssg && chan->cl->tx_done)
+               chan->cl->tx_done(chan->cl, mssg, r);
+
        if (chan->cl->tx_block)
                complete(&chan->tx_complete);
-       else if (mssg && chan->cl->tx_done)
-               chan->cl->tx_done(chan->cl, mssg, r);
 }

 static void poll_txdone(unsigned long data)

-jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
