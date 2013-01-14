From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 4/4] mfd: tps65090: remove suspend/resume callbacks
Date: Mon, 14 Jan 2013 22:42:36 +0900
Message-ID: <20130114134235.GD25037@opensource.wolfsonmicro.com>
References: <1356686981-4152-1-git-send-email-ldewangan@nvidia.com>
 <1356686981-4152-5-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1356686981-4152-5-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: sameo@linux.intel.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, lrg@ti.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 28, 2012 at 02:59:41PM +0530, Laxman Dewangan wrote:
> The tps65090 mfd driver implement the suspend/resume callbacks
> which just disable and enable irqs in suspend/resume respectively.
> 
> This operation is already done in irq suspend and irq_resume and
> hence it is not require to implement the same in the driver.
> 
> Remove this non-require code.

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
