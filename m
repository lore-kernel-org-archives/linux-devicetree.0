From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] of: dma: fix typos in generic dma binding definition
Date: Wed, 19 Sep 2012 15:26:33 +0000
Message-ID: <201209191526.33642.arnd@arndb.de>
References: <1348066188-17937-1-git-send-email-mporter@ti.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1348066188-17937-1-git-send-email-mporter@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Matt Porter <mporter@ti.com>
Cc: Jon Hunter <jon-hunter@ti.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Linux OMAP List <linux-omap@vger.kernel.org>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Stephen Warren <swarren@nvidia.com>, Grant Likely <grant.likely@secretlab.ca>, Benoit Cousson <b-cousson@ti.com>, Russell King <linux@arm.linux.org.uk>, Rob Herring <rob.herring@calxeda.com>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <djbw@fb.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 19 September 2012, Matt Porter wrote:
> 
> Some semicolons were left out in the examples.
> 
> The #dma-channels and #dma-requests properties have a prefix
> that is, by convention, reserved for cell size properties.
> Rename those properties to dma-channels and dma-requests.
> 
> Signed-off-by: Matt Porter <mporter@ti.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
