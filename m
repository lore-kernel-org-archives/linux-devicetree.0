From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/2] dmaengine: Add driver for IMG MDC
Date: Thu, 13 Nov 2014 15:40:30 -0800
Message-ID: <CAL1qeaE7BixrsBn5EUMXOb4wweV4ARXc8T9AegNrauL=uJ=SqA@mail.gmail.com>
References: <1415912288-26926-1-git-send-email-abrestic@chromium.org>
	<11336807.gWpZoH7Aih@wuerfel>
	<CAL1qeaGvaHmfCHAhVejEqtV-dMVTEGprZJZPOevOmXaSyf8Uyw@mail.gmail.com>
	<23608147.9L5xhJDu6b@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <23608147.9L5xhJDu6b@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Damien Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 13, 2014 at 3:14 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 13 November 2014 15:07:06 Andrew Bresticker wrote:
>> On Thu, Nov 13, 2014 at 2:13 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> > On Thursday 13 November 2014 12:58:08 Andrew Bresticker wrote:
>> >> +
>> >> +static bool mdc_filter_fn(struct dma_chan *chan, void *fn_param)
>> >> +{
>> >> +       struct mdc_filter_data *data = fn_param;
>> >> +       struct mdc_chan *mchan;
>> >> +
>> >> +       if (chan->device->dev->driver == &mdc_dma_driver.driver) {
>> >> +               mchan = to_mdc_chan(chan);
>> >> +               if (!(data->mask & BIT(mchan->chan_nr)))
>> >> +                       return false;
>> >> +               mchan->periph = data->periph;
>> >> +               mchan->thread = data->thread;
>> >> +               return true;
>> >> +       }
>> >> +       return false;
>> >> +}
>> >> +
>> >> +static struct dma_chan *mdc_of_xlate(struct of_phandle_args *dma_spec,
>> >> +                                    struct of_dma *ofdma)
>> >> +{
>> >> +       struct mdc_dma *mdma = ofdma->of_dma_data;
>> >> +       struct mdc_filter_data data;
>> >> +
>> >> +       if (dma_spec->args_count != 3)
>> >> +               return NULL;
>> >> +
>> >> +       data.periph = dma_spec->args[0];
>> >> +       data.mask = dma_spec->args[1];
>> >> +       data.thread = dma_spec->args[2];
>> >> +
>> >> +       return dma_request_channel(mdma->dma_dev.cap_mask, mdc_filter_fn,
>> >> +                                  &data);
>> >> +}
>> >
>> > The filter function is broken if you ever have multiple instances
>> > of the device. Better avoid calling dma_request_channel and scan
>> > the channels that the device knows about.
>>
>> It seems unlikely that there would be multiple instances of this IP in
>> a system, but it doesn't hurt to be safe.  Perhaps instead of
>> iterating through the list here I could extend struct mdc_filter_data
>> to include a pointer to the struct dma_device corresponding to this
>> instance of the MDC and compare based on that.
>
> You still need to iterate through all channels of all dma engines
> in the system. Since you have the pointer to the engine here,
> just go through the channels that you already know are there.
> Unfortunately, the mask prevents you from just using
> dma_get_any_slave_channel(), that would be the easiest approach
> that we prefer in most drivers these days.

Ok, I'll do that then.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
