From: Alexander Popov <a13xp0p0v88@gmail.com>
Subject: Re: [PATCH RFC v2 2/5] dma: mpc512x: add support for peripheral
 transfers
Date: Wed, 31 Jul 2013 11:46:09 +0400
Message-ID: <CAF0T0X4pR_uAZq-iGrrJS=oGDFzKBj-CLELyu_fLbDzk2dnroA@mail.gmail.com>
References: <1373642781-32631-1-git-send-email-gsi@denx.de>
 <1373803321-11628-1-git-send-email-gsi@denx.de>
 <1373803321-11628-3-git-send-email-gsi@denx.de>
 <51E5226D.9050100@metafoo.de>
 <20130717104234.GJ7080@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20130717104234.GJ7080@book.gsilab.sittig.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Lars-Peter Clausen <lars@metafoo.de>, linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, Alexander Popov <a13xp0p0v88@gmail.com>, Dan Williams <djbw@fb.com>, Vinod Koul <vinod.koul@intel.com>, Arnd Bergmann <arnd@arndb.de>, Anatolij Gustschin <agust@denx.de>
List-Id: devicetree@vger.kernel.org

Hello everyone!

I've just sent v3 of part 1 and 2 of RFC series:
https://patchwork.kernel.org/patch/2836123/
https://patchwork.kernel.org/patch/2836124/


2013/7/17 Gerhard Sittig <gsi@denx.de>:
> OK, so the need for explicit start in software or external
> request by the peripheral remains, but the condition for the
> choice is different. It might become a flag attached to the DMA
> channel, that gets setup in the prep routines (memory and slave
> access each use their own prep calls) and gets evaluated in
> execute.

I made a flag "will_access_peripheral" be set up in the device control callback.


> non-MDDRC channels can get used for memory
> transfers as well, which your description of the the former use
> suggests, when slave support was absent.

I tested v3 on MPC5125 with SCLPC driver (transfers between dev and
mem work fine)
and dmatest module (all 64 DMA channels can perform mem-to-mem transfers).


>> > +   mchan = dma_chan_to_mpc_dma_chan(chan);
>> > +   switch (cmd) {
>> > +   case DMA_TERMINATE_ALL:
>> > +           /* disable channel requests */
>> > +           mdma = dma_chan_to_mpc_dma(chan);
>> > +           out_8(&mdma->regs->dmacerq, chan->chan_id);
>> > +           list_splice_tail_init(&mchan->prepared, &mchan->free);
>> > +           list_splice_tail_init(&mchan->queued, &mchan->free);
>> > +           list_splice_tail_init(&mchan->active, &mchan->free);
>>
>> This probably need locking.
>
> Ah, yes.  It needs to grab the same lock as all the other list
> manipulations in the driver's source.

Fixed that too.

Best regards,
Alexander.
