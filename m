From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/7] mailbox: arm_mhu: add driver for ARM MHU controller
Date: Tue, 3 Feb 2015 20:09:34 +0530
Message-ID: <CAJe_ZhdL6=4bMPRitFeCqrO2jeYQuDa9071estTBd3PTbmURYA@mail.gmail.com>
References: <1422955310-6542-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<1422955763-6630-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<20150203123216.GO8656@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150203123216.GO8656-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 3 February 2015 at 18:02, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Tue, Feb 03, 2015 at 05:29:23PM +0800, Vincent Yang wrote:
>> +static int mhu_send_data(struct mbox_chan *chan, void *data)
>> +{
>> +     struct mhu_link *mlink = chan->con_priv;
>> +
>> +     pr_debug("%s:%d\n", __func__, __LINE__);
>> +     if (!mhu_last_tx_done(chan)) {
>> +             dev_err(chan->mbox->dev, "Last TX(%d) pending!\n", mlink->irq);
>> +             return -EBUSY;
>> +     }
>> +
>> +     writel_relaxed((u32)data, mlink->tx_reg + INTR_SET_OFS);
>
> Doesn't that cause a GCC warning?
>
I don't see any, but I'll drop the cast.

>> +static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
>> +{
>> +     int i, err;
>> +     struct arm_mhu *mhu;
>> +     struct device *dev = &adev->dev;
>> +     int mhu_reg[3] = {0x0, 0x20, 0x200};
>> +
>> +     err = amba_request_regions(adev, NULL);
>> +     if (err)
>> +             return err;
>> +
>> +     /* Allocate memory for device */
>> +     mhu = devm_kzalloc(dev, sizeof(*mhu), GFP_KERNEL);
>> +     if (!mhu)
>> +             return -ENOMEM;
>> +
>> +     mhu->base = devm_ioremap(dev, adev->res.start,
>> +                              resource_size(&adev->res));
>> +     if (!mhu->base) {
>> +             dev_err(dev, "ioremap failed\n");
>> +             return -ENXIO;
>
>         mhu->base = devm_ioremap_resource(dev, &adev->res);
>         if (IS_ERR(mhu->base)) {
>                 dev_err(dev, "ioremap failed\n");
>                 return PTR_ERR(mhu->base);
>
OK

>> +
>> +     err = mbox_controller_register(&mhu->mbox);
>> +     if (err) {
>> +             dev_err(dev, "Failed to register mailboxes %d\n", err);
>> +             return err;
>> +     }
>> +
>> +     dev_err(dev, "ARM MHU Mailbox registered\n");
>
> Why is this an error?
>
ouch! this sneaked in from debugging code. Will make it info.

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
