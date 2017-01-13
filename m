From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v5 3/3] dmaengine: xilinx_dma: Fix race condition in the
 driver for multiple descriptor scenario
Date: Fri, 13 Jan 2017 11:52:25 +0530
Message-ID: <20170113062225.GR3573@localhost>
References: <1483771530-8545-1-git-send-email-appanad@xilinx.com>
 <1483771530-8545-4-git-send-email-appanad@xilinx.com>
 <20170110084917.GA3573@localhost>
 <C246CAC1457055469EF09E3A7AC4E11A4A6662F1@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20170113053627.GQ3573@localhost>
 <C246CAC1457055469EF09E3A7AC4E11A4A6666CF@XAP-PVEXMBX01.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <C246CAC1457055469EF09E3A7AC4E11A4A6666CF@XAP-PVEXMBX01.xlnx.xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "luis@debethencourt.com" <luis@debethencourt.com>, "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 13, 2017 at 06:00:44AM +0000, Appana Durga Kedareswara Rao wrote:
> Hi Vinod,
> 
> 	Thanks for the review...
> 
> [Snip]
> > >
> > > > On Sat, Jan 07, 2017 at 12:15:30PM +0530, Kedareswara rao Appana wrote:
> > > > > When driver is handling AXI DMA SoftIP When user submits multiple
> > > > > descriptors back to back on the S2MM(recv) side with the current
> > > > > driver flow the last buffer descriptor next bd points to a invalid
> > > > > location resulting the invalid data or errors in the DMA engine.
> > > >
> > > > Can you rephrase this, it a bit hard to understand.
> > >
> > > When DMA is receiving packets h/w expects the descriptors Should be in
> > > the form of a ring (I mean h/w buffer descriptor Next descriptor field
> > > should always point to valid address So that when DMA engine go and
> > > fetch that next descriptor it always Sees a valid address).
> > >
> > >
> > > But with the current driver implementation when user queues Multiple
> > > descriptors the last descriptor next descriptor field Pointing to an
> > > invalid location causing data corruption or Errors from the DMA h/w
> > > engine...
> > >
> > > To avoid this issue creating a Buffer descriptor Chain during Channel
> > > allocation and using those buffer descriptors for processing User
> > > requested data.
> > 
> > Is it not doable to to modify the next pointer to point to subsequent transaction.
> > IOW you are modifying tail descriptor to point to subsequent descriptor.
> > 
> > Btw how and when does DMA stop, assuming it is circular it never would, isn't
> > there a valid/stop flag associated with a descriptor which tells DMA engine what
> > to do next
> 
> There are two registers that controls the DMA transfers.
> Current descriptor and tail descriptor register. 
> When current descriptor reaches tail descriptor dma engine will pause.
> 
> When reprogramming the tail descriptor the DMA engine will starts fetching descriptors again.
> 
> But with the existing driver flow if we reprogram the tail descriptor
> The tail descriptor next descriptor field is pointing to an invalid location
> Causing data corruption...

So the solution is..?

> > Btw there is something wrong with your MUA perhaps line are titlecased for no
> > reason. This is typically behavious of non linux tool which may not be great tool
> > for this work.
> 
> Thanks for pointing it out.
> I usually replies from outlook from a windows machine.
> Will check with others in my team how they configured their mail client.

Yeah that isnt right tool for the job. See
Documentation/process/email-clients.rst

FWIW, I use mutt, vim as editor with exchange servers, seems to work well
for me now.

-- 
~Vinod
