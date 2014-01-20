From: Srikanth Thokala <sriku.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dma: Add Xilinx AXI Video Direct Memory Access Engine
 driver support
Date: Mon, 20 Jan 2014 12:57:39 +0530
Message-ID: <CA+mB=1J8hoTnVuN0DaC1kXH7mWe5Ydw8o12wuBj+MyWVAVuJfw@mail.gmail.com>
References: <1389894803-4147-1-git-send-email-sthokal@xilinx.com>
	<1389894803-4147-2-git-send-email-sthokal@xilinx.com>
	<52D94006.2090104@balister.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52D94006.2090104-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philip Balister <philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Philip,

On Fri, Jan 17, 2014 at 8:06 PM, Philip Balister <philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org> wrote:
> On 01/16/2014 12:53 PM, Srikanth Thokala wrote:
>>
>> This is the driver for the AXI Video Direct Memory Access (AXI
>> VDMA) core, which is a soft Xilinx IP core that provides high-
>> bandwidth direct memory access between memory and AXI4-Stream
>> type video target peripherals. The core provides efficient two
>> dimensional DMA operations with independent asynchronous read
>> and write channel operation.
>>
>
> [snip]
>
>
>> +/**
>> + * xilinx_vdma_start - Start VDMA channel
>> + * @chan: Driver specific VDMA channel
>> + */
>> +static void xilinx_vdma_start(struct xilinx_vdma_chan *chan)
>> +{
>> +       int loop = XILINX_VDMA_LOOP_COUNT + 1;
>> +
>> +       vdma_ctrl_set(chan, XILINX_VDMA_REG_DMACR,
>> XILINX_VDMA_DMACR_RUNSTOP);
>> +
>> +       /* Wait for the hardware to start */
>> +       while (loop)
>
>
>
> loop-- ?

I will fix it in v2.

Thanks
Srikanth
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
