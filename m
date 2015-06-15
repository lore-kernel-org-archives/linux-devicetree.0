From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Subject: RE: [PATCH v2 2/2] dma: Add Xilinx zynqmp dma engine driver support
Date: Mon, 15 Jun 2015 16:04:25 +0000
Message-ID: <03CA77BA8AF6F1469AEDFBDA1322A7B7495B1048@XAP-PVEXMBX02.xlnx.xilinx.com>
References: <1434378982-30184-1-git-send-email-punnaia@xilinx.com>
 <1434378982-30184-2-git-send-email-punnaia@xilinx.com>
 <CAM=Q2ctpOhxryYqgiHDQry7Q_1noYGEX4pYg+tp+wLgV9=X1hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAM=Q2ctpOhxryYqgiHDQry7Q_1noYGEX4pYg+tp+wLgV9=X1hw@mail.gmail.com>
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
To: Shubhrajyoti Datta <omaplinuxkernel@gmail.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "kalluripunnaiahchoudary@gmail.com" <kalluripunnaiahchoudary@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, Kumar Gala <galak@codeaurora.org>, "kpc528@gmail.com" <kpc528@gmail.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Shubhrajyoti Datta [mailto:omaplinuxkernel@gmail.com]
> Sent: Monday, June 15, 2015 8:35 PM
> To: Punnaiah Choudary Kalluri
> Cc: robh+dt@kernel.org; pawel.moll@arm.com; mark.rutland@arm.com;
> ijc+devicetree@hellion.org.uk; Kumar Gala; Michal Simek; Soren Brinkmann;
> vinod.koul@intel.com; dan.j.williams@intel.com;
> devicetree@vger.kernel.org; Linux Kernel Mailing List; kpc528@gmail.com;
> kalluripunnaiahchoudary@gmail.com; dmaengine@vger.kernel.org;
> Punnaiah Choudary Kalluri; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH v2 2/2] dma: Add Xilinx zynqmp dma engine driver
> support
> 
> On Mon, Jun 15, 2015 at 8:06 PM, Punnaiah Choudary Kalluri
> <punnaiah.choudary.kalluri@xilinx.com> wrote:
> > Added the basic driver for zynqmp dma engine used in Zynq
> > UltraScale+ MPSoC. The initial release of this driver supports
> > only memory to memory transfers.
> >
> > Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> > ---
> <snip>
> 
> > +/**
> > + * zynqmp_dma_chan_is_idle - Provides the channel idle status
> > + * @chan: ZynqMP DMA DMA channel pointer
> > + *
> > + * Return: '1' if the channel is idle otherwise '0'
> > + */
> > +static int zynqmp_dma_chan_is_idle(struct zynqmp_dma_chan *chan)
> 
> maybe this could return bool.

Ok. I will modify the return type.

Regards,
Punnaiah
> 
> > +{
> > +       u32 regval;
> > +
> > +       regval = readl(chan->regs + STATUS);
> > +       if (regval & STATUS_BUSY)
> > +               return 0;
> > +
> > +       return 1;
> > +}
> > +
