From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 2/2] dmaengine: Add DW AXI DMAC driver
Date: Tue, 25 Apr 2017 21:12:21 +0300
Message-ID: <1493143941.24567.196.camel@linux.intel.com>
References: <1491573855-1039-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
         <1491573855-1039-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
         <1492518695.24567.56.camel@linux.intel.com>
         <1492784977.16657.6.camel@synopsys.com>
         <1492787583.24567.120.camel@linux.intel.com>
         <1493049305.25985.4.camel@synopsys.com>
         <1493052970.24567.168.camel@linux.intel.com>
         <1493133369.25985.10.camel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1493133369.25985.10.camel@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: "vinod.koul@intel.com" <vinod.koul@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "Alexey.Brodkin@synopsys.com" <Alexey.Brodkin@synopsys.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2017-04-25 at 15:16 +0000, Eugeniy Paltsev wrote:
> On Mon, 2017-04-24 at 19:56 +0300, Andy Shevchenko wrote:
> > On Mon, 2017-04-24 at 15:55 +0000, Eugeniy Paltsev wrote:
> > > Hi,
> > > On Fri, 2017-04-21 at 18:13 +0300, Andy Shevchenko wrote:
> > > > On Fri, 2017-04-21 at 14:29 +0000, Eugeniy Paltsev wrote:
> > > > > On Tue, 2017-04-18 at 15:31 +0300, Andy Shevchenko wrote:
> > > > > > On Fri, 2017-04-07 at 17:04 +0300, Eugeniy Paltsev wrote:

> > > This IP can be (ans is) configured with small block size.
> > > (note, that I am not saying about runtime HW configuration)
> > > 
> > > And there is opportunity what we can't use sg_list directly and
> > > need
> > > to
> > > split sg_list to a smaller chunks.
> > 
> > That's what I have referred quite ago. The driver should provide an
> > interface to tell potential caller what maximum block (number of
> > items
> > with given bus width) it supports.
> > 
> > We have struct dma_parms in struct device, but what we actually need
> > is
> > to support similar on per channel basis in DMAengine framework.
> > 
> > So, instead of working around this I recommend either to implement
> > it
> > properly or rely on the fact that in the future someone eventually
> > does that for you.
> > 
> > Each driver which has this re-splitting mechanism should be cleaned
> > up and refactored.
> 
> I still can't see any pros of this implementation.
> There is no performance profit: we anyway need to re-splitt sg_list
> (but now in dma-user driver instead of dma driver)

There is, you seems don't see it.

Currently:
 User:
  prepares sg-list

 DMA driver:
  a) iterates over it, and
  b) if sg_len is bigger than block it re-splits it.

New approach:

 User:
  a) gets DMA channel and its properties
  b) prepares sg-list taking into consideration block size

 DMA driver:
  a) uses the given sg-list and for sake of simplicity bails out if
something wrong with it

So, it means in some cases (where entry is big enough) we have to
prepare list *and* re-split it. It's really performance consuming (like
UART case where buffer is small enough and latency like above matters).

> If we want to use same descriptors several times we just can use
> DMA_CTRL_REUSE option - the descriptors will be created one time and
> re-splitting will be сompleted only one time.

There are two type of descriptors: SW and HW. That flag about SW
descriptor, so, it in most cases has nothing to do with the actual entry
size.

> But there are cons of this implementation:
> we need to implement re-splitting mechanism in each place we use dma
> instead of one dma driver. So there are more places for bugs and
> etc...

No, you completely missed the point.

With new approach we do the preparation only once per descriptor /
transfer and in one place where the sg-list is created.

> > > > Better not to pretend that it has been processed successfully.
> > > > Don't
> > > > call callback on it and set its status to DMA_ERROR (that's why
> > > > descriptors in many drivers have dma_status field). When user
> > > > asks for
> > > > status (using cookie) the saved value would be returned until
> > > > descriptor
> > > > is active.
> > > > 
> > > > Do you have some other workflow in mind?
> > > 
> > > Hmm...
> > > Do you mean I should left error descriptors in desc_issued list
> > > or I should create another list (like desc_error) in my driver and
> > > move
> > > error descriptors to desc_error list?
> > > 
> > > And when exactly should I free error descriptors?
> > 
> > See below.
> > 
> > > I checked hsu/hsu.c dma driver implementation:
> > >    vdma descriptor is deleted from desc_issued list when transfer
> > >    starts. When descriptor marked as error descriptor
> > >    vchan_cookie_complete isn't called for this descriptor. And
> > > this
> > >    descriptor isn't placed in any list. So error descriptors
> > > *never*
> > >    will be freed.
> > >    I don't actually like this approach.
> > 
> > Descriptor is active until terminate_all() is called or new
> > descriptor
> > is supplied. So, the caller has a quite time to check on it.
> > 
> > So, what's wrong on it by your opinion?
> 
> Hmm, this looks OK. (In my example (hsu/hsu.c driver) error
> descriptors
> are not freed even after terminate_all is called)

If it's active it will be freed.
Otherwise caller should check somewhere that descriptor fails.

But actually this is fragile and we need to monitor failed descriptors.
Thanks for reporting.

> 
> > Of course, if you want to keep by some reason (should be stated what
> > the reason in comment) erred descriptors, you can do that.
> 
> So, I'll create desc_error list and store failed descriptors in this
> list until terminate_all() is called.
> Is it OK implementation?

Nope, we need to amend virt-chan API for that. I'm on it. Will send a
series soon.

> There is a simple reason:
> I had to do same actions in probe/remove as in
> runtime_resume/runtime_suspend.
> (like enabling clock, enabling dma)

> If my driver is build with RUNTIME_PM this actions will be
> automatically handled by runtime pm (clock and dma will be enabled
> before using and disabled after using).
> Otherwise, if my driver is build without RUNTIME_PM clock and dma will
> be enabled only one time - when ->probe() is called.
> So I use runtime_resume callback directly for this purpose (because if
> my driver is build without RUNTIME_PM this callback wiil not be called
> at all)

Okay, The best way to do that is to create functions which take struct
chip and do that. Re-use them in runtime PM hooks.

But you still need to learn a bit about runtime PM. There is no harm to
call clk_enable() twice in a raw if you guarantee you do the opposite
(twice call clk_disable()) on tear down.

Also I would reconsider clock (un)preparation in those hooks. Why do you
need that part? It's resource consuming.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
