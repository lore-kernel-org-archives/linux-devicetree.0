From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: Re: [PATCH_V3 1/3] dt-bindings: dma: Add binding for jz4780-dma
Date: Fri, 27 Feb 2015 09:20:38 +0000
Message-ID: <54F036E6.9010700@imgtec.com>
References: <1424954614-12589-1-git-send-email-Zubair.Kakakhel@imgtec.com>	<1424954614-12589-2-git-send-email-Zubair.Kakakhel@imgtec.com> <CAOFt0_CiopFkYECuQUczOtNoo6D8zbCOaE6attP6=KU4zicV7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOFt0_CiopFkYECuQUczOtNoo6D8zbCOaE6attP6=KU4zicV7w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Smith <alex@alex-smith.me.uk>
Cc: vinod.koul@intel.com, dan.j.williams@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Alex,

On 26/02/15 20:04, Alex Smith wrote:
> Hi Zubair,
> 
> On 26 February 2015 at 12:43, Zubair Lutfullah Kakakhel
> <Zubair.Kakakhel@imgtec.com> wrote:
>> From: Alex Smith <alex.smith@imgtec.com>
>>
>> Add device tree bindings for the DMA controller on JZ4780 SoCs, used by
>> the dma-jz4780 driver.
>>
>> Signed-off-by: Alex Smith <alex.smith@imgtec.com>
>> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>>
>> ---
>> V3 -> V2
>> Changed binding.
>> Used to be 3 DMA cells required. <&dma TX_type RX_type Reserved>
>> Now 2 DMA cells are required. <&dma Transfer_type Reserved>
>>
>> This is more common in DMA bindings.
>> And I couldn't figure any reason that 3 cells were used.
> 
> There are different request type numbers for transfers to/from the
> same device (see the JZ4780 programmers manual, page 505). While only
> having the option to specify one transfer type is OK when the driver
> is using separate channels for read/writes, I recall seeing/writing
> some other drivers which use a single channel for both reads and
> writes. This would not be possible if we can only specify one transfer
> type, you'd have to have them separate.
> 

I know. I looked at the drivers and did this on purpose.

We'd like to keep the same bindings/code for jz4740/jz4780 peripheral drivers and dma code.

Our jz47xx-mmc driver we had was the main culprit I found. As well as the jz4740-i2s one.

However, jz4740-mmc upstream driver has improved already for dma and takes two dma channels.
And the jz4740-i2s also takes two channels. One for Tx and one for Rx.

If we move to 3 cells for jz4780-dma. Then 'ideally' jz4740-dma would need 3 cells too.
Or we'd have a binding nightmare everywhere.

But when we use jz4740-mmc and jz4740-i2s, we still have to change the driver to share one channel 
or simply pass them
<&dma Tx 0 Reserved>
<&dma 0 Rx Reserved>

Which makes the binding redundant.

There isn't any particular reason a driver would need to share one channel only.
The 'special' nand/nemc channels don't have a request type.

Thanks,
ZubairLK

> Thanks,
> Alex
