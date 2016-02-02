From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: mailbox: Document Hi6220 mailbox
 driver
Date: Tue, 2 Feb 2016 17:22:32 +0800
Message-ID: <20160202092232.GB1915@leoy-linaro>
References: <1454333687-20421-1-git-send-email-leo.yan@linaro.org>
 <1454333687-20421-2-git-send-email-leo.yan@linaro.org>
 <20160201140828.GA32412@rob-hp-laptop>
 <20160201152333.GA22872@leoy-linaro>
 <CABb+yY0uY--40CJ6_U-AcbZ1cRUhs7MhiJZn_G-Suw=XKXdpjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY0uY--40CJ6_U-AcbZ1cRUhs7MhiJZn_G-Suw=XKXdpjg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>, Wei Xu <xuwei5@hisilicon.com>, Tyler Baker <tyler.baker@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Chen Feng <puck.chen@hisilicon.com>, Bintian Wang <bintian.wang@huawei.com>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Haojian Zhuang <haojian.zhuang@linaro.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 01, 2016 at 09:46:39PM +0530, Jassi Brar wrote:
> On Mon, Feb 1, 2016 at 8:53 PM, Leo Yan <leo.yan@linaro.org> wrote:
> > On Mon, Feb 01, 2016 at 08:08:28AM -0600, Rob Herring wrote:
> >> On Mon, Feb 01, 2016 at 09:34:44PM +0800, Leo Yan wrote:

[...]

> >> > +Optional Properties:
> >> > +--------------------
> >> > +- hi6220,mbox-tx-noirq: Flag to allow the client user of this mailbox driver
> >> > +                   to send messages without triggering a TX completion
> >> > +                   interrupt.
> >>
> >> I don't think this belongs in DT. This should be a flag the client
> >> driver sets when it sends messages.
> >
> > The client driver can set "tx_block = true" so use this flag indicates
> > the client thread should be blocked until data is transmitted.
> >
> Yes, but the 'tx_block' feature is provided by the core. The
> controller driver should not need to know how the client works.
> 
> > But low level mailbox driver can use two method to support "tx_block"
> > mode:
> >
> No, as I said, provider shouldn't care about consumers..
> 
> > - One method is to avoid using interrupt and mailbox framework will
> >   poll with mailbox's idle flag which is set by remote processor
> >   automatically;
> > - Another method is to use interrupt to notify data has been
> >   transmitted and interrupt handler will call completion function to
> >   wake up blocked client thread;
> >
> If it is possible to have either 'idle flag set' or irq generated (not
> both) by the remote, then you may sell the hi6220,mbox-tx-noirq
> property as a "f/w feature" ... but still not for the sake of
> tx_block.

Indeed and totally agree. MCU can support two modes for "automatic idle
flag" or IRQ generated mode, so we can take "hi6220,mbox-tx-noirq" as a
firmware's property.

> >> > +
> >> > +Child Nodes:
> >> > +============
> >> > +A child node is used for representing the actual sub-mailbox device that is
> >> > +used for the communication between the host processor and a remote processor.
> >> > +Each child node should have a unique node name across all the different
> >> > +mailbox device nodes.
> >> > +
> >> > +Required properties:
> >> > +--------------------
> >> > +- hi6220,mbox-tx:  sub-mailbox descriptor property defining Tx channel
> >> > +- hi6220,mbox-rx:  sub-mailbox descriptor property defining Rx channel
> >> > +
> >> > +Sub-mailbox Descriptor Data
> >> > +---------------------------
> >> > +Each of the above hi6220,mbox-tx and hi6220,mbox-rx properties should have 3
> >> > +cells of data that represent the following:
> >> > +    Cell #1 (slot_id) - mailbox slot id used either for transmitting
> >> > +                        (hi6220,mbox-tx) or for receiving (hi6220,mbox-rx)
> >> > +    Cell #2 (dst_irq) - irq identifier index number which used by MCU.
> >> > +    Cell #3 (ack_irq) - irq identifier index number with generating a tx/rx
> >> > +                        interrupt to application processor, mailbox driver
> >> > +                        used this id to acknowledge interrupt.
> >> > +
> >> > +Example:
> >> > +--------
> >> > +
> >> > +   mailbox: mailbox@F7510000 {
> >> > +           #mbox-cells = <1>;
> >> > +           compatible = "hisilicon,hi6220-mbox";
> >> > +           reg = <0x0 0xF7510000 0x0 0x1000>, /* IPC_S */
> >> > +                 <0x0 0x06DFF800 0x0 0x0800>; /* Mailbox */
> >> > +           interrupt-parent = <&gic>;
> >> > +           interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> >> > +           mbox_stub_clock: mbox_stub_clock {
> >> > +                   hi6220,mbox-rx = <0 1 10>;
> >> > +                   hi6220,mbox-tx = <1 0 11>;
> >
> This looks like meant for the client node...
>          mbox-names = "mbox-tx", "mbox-rx";
>          mboxes = <&mailbox 1 0 11>, <&mailbox 0 1 10>;

Good suggestion. Will refine with this way.

Thanks,
Leo Yan
