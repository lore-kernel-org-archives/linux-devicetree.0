From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v4] dma: Add Xilinx AXI Direct Memory Access Engine
 driver support
Date: Thu, 12 Feb 2015 15:04:45 +0530
Message-ID: <20150212093445.GM21387@intel.com>
References: <1413374436-14410-1-git-send-email-sthokal@xilinx.com>
 <3236720.MHeqOodrCV@wuerfel>
 <7dc11ef7ccec49bcb052c30b9aa916c3@BL2FFO11FD044.protection.gbl>
 <1967130.oYyZRWCcEF@wuerfel>
 <add9a23928b44aa48965e993bb17f53b@BL2FFO11FD027.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <add9a23928b44aa48965e993bb17f53b@BL2FFO11FD027.protection.gbl>
Sender: linux-kernel-owner@vger.kernel.org
To: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Srikanth Vemula <svemula@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Srikanth Thokala <sthokal@xilinx.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Michal Simek <michals@xilinx.com>, Anirudha Sarangi <anirudh@xilinx.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 29, 2015 at 11:24:41AM +0000, Appana Durga Kedareswara Rao wrote:
> >  Earlier in the driver we are embedding dma_slave_config into custom
> > structs But Lars suggested to modify it. please refer to the below thread for
> > more details.
> >  http://www.spinics.net/lists/dmaengine/msg00010.html
> >
> >  And later we thought of creating a separate private member in
> > dma_slave_config for sharing additional configuration between slave
> > device and dma engine Or a new dma_ctrl_cmd like
> >  FSLDMA_EXTERNAL_START(http://www.kernelhub.org/?msg=405535&p=2 )
> >
> >  Finally Vinod was ok with the existing suggestion so we dropped the above
> > thought.
> >
> >  @Vinod : Could you please comment on this.
FSLDMA_EXTERNAL_START has been removed, and you cna use the removal as a
guidance of how to solve your issue

Thanks

-- 
~Vinod
