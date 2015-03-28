From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 1/7] dmaengine: of_dma: Support for DMA routers
Date: Sat, 28 Mar 2015 02:44:46 +0100
Message-ID: <201503280244.46961.arnd@arndb.de>
References: <1427459213-14611-1-git-send-email-peter.ujfalusi@ti.com> <1427459213-14611-2-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1427459213-14611-2-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: vinod.koul@intel.com, tony@atomide.com, linux@arm.linux.org.uk, grant.likely@linaro.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, nm@ti.com
List-Id: devicetree@vger.kernel.org

On Friday 27 March 2015, Peter Ujfalusi wrote:
> +Required property:
> +- dma-device:          phandle of the DMA controller. The router is modifying
> +                       the DMA requests for this controller.

This property seems rather specific to the case at hand, I would expect that
one might also see routers like this that are connected to more than one
dma-device, so maybe make it a list?

It might also be better to name this as 'dma-controllers' or 'dma-masters',
as it is not entirely obvious (without referencing the binding document)
whether a dma device refers to the slave or the master.

	Arnd
