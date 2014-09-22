From: Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv10 2/4] mailbox: Introduce framework for mailbox
Date: Mon, 22 Sep 2014 14:01:08 -0400
Message-ID: <CAJ5Y-eZ5gNMQ2YRN4iS5QTU7qUrgxGdTHXhQZ_2ut4iBsEZHGg@mail.gmail.com>
References: <1406896194-4667-1-git-send-email-jaswinder.singh@linaro.org>
	<1406896296-4863-1-git-send-email-jaswinder.singh@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406896296-4863-1-git-send-email-jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, LeyFoon Tan <lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Loic Pallardy <loic.pallardy-qxv4g6HH51o@public.gmane.org>, "Anna, Suman" <s-anna-l0cyMroinI0@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, mollie.wu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Tetsuya Takinishi <t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jassi,

On 1 August 2014 08:31, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Introduce common framework for client/protocol drivers and
> controller drivers of Inter-Processor-Communication (IPC).
>
> Client driver developers should have a look at
>  include/linux/mailbox_client.h to understand the part of
> the API exposed to client drivers.
> Similarly controller driver developers should have a look
> at include/linux/mailbox_controller.h
>
> Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  MAINTAINERS                        |   8 +
>  drivers/mailbox/Makefile           |   4 +
>  drivers/mailbox/mailbox.c          | 466 +++++++++++++++++++++++++++++++++++++
>  include/linux/mailbox_client.h     |  46 ++++
>  include/linux/mailbox_controller.h | 135 +++++++++++
>  5 files changed, 659 insertions(+)
>  create mode 100644 drivers/mailbox/mailbox.c
>  create mode 100644 include/linux/mailbox_client.h
>  create mode 100644 include/linux/mailbox_controller.h
>

[..]

> +
> +static void poll_txdone(unsigned long data)
> +{
> +       struct mbox_controller *mbox = (struct mbox_controller *)data;
> +       bool txdone, resched = false;
> +       int i;
> +
> +       for (i = 0; i < mbox->num_chans; i++) {
> +               struct mbox_chan *chan = &mbox->chans[i];
> +
> +               if (chan->active_req && chan->cl) {
> +                       resched = true;
> +                       txdone = chan->mbox->ops->last_tx_done(chan);
> +                       if (txdone)
> +                               tx_tick(chan, 0);
> +               }
> +       }
> +
> +       if (resched)
> +               mod_timer(&mbox->poll, jiffies +
> +                               msecs_to_jiffies(mbox->period));

While preparing a different patch which uses the Mbox framework, I
noticed that mbox->period might not be initialized anywhere. Also, how
is mbox->txpoll_period to be used? It appears from the description of
txpoll_period in mbox_controller.h that you'd want to use that value
in the mod_timer above, or equate the two somewhere in the controller
registration or eliminate one of the two. FWIW I also looked at your
code in [1].


Thanks,
Ashwin

[1] - http://git.linaro.org/landing-teams/working/fujitsu/integration.git/shortlog/refs/heads/mailbox-for-next
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
