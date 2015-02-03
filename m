From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v5 2/7] mailbox: arm_mhu: add driver for ARM MHU controller
Date: Tue, 03 Feb 2015 16:25:11 +0100
Message-ID: <4344803.3qsb2TUUaZ@wuerfel>
References: <1422955310-6542-1-git-send-email-Vincent.Yang@tw.fujitsu.com> <CAJe_ZhdL6=4bMPRitFeCqrO2jeYQuDa9071estTBd3PTbmURYA@mail.gmail.com> <20150203144611.GS8656@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150203144611.GS8656-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?utf-8?B?UGF3ZcWC?= Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 03 February 2015 14:46:11 Russell King - ARM Linux wrote:
> On Tue, Feb 03, 2015 at 08:09:34PM +0530, Jassi Brar wrote:
> > On 3 February 2015 at 18:02, Russell King - ARM Linux
> > <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> > > On Tue, Feb 03, 2015 at 05:29:23PM +0800, Vincent Yang wrote:
> > >> +static int mhu_send_data(struct mbox_chan *chan, void *data)
> > >> +{
> > >> +     struct mhu_link *mlink = chan->con_priv;
> > >> +
> > >> +     pr_debug("%s:%d\n", __func__, __LINE__);
> > >> +     if (!mhu_last_tx_done(chan)) {
> > >> +             dev_err(chan->mbox->dev, "Last TX(%d) pending!\n", mlink->irq);
> > >> +             return -EBUSY;
> > >> +     }
> > >> +
> > >> +     writel_relaxed((u32)data, mlink->tx_reg + INTR_SET_OFS);
> > >
> > > Doesn't that cause a GCC warning?
> > >
> > I don't see any, but I'll drop the cast.
> 
> A cast is probably needed.  You're right that GCC no longer warns about
> this - I'm pretty sure it used to complain about casting pointers to
> ints, and we used to need to cast to "unsigned long" first.

It definitely warns about converting an u64 to pointer or back,
and it warns on 64-bit machines about this conversion.

On a related note, I wonder why the driver actually converts a pointer to
int. I believe we have discussed this in the past but don't remember the
outcome. I had expected to see here something like:

static int mhu_send_data(struct mbox_chan *chan, void *data)
{
	struct mhu_link *mlink = chan->con_priv;
	u32 *arg = data;

	writel_relaxed(*arg, mlink->tx_reg + INTR_SET_OFS);
}

i.e. dereferencing the pointer instead of using the actual value.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
