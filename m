From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Subject: RE: [PATCH v10 2/2] dmaengine: Add Xilinx zynqmp dma engine driver
 support
Date: Tue, 21 Jun 2016 17:29:42 +0000
Message-ID: <03CA77BA8AF6F1469AEDFBDA1322A7B74A18BB82@XAP-PVEXMBX02.xlnx.xilinx.com>
References: <1464765839-29018-1-git-send-email-appanad@xilinx.com>
 <1464765839-29018-2-git-send-email-appanad@xilinx.com>
 <20160607070841.GJ16910@localhost>
 <C246CAC1457055469EF09E3A7AC4E11A4A5B4FA9@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20160613055012.GC16910@localhost>
 <C246CAC1457055469EF09E3A7AC4E11A4A5B6441@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20160615165004.GC16910@localhost>
 <C246CAC1457055469EF09E3A7AC4E11A4A5B6CAD@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20160621154103.GA16910@localhost>
 <03CA77BA8AF6F1469AEDFBDA1322A7B74A18BAE8@XAP-PVEXMBX02.xlnx.xilinx.com>
 <20160621163854.GF16910@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160621163854.GF16910@localhost>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, Anirudha Sarangi <anirudh@xilinx.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Srikanth Vemula <svemula@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "luis@debethencourt.com" <luis@debethencourt.com>, "galak@codeaurora.org" <galak@codeaurora.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, Appana Durga Kedareswara Rao <appanad@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, laurent.pinchar
List-Id: devicetree@vger.kernel.org



> On Tue, Jun 21, 2016 at 04:19:38PM +0000, Punnaiah Choudary Kalluri wrote:
> > > > > > > > mode Earlier In the driver this configuration is read from the
> > > > > > > > device-tree But as per lars and your suggestion moved it as
> runtime
> > > config
> > > > > parameters.
> > > > > > >
> > > > > > > If sg mode is available why would anyone _not_ want it?
> > > > > > >
> > > > > > > I do not think there is point to have this
> > > > > >
> > > > > > You mean always keep the device in SG mode and provide an
> option
> > > For
> > > > > > simple dma mode if user want to use simple DMA mode??
> > > > >
> > > > > Yes, why would anyone want to use single if sg is available?
> > >
> > > If you have sg mode always enabled, but sg_list is size 1, that its
> > > essentially a single
> > >
> >
> > True. As we said, simple mode ha few additional features like write only
> > And read only dma. So, if user want then here is the provision.
> >
> > > Btw SPI is a slave case, not a memcpy!
> > >
> >
> > Correct. We are working on slave dma support and will patch to this driver.
> 
> And in slave cases, you can use slave config to pass the values which are
> required, so we dont need this custome interface!
> 

Ok agree with you for the scenario that I have mentioned above.

Other simple dma mode feature that I missed to explain is configuring the 
Dma descriptors. It provides a register interface for configuring the dma transaction.
So, no need to maintain the descriptors in memory and it will be useful for the system 
that are in crunch of memory.  

How do you want us to handle this case?

> > > >
> > > > >
> > > > >
> > > > > > > > src_issue:
> > > > > > > > Tells outstanding transaction on SRC.
> > > > > > >
> > > > > > > This should be read only then, right?
> > > > > >
> > > > > > It is a Read/Write register
> > > > > > http://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-
> > > ultrascal
> > > > > > e-registers.html By default it is configured for Max transactions.
> > > > > > If user want to limit it they can limit it using this config option.
> > > > >
> > > > > And why would they want that?
> > > >
> > > > Could be that there are certain IPs that my not support burst operations
> or
> > > > May not support all burst lengths it will be helpful.
> > > > Since IP is providing the feature, we are exploring it to the user.
> > > >
> > > > >
> > > > > > > > Burst_len:
> > > > > > > > Configures the burst length of the src and dst transfers...
> > > > > > >
> > > > > > > Hmmm, but you are on memcpy, so that should be programmed
> for
> > > > > throughput?
> > > > > >
> > > > > > Yes...
> > > > >
> > > > > So max burst lengths then, why would anyone configure lesser?
> > > >
> > > > Depends on the destination and source IPs.
> > >
> > > Not for memory copy
> > >
> >
> > Depends on the system and how source and destination IPs are
> interconnected.
> > Sometimes there is a limitation from interconnection also.
> > Also some flash controllers providing linear access to NAND or NOR
> memories may
> > Have limitation in burst length but still user can use memory copy with
> desired burst
> > Length.
> 
> Some of those cases are treated as slave for obvious reasons.
> 
> Please check existing solutions before inventing new ones. Everyone thinks
> that their hardware and thereby driver is a novel case, but on closer
> inspection that is usually not the case, different falvour yes, novel no!
> 
> Okay I am convince now this is not right approach. Please remove this
> custom interface and then implement slave for required slave scenarios!
>

Assume controller is having 8 channels and four of them are used for slave
Dma and others are for memcpy.
Controller didn't have the per channel priority control but providing the rate control
Mechanism. 

So, I need some interface for configuring the rate control per channel at run time irrespective
Of whether the channel is allocated for slave dma or memcpy dma.

Is it wrong having the configurable dma parameters for dma memcpy operation? We are exposing the
Hw capabilities to the user for better dma transaction management.

> >
> >
> > This email and any attachments are intended for the sole use of the named
> recipient(s) and contain(s) confidential information that may be proprietary,
> privileged or copyrighted under applicable law. If you are not the intended
> recipient, do not read, copy, or forward this email message or any
> attachments. Delete this email message and any attachments immediately.
> 
> Really!
> 

My apologies :)

Thanks,
Punnaiah
> 
> --
> ~Vinod
