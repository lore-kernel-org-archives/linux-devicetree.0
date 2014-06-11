From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH] dma: at_xdmac: creation of the atmel eXtended DMA
 Controller driver
Date: Wed, 11 Jun 2014 11:04:21 +0200
Message-ID: <4675005.TnHGXm92zV@wuerfel>
References: <1401179736-8235-1-git-send-email-ludovic.desroches@atmel.com>
 <8696483.Dng95cR5kK@wuerfel>
 <20140611081248.GS1701@ldesroches-Latitude-E6320>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140611081248.GS1701@ldesroches-Latitude-E6320>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, vinod.koul@intel.com, nicolas.ferre@atmel.com, Ludovic Desroches <ludovic.desroches@atmel.com>, dmaengine@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>, plagnioj@jcrosoft.com, dan.j.williams@intel.com
List-Id: devicetree@vger.kernel.org

On Wednesday 11 June 2014 10:12:48 Ludovic Desroches wrote:
> I have noticed that the filter function was missing in the RFC version.
> I had to add it since there are two xdma controllers in the system.
> 
> static bool at_xdmac_filter(struct dma_chan *chan, void *slave)                 
> {                                                                               
>         struct device *dma_dev = (struct device *) slave;                       
>                                                                                 
>         if (dma_dev == chan->device->dev)                                       
>                 return true;                                                    
>         else                                                                    
>                 return false;                                                   
> }

Yes, looks good. Note that you can save the typecast and just do

	struct device *dma_dev = slave; 
	if (chan->device->dev == dma_dev)
		...

or shorter

	if (chan->device->dev == slave)
		...

or shortest:

	return chan->device->dev == slave;

I find the shorter versions more readable here, but any of these
are correct.

	Arnd
