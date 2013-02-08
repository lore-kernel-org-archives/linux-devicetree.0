From: Jon Hunter <jon-hunter@ti.com>
Subject: Re: [PATCH 2/2] dmaengine: OMAP: Register SDMA controller with Device
 Tree DMA driver
Date: Fri, 8 Feb 2013 09:23:24 -0600
Message-ID: <5115186C.2070406@ti.com>
References: <1360184596-1603-1-git-send-email-jon-hunter@ti.com> <1360184596-1603-3-git-send-email-jon-hunter@ti.com> <201302071439.13720.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <201302071439.13720.arnd@arndb.de>
Sender: linux-omap-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Tony Lindgren <tony@atomide.com>, Benoit Cousson <b-cousson@ti.com>, Vinod Koul <vinod.koul@intel.com>, Russell King <linux@arm.linux.org.uk>, Matt Porter <mporter@ti.com>, Balaji T K <balajitk@ti.com>, device-tree <devicetree-discuss@lists.ozlabs.org>, Felipe Balbi <balbi@ti.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Sourav Poddar <sourav.poddar@ti.com>, linux-omap <linux-omap@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


On 02/07/2013 08:39 AM, Arnd Bergmann wrote:
> On Wednesday 06 February 2013, Jon Hunter wrote:
>> +static struct of_dma_filter_info info;
> 
> Both members of this structure are constant, so you can just initialize it here,
> and it would be nice to give it a more descriptive name, such as omap_dmadev_info.

No problem. By the way, I see the dma_cap_mask_t is defined as follows ...

typedef struct { DECLARE_BITMAP(bits, DMA_TX_TYPE_END); } dma_cap_mask_t;

Is there a good way to statically initialise this?

Cheers
Jon
