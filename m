From: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Subject: RE: [PATCH v11 2/2] dmaengine: Add Xilinx zynqmp dma engine driver
 support
Date: Thu, 30 Jun 2016 05:23:30 +0000
Message-ID: <C246CAC1457055469EF09E3A7AC4E11A4A5BA435@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1465486667-30737-1-git-send-email-appanad@xilinx.com>
 <1465486667-30737-2-git-send-email-appanad@xilinx.com>
 <20160630042653.GM14945@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160630042653.GM14945@localhost>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "luis@debethencourt.com" <luis@debethencourt.com>, "galak@codeaurora.org" <galak@codeaurora.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, Punnaiah Choudary Kalluri <punnaia@xilinx.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

> 
> On Thu, Jun 09, 2016 at 09:07:47PM +0530, Kedareswara rao Appana wrote:
> 
> > +	dma_set_mask(&pdev->dev, DMA_BIT_MASK(44));
> > +	dma_cap_set(DMA_SG, zdev->common.cap_mask);
> > +	dma_cap_set(DMA_MEMCPY, zdev->common.cap_mask);
> 
> >  /**
> > + * struct zynqmp_dma_config - ZYNQMP DMA Configuration structure
> > + * @ovrfetch: Overfetch status
> > + * @has_sg: Support scatter gather transfers
> > + * @ratectrl: Rate control value
> > + * @src_issue: Out standing transactions on source
> > + * @src_burst_len: Source burst length
> > + * @dst_burst_len: Dest burst length
> > + */
> 
> As discussed in other thread as well, this is no-go for memcpy. Please come back
> after removing this
> 
> For slave usages use the dma_slave_config

Sure will fix in the next version...

Regards,
Kedar.

> 
> --
> ~Vinod
