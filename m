From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 2/2] dmaengine: OMAP: Register SDMA controller with
	Device Tree DMA driver
Date: Sat, 9 Feb 2013 10:52:33 +0000
Message-ID: <20130209105233.GI17852@n2100.arm.linux.org.uk>
References: <1360184596-1603-1-git-send-email-jon-hunter@ti.com> <1360184596-1603-3-git-send-email-jon-hunter@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1360184596-1603-3-git-send-email-jon-hunter@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Jon Hunter <jon-hunter@ti.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Tony Lindgren <tony@atomide.com>, Benoit Cousson <b-cousson@ti.com>, Vinod Koul <vinod.koul@intel.com>, device-tree <devicetree-discuss@lists.ozlabs.org>, linux-omap <linux-omap@vger.kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Matt Porter <mporter@ti.com>, Felipe Balbi <balbi@ti.com>, Sourav Poddar <sourav.poddar@ti.com>, Balaji T K <balajitk@ti.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 06, 2013 at 03:03:16PM -0600, Jon Hunter wrote:
> @@ -673,7 +702,7 @@ static int omap_dma_init(void)
>  {
>  	int rc = platform_driver_register(&omap_dma_driver);
>  
> -	if (rc == 0) {
> +	if ((rc == 0) && (!of_have_populated_dt())) {

Looks good, the worst I can find is this over-use of parens...
