From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] dma: Add Keystone Packet DMA Engine driver
Date: Tue, 18 Mar 2014 12:22:05 -0400
Message-ID: <532872AD.2090804@ti.com>
References: <1393628200-12317-1-git-send-email-santosh.shilimkar@ti.com> <53274F0B.5070201@ti.com> <20140318152444.GC1976@intel.com> <4424649.TIey3uEAed@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4424649.TIey3uEAed@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sandeep Nair <sandeep_n-l0cyMroinI0@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 18 March 2014 11:38 AM, Arnd Bergmann wrote:
> On Tuesday 18 March 2014 20:54:44 Vinod Koul wrote:
>> On Mon, Mar 17, 2014 at 03:37:47PM -0400, Santosh Shilimkar wrote:
>>>>> To simplify this bit more, you can think of this as DMA channels, flows
>>>>> are allocated and DMA channels are enabled by DMA engine and they remains
>>>>> enabled always as long as the channel in use. Enablling dma channel
>>>>> actually don't start the DMA transfer but just sets up the connection/pipe
>>>>> with peripheral and memory and vice a versa.
>>>>>
>>>>> All the descriptor management, triggering, sending completion interrupt or
>>>>> hardware signal to DMAEngine all managed by centralised QMSS.
>>>>>
>>>>> Actual copy of data is still done by DMA hardware but its completely
>>>>> transparent to software. DMAEngine hardware takes care of that in the
>>>>> backyard.
>>>> So you will use the dmaengine just for setting up the controller. Not for actual
>>>> transfers. Those would be governed by the QMSS, right?
>>>>
>>> Correct.
>>>  
>>>> This means that someone expecting to use dmaengine API will get confused about
>>>> this and doing part (alloc) thru dmaengine and rest (transfers) using some other
>>>> API. This brings to me the design approach, does it really make sense creating
>>>> dmaengine driver for this when we are not fully complying to the API
>>>>
>>> Thats fair. The rationale behind usage of DMEngine was that its the closest
>>> available subsystem which can be leveraged for this hardware. We can
>>> pretty much use all the standard DMAEngine device tree parsing as well as
>>> the config API to setup DMAs. 
>>>
>>> I think you made your stand clear, just to confirm, you don't prefer this
>>> driver to be a DMAEngine driver considering it doesn't fully complying to
>>> the APIs. We could document the deviation of 'transfer' handling to avoid
>>> any confusion.
>> Yup, a user will just get confused as the driver doenst conform the dmaengine
>> API. Unless someone comes up witha  strong argument on why it should be
>> dmaengine driver and what befits we see form such a model, i would like a
>> damengine driver to comply to standard API and usage.
> 
> I think it would be possible to turn the QMSS driver into a library and have
> the packet DMA code use the proper dmaengine API by calling into that code.
> 
> The main user of packet DMA (the ethernet driver) would however still have
> to call into QMSS directly, so I'm not sure if it's worth the effort.
> 
Its not. Am going to move this driver along with QMSS which is one
of the options we discussed.

Regards,
Santosh

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
