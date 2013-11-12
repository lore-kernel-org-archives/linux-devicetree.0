From: Hongbo Zhang <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v11 3/3] DMA: Freescale: update driver to support 8-channel
 DMA engine
Date: Tue, 12 Nov 2013 15:05:43 +0800
Message-ID: <5281D347.3020903@freescale.com>
References: <1380188023-3936-1-git-send-email-hongbo.zhang@freescale.com> <1380188023-3936-4-git-send-email-hongbo.zhang@freescale.com> <525F7C18.3010409@freescale.com> <5278587F.7090500@freescale.com> <CAA9_cme3c7SjH3iio0oR3FHpfoMzgrBDO-2k_Yf68G-AgFNqfA@mail.gmail.com> <52809F67.20901@freescale.com> <CAPcyv4h00zGc2=ZLwnCpP3WTQ8JbFteV-torU+qCo98YXrfq5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPcyv4h00zGc2=ZLwnCpP3WTQ8JbFteV-torU+qCo98YXrfq5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "Koul, Vinod" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/12/2013 08:09 AM, Dan Williams wrote:
> On Mon, Nov 11, 2013 at 1:12 AM, Hongbo Zhang
> <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>>>>>> diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
>>>>>> index 49e8fbd..16a9a48 100644
>>>>>> --- a/drivers/dma/fsldma.c
>>>>>> +++ b/drivers/dma/fsldma.c
>>>>>> @@ -1261,7 +1261,9 @@ static int fsl_dma_chan_probe(struct
>>>>>> fsldma_device
>>>>>> *fdev,
>>>>>>         WARN_ON(fdev->feature != chan->feature);
>>>>>>           chan->dev = fdev->dev;
>>>>>> -    chan->id = ((res.start - 0x100) & 0xfff) >> 7;
>>>>>> +    chan->id = (res.start & 0xfff) < 0x300 ?
>>>>>> +           ((res.start - 0x100) & 0xfff) >> 7 :
>>>>>> +           ((res.start - 0x200) & 0xfff) >> 7;
>>>>>>         if (chan->id >= FSL_DMA_MAX_CHANS_PER_DEVICE) {
>>> Isn't it a bit fragile to have this based on the resource address?
>>> Can't device tree tell you the channel id directly by an index into
>>> the "dma0: dma@100300" node?
>>
>> Yes, both this way and putting a "cell-index" into device tree work.
>> This won't be fragile, because the resource address should always be defined
>> correctly, otherwise even if we can tell a channel id by "cell-index" but
>> with wrong resource address, nothing will work.
>> This piece of code only doesn't seem as neat as using "cell-index", but we
>> prefer the style that let the device tree describes as true as what hardware
>> really has. This doesn't mean "cell-index" isn't acceptable, if it is
>> necessary and unavoidable, we can send another patch to add it, but
>> currently there is no need and we don't have to do this.
>>
> I'm pointing it out because we just had a bug fix to another driver
> motivated by the fact that resource addresses may move from one
> implementation to another, whereas the cell index provided by device
> tree is static.  Just a note, no need to fix it now.

Get it, and will remember it, thank you Dan.
> --
> Dan
>



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
