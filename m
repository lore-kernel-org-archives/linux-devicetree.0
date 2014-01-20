From: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCHv10 2/2] dma: Add Freescale eDMA engine driver support
Date: Mon, 20 Jan 2014 14:26:39 +0000
Message-ID: <d2d7153f082c46ee93d62fe56e6a80db@BL2PR03MB467.namprd03.prod.outlook.com>
References: <1389938684-29467-1-git-send-email-b35083@freescale.com>
 <1389938684-29467-3-git-send-email-b35083@freescale.com>
 <20140120074019.GF26823@intel.com>
 <43d79ce905e24e9bb58ef49ac19db7d7@BL2PR03MB467.namprd03.prod.outlook.com>
 <20140120093541.GX26823@intel.com>
 <f173c2531461478899818365e06df437@BL2PR03MB467.namprd03.prod.outlook.com>,<20140120102007.GC26823@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140120102007.GC26823-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Huan Wang <Huan.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


________________________________________
From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sent: Monday, January 20, 2014 6:20 PM
To: Lu Jingchang-B35083
Cc: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org; arnd-r2nGTMty4D4@public.gmane.org; shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; pawel.moll-5wv7dgnIgG8@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org; swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Wang Huan-B18965
Subject: Re: [PATCHv10 2/2] dma: Add Freescale eDMA engine driver support

On Mon, Jan 20, 2014 at 11:05:03AM +0000, Jingchang Lu wrote:
>> > > > > +     struct fsl_edma_chan *fsl_chan = to_fsl_edma_chan(chan);
>> > > > > +     struct dma_slave_config *cfg = (void *)arg;
>> > > > > +     unsigned long flags;
>> > > > > +     LIST_HEAD(head);
>> > > > > +
>> > > > > +     switch (cmd) {
>> > > > > +     case DMA_TERMINATE_ALL:
>> > > > > +             spin_lock_irqsave(&fsl_chan->vchan.lock, flags);
>> > > > > +             fsl_edma_disable_request(fsl_chan);
>> > > > > +             fsl_chan->edesc = NULL;
>> > > > > +             vchan_get_all_descriptors(&fsl_chan->vchan, &head);
>> > > > > +             spin_unlock_irqrestore(&fsl_chan->vchan.lock, flags);
>> > > > > +             vchan_dma_desc_free_list(&fsl_chan->vchan, &head);
>> > > > > +             return 0;
> >> > > well what happens to the current ongoing transactions, i don't see
> >> those
> >> > > getting
> >> > > terminated?
> >> > The fsl_edma_disable_request(fsl_chan) would end the channel's ongoing
> >> transaction, then
> >> > the eDMA would not response to device dma request, and the
> >> vchan_dma_desc_free_list()
> >> > will release all associate memory. Thanks.
> >> Can you explain a bit more how terminate will happen, given taht you are
> >> using
> >> same thing for pause?
>> It works just like an interrupt controller on irq enable and disable. It has a register called
>> set/clear enable request register(SERQ/CERQ) to enable or disable the DMA request for a given
>> channel. It won't transfer data any more with the enable request register cleared. So for the
>> pause and terminate the pause is the same. And there is no other way to stop the channels.
>well then it is not pause! If you jave no way to stop the channel, you cant
>claim to support pause and resume!

>>Also, for terminate this will be problematic. Assuming you are doing transfers
>and terminate is invoked. Then you will disable irq. The transfers may get stuck
>and periphral clock may go away after transfer so current transaction never gets
>completed, how do we recovery from this?
The clear enable request would isolate the dma request from the eDMA engine, 
and the eDMA engine could not receive any dma request from the device any more,
so the transmission is stopped, all the channel parameters will not be changed any more, and the
eDMA engine will not do any transmission for that channel until the request is enabled
by set enable request. And the channel parameters could be changed when the enable request
cleared.
We have tested the eDMA drive with the SAI audio driver which uses the cyclic dma tranfer, and it
work well.
Thanks.

>Alstly, have you looked at edma driver already existing, any similarties in teh
>controller with that?
Yes, I have notice the TI's edma driver, but they are not the same. So we implement this driver.

Best Regards,
Jingchang--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
