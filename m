From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v5 1/3] dmaengine: xilinx_dma: Check for channel idle
 state before submitting dma descriptor
Date: Fri, 13 Jan 2017 10:59:39 +0530
Message-ID: <20170113052939.GP3573@localhost>
References: <1483771530-8545-1-git-send-email-appanad@xilinx.com>
 <1483771530-8545-2-git-send-email-appanad@xilinx.com>
 <20170110062349.GY3573@localhost>
 <C246CAC1457055469EF09E3A7AC4E11A4A666658@XAP-PVEXMBX01.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <C246CAC1457055469EF09E3A7AC4E11A4A666658@XAP-PVEXMBX01.xlnx.xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Soren Brinkmann <sorenb@xilinx.com>, "luis@debethencourt.com" <luis@debethencourt.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 13, 2017 at 04:28:11AM +0000, Appana Durga Kedareswara Rao wrote:
> Hi Vinod,
> 
> 	Thanks for the review...
> > 
> > On Sat, Jan 07, 2017 at 12:15:28PM +0530, Kedareswara rao Appana wrote:
> > > Add channel idle state to ensure that dma descriptor is not
> > > submitted when VDMA engine is in progress.
> > 
> > any reason why you want to make your own varible and not use the HW to
> > query
> > as done earlier. It is not clear to me why that is removed from description
> 
> We need to poll for a bit in the status register to know the dma state.
> We are currently doing that in the driver hot path
> To avoid this using own variables.

It would be worthwhile to document these, down the line people may not
remeber the motivation


-- 
~Vinod
