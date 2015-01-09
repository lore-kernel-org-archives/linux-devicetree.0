From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/8] mailbox: arm_mhu: add driver for ARM MHU controller
Date: Fri, 9 Jan 2015 20:59:20 +0530
Message-ID: <CAJe_ZheihwiEUXaRQfCFSfr9s1k59E_-0Ca8U_kNLVtRtNOnPg@mail.gmail.com>
References: <1420802369-3840-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<1420802889-4041-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<20150109125102.GL12302@n2100.arm.linux.org.uk>
	<CAJe_ZhdkF5o91HE8woAw0-DN5TuS_j6LM15NF0z6oHcQwPvnsQ@mail.gmail.com>
	<20150109152402.GQ12302@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150109152402.GQ12302-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 9 January 2015 at 20:54, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Fri, Jan 09, 2015 at 06:49:12PM +0530, Jassi Brar wrote:
>> On 9 January 2015 at 18:21, Russell King - ARM Linux
>> <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
>> > On Fri, Jan 09, 2015 at 07:28:09PM +0800, Vincent Yang wrote:
>> >> +static irqreturn_t mhu_rx_interrupt(int irq, void *p)
>> >> +{
>> >> +     struct mbox_chan *chan = p;
>> >> +     struct mhu_link *mlink = (struct mhu_link *)chan->con_priv;
>> >> +     u32 val;
>> >> +
>> >> +     pr_debug("%s:%d\n", __func__, __LINE__);
>> >> +     val = readl_relaxed(mlink->rx_reg + INTR_STAT_OFS);
>> >> +     mbox_chan_received_data(chan, (void *)val);
>> >> +
>> >> +     writel_relaxed(val, mlink->rx_reg + INTR_CLR_OFS);
>> >> +
>> >> +     return IRQ_HANDLED;
>> >
>> > What if 'val' was zero - is the interrupt still "handled" ?
>> >
>> This irq shouldn't fire unless RX_STAT register has some non-zero value.
>
> You claim this interrupt handler using IRQF_SHARED - what if another user
> of this interrupt gets stuck?  Your handler above will prevent the kernel
> recovering as it will think that you are validly processing the stuck
> interrupt each time.
>
> If it isn't shared, then don't use IRQF_SHARED.
>
> Either way, it is good practice to return IRQ_NONE if there's no work to
> be done.
>
OK, will do.

thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
