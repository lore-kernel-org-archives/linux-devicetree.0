From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 2/7] mailbox: arm_mhu: add driver for ARM MHU controller
Date: Wed, 18 Mar 2015 18:49:48 +0530
Message-ID: <CABb+yY0qRSocL-ePosUzszAh4X6161ve8_qUq4VizbLWMAmMCQ@mail.gmail.com>
References: <1425466367-30556-1-git-send-email-vincent.yang@socionext.com>
	<1425466884-30648-1-git-send-email-vincent.yang@socionext.com>
	<55095297.5060605@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55095297.5060605-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Vincent Yang <vincent.cw.yang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Vincent Yang <vincent.yang-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 18, 2015 at 3:55 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>
>> +static int mhu_send_data(struct mbox_chan *chan, void *data)
>> +{
>> +       struct mhu_link *mlink = chan->con_priv;
>> +       u32 *arg = data;
>
> Arnd doesn't like this and had suggestions in some other thread.
>
No, Arnd suggested doing it this way. And another platform's driver
was made to do this way.

>> +       writel_relaxed(*arg, mlink->tx_reg + INTR_SET_OFS);
>> +
>> +       return 0;
>> +}
>> +
>> +static int mhu_startup(struct mbox_chan *chan)
>> +{
>> +       struct mhu_link *mlink = chan->con_priv;
>> +       u32 val;
>> +       int ret;
>> +
>> +       val = readl_relaxed(mlink->tx_reg + INTR_STAT_OFS);
>> +       writel_relaxed(val, mlink->tx_reg + INTR_CLR_OFS);
>> +
>> +       ret = request_irq(mlink->irq, mhu_rx_interrupt,
>> +                         IRQF_SHARED, "mhu_link", chan);
>
>
> Any reason we can't move this to probe and have {en,dis}able_irq here if
> needed. I has seen it was too heavy to have these especially when
> sending small packets.
>
I see you used to do memcpy in irq-handler
https://git.linaro.org/landing-teams/working/arm/kernel.git/blob/HEAD:/drivers/mailbox/arm_mhu.c
perhaps you were using your old driver?

If you use this new driver, and send packets so often that
request-release irq has effect, maybe should hold the mailbox
reference for lifetime. I remember suggesting you that already and I
remember you said that's how it was.

-Jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
