From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 3/3] fpga manager: Adding FPGA Manager support for Xilinx
 Zynq 7000
Date: Mon, 12 Oct 2015 13:16:23 +0200
Message-ID: <561B9687.1070103@xilinx.com>
References: <1444344307-22509-1-git-send-email-moritz.fischer@ettus.com>
 <1444344307-22509-4-git-send-email-moritz.fischer@ettus.com>
 <20151009163336.GM10631@jcartwri.amer.corp.natinst.com>
 <CAAtXAHea7GZDLez5kYas2PFQ-=KmS_on8WxFDCuvVb4Nh05a_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAAtXAHea7GZDLez5kYas2PFQ-=KmS_on8WxFDCuvVb4Nh05a_w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, "pawel.moll@arm.com" <pawel.moll@arm.com>, ijc+devicetree@hellion.org.uk, Alan Tull <atull@opensource.altera.com>, Greg KH <gregkh@linuxfoundation.org>, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kumar Gala <galak@codeaurora.org>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org


>>> +static int zynq_fpga_ops_write(struct fpga_manager *mgr,
>>> +                            const char *buf, size_t count)
>>> +{
>>> +     struct zynq_fpga_priv *priv;
>>> +     int err;
>>> +     char *kbuf;
>>> +     size_t i, in_count;
>>> +     dma_addr_t dma_addr;
>>> +     u32 transfer_length = 0;
>>> +     bool endian_swap = false;
>>> +
>>> +     in_count = count;
>>> +     priv = mgr->priv;
>>> +
>>> +     kbuf = dma_alloc_coherent(priv->dev, count, &dma_addr, GFP_KERNEL);
>>> +     if (!kbuf)
>>> +             return -ENOMEM;
>>> +
>>> +     memcpy(kbuf, buf, count);
>>> +
>>> +     /* look for the sync word */
>>> +     for (i = 0; i < count - 4; i++) {
>>> +             if (memcmp(kbuf + i, "\x66\x55\x99\xAA", 4) == 0) {
>>> +                     dev_dbg(priv->dev, "Found normal sync word\n");
>>> +                     endian_swap = false;
>>> +                     break;
>>> +             }

This is bin format

>>> +             if (memcmp(kbuf + i, "\xAA\x99\x55\x66", 4) == 0) {
>>> +                     dev_dbg(priv->dev, "Found swapped sync word\n");
>>> +                     endian_swap = true;
>>> +                     break;
>>> +             }

This is bit format from header

>>> +     }
>>
>> How much control do we have over mandating the format of firmware at
>> this point?  It'd be swell if we could just mandate a specific
>> endianness, and leave this munging to usermode.
> 
> That's a good question. Personally I do only care about one of both,
> but that's just because I get to decide for my targets...
> Opinions from the Xilinx guys?

Don't know full history about this but in past bitstream in BIT format
was used. Which is header (partially decoding in u-boot for example)
with data.
On zynq native format is BIN which is format without header and data is
swapped.
This code just detects which format is used. If BIT, header is skipped
and data is swapped to BIN format.

Back to origin question if this is something what can be handled from
user space. And answer is - yes it can be handled there.
But based on my experience it is very useful to be able to handle BIT
because it is built by tools by default.
Also with BIN format you are loosing record what this data bitstream
targets. Header in BIT gives you at least some ideas.

Thanks,
Michal
